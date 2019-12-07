set fish_prompt_pwd_dir_length 0  # don't need cropping

function fish_prompt  --description 'Write out the prompt'
    set -l color_cwd
    if set -q fish_color_cwd_root; and test (id -u) -eq 0
        set color_cwd $fish_color_cwd_root
    else
        set color_cwd $fish_color_cwd
    end

    # Line 1
    echo -s (set_color yellow) (id -un) (set_color normal) " at " \
      (set_color magenta) (prompt_hostname) (set_color normal) " in " \
      (set_color $color_cwd) (prompt_pwd) (set_color normal)

    # Line 2
    echo "↪ "
end

function fish_right_prompt  --description 'Write out the right-side prompt'
    set -l last_status $status
    test $last_status -ne 0
    and echo (set_color $fish_color_error)"[$last_status]"(set_color normal)
end
