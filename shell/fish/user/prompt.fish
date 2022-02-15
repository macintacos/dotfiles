fish_vi_key_bindings

function fish_mode_prompt
    if test "$fish_key_bindings" != fish_default_key_bindings
        set --local vi_mode_color
        set --local vi_mode_symbol
        switch $fish_bind_mode
            case default
                set vi_mode_color (set_color --reverse magenta)
                set vi_mode_symbol N
            case insert
                set vi_mode_color (set_color --reverse green)
                set vi_mode_symbol I
            case replace replace_one
                set vi_mode_color (set_color --reverse red)
                set vi_mode_symbol R
            case visual
                set vi_mode_color (set_color --reverse cyan)
                set vi_mode_symbol V
        end
        string unescape "$vi_mode_color $vi_mode_symbol \x1b[0m "
    end
end

set hydro_color_pwd green -d
set hydro_color_git brblack
set hydro_color_prompt brblack

# Tide
set --universal tide_left_prompt_items pwd git
set --universal tide_left_prompt_suffix " \$"
set --universal tide_git_icon ""
set --universal tide_pwd_color_dirs normal
set --universal tide_pwd_color_anchors normal
