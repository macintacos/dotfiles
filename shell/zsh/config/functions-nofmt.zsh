#!/bin/bash
# These functions break when you format the file. DON'T FORMAT IT.

# Inspired by: https://seb.jambor.dev/posts/improving-shell-workflows-with-fzf/
# ghprco -> gh pr checkout
function pr-checkout() {
  local jq_template pr_number gh_api_call

  gh_api_call=$(gh api 'repos/:owner/:repo/pulls')

  if [ ${#gh_api_call[@]} -eq 2 ]; then
    echo "No PRs are open in this repository."
  else
    jq_template='"'\
'#\(.number) - \(.title)'\
'\t'\
'[#\(.number)](\(.html_url)) - Author: `\(.user.login)`\n\n'\
'Created: `\(.created_at)`\n\n'\
'----\n\n'\
'\(.body)'\
'"'

    pr_number=$(
      jq ".[] | $jq_template" <<<"$gh_api_call" |
      gsed -e 's/"\(.*\)"/\1/' -e 's/\\t/\t/' -e 's/\n\n/\n/' |
      fzf \
        --with-nth=1 \
        --delimiter='\t' \
        --preview='echo -e {2} | glow -s dark -' \
        --preview-window=top:60%:wrap \
        --height 80% \
        --bind tab:down |
      gsed 's/^#\([0-9]\+\).*/\1/'
    )

    if [ -n "$pr_number" ]; then
      gh pr checkout "$pr_number"
    fi
  fi
}
