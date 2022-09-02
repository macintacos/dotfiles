set fish_cursor_default block
set fish_cursor_visual block
set fish_cursor_insert line
set fish_cursor_replace_one underscore

fish_vi_key_bindings
fish_vi_cursor

# Change the way mode looks in the prompt
# FIXME: When this issue is resolved, see if you can remove the `__fish_cursor_xterm` hacks.
#        https://github.com/fish-shell/fish-shell/issues/9172
#
#        Workaround was found in this issue: https://github.com/fish-shell/fish-shell/issues/8981#issuecomment-1191576764
function fish_mode_prompt
    if test "$fish_key_bindings" != fish_default_key_bindings
        set --local vi_mode_color
        set --local vi_mode_symbol
        switch $fish_bind_mode
            case default
                set vi_mode_color (set_color --reverse magenta)
                set vi_mode_symbol N
                __fish_cursor_xterm block # WORKAROUND
            case insert
                set vi_mode_color (set_color --reverse green)
                set vi_mode_symbol I
                __fish_cursor_xterm line # WORKAROUND
            case replace replace_one
                set vi_mode_color (set_color --reverse red)
                set vi_mode_symbol R
                __fish_cursor_xterm underscore # WORKAROUND
            case visual
                set vi_mode_color (set_color --reverse cyan)
                set vi_mode_symbol V
                __fish_cursor_xterm block # WORKAROUND
        end
        string unescape "$vi_mode_color $vi_mode_symbol \x1b[0m "
    end
end
