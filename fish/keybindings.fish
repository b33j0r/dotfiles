function fish_user_key_bindings
    fish_hybrid_key_bindings

    # bind \n backward-delete-char
    # bind -M insert \n backward-delete-char
    # bind -m insert \n backward-delete-char

    bind \eb 'prevd-or-backward-word'
    bind \ef 'nextd-or-forward-word'
end
