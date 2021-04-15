#!/bin/bash
# These functions break when you format the file. DON'T FORMAT IT.

# Inspired by: https://seb.jambor.dev/posts/improving-shell-workflows-with-fzf/
# ghprco -> gh pr checkout
function ghprco() {
  local jq_template pr_number gh_api_call

  gh_api_call=$(gh api 'repos/:owner/:repo/pulls')

  if [ ${#gh_api_call[@]} -eq 2 ]; then
    echo "No PRs are open in this repository."
  else
    jq_template='"'\
'#\(.number) - \(.title) ~~\(.head.label)'\
'\t'\
'[#\(.number)](\(.html_url)) - Author: `\(.user.login)`\n\n'\
'Created: `\(.created_at)`\n\n'\
'----\n\n'\
'\(.body)'\
'"'

    pr_line=$(
      jq ".[] | $jq_template" <<<"$gh_api_call" |
      gsed -e 's/"\(.*\)"/\1/' -e 's/\\t/\t/' -e 's/\n\n/\n/' |
      fzf \
        --with-nth=1 \
        --delimiter='\t' \
        --preview='echo -e {2} | glow -s dark -' \
        --preview-window=top:60%:wrap \
        --height 80% \
        --bind tab:down |
      gsed 's/^\(#[0-9]\+.*\t\).*/\1/'
    )

    if [ -n "$pr_line" ]; then
      local pr_number=$(echo "$pr_line" | gsed 's/^#\([0-9]\+\).*/\1/')
      pr_title=$(echo "$pr_line" | gsed 's/^#[0-9]\+ - \(.*\) ~~.*/\1/')
      pr_origin=$(echo "$pr_line" | gsed 's/^#[0-9]\+ - .* ~~\(.*\):.*/\1/')
      pr_branch=$(echo "$pr_line" | gsed 's/^#[0-9]\+ - .* ~~.*:\(.*\)\t/\1/')
      pr_dir_target="review-#$pr_number"

      if $(git rev-parse --is-inside-work-tree); then
        # We're inside a worktree so we should try making sure that we put things in the right place
        git worktree add "$(dirname $(git rev-parse --show-toplevel))"/"$pr_dir_target" $pr_branch
      else
        git worktree add ./"$pr_dir_target" $pr_branch
      fi

      if [ $? -eq 128 ]; then
        # The last command failed, so let's naively assume that it just exists and we need to 'cd' to it
        echo "Opening the local worktree that was already created..."
        if $(git rev-parse --is-inside-work-tree); then
          cd "$(dirname $(git rev-parse --show-toplevel))"/"$pr_dir_target"
          git fetch
        else
          cd "$pr_dir_target"
          git fetch
        fi
      fi
    fi
  fi
}