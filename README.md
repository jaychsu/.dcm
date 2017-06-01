Development Config Manager(.dcm)
=====

Just a backup of my configurations and some automated scripts to build env.

## Start to build env on **macOS**

status: **Stable**

1. Install [Xcode](http://developer.apple.com/xcode/) first please.
2. Run command:

    ```curl -L https://raw.githubusercontent.com/jaychsu/.dcm/master/install.sh | bash -s stable```

3. Put sensitive configs in `~/.sensitive`, and then these files are automatically sourced if the extension is `.zsh`. (REF: [.zshrc](./dotfile/.zshrc))

## Start to build env on **Ubuntu {14.04,16.04} LTS**

status: **Beta**

1. Just runs command:

    ```curl -L https://raw.githubusercontent.com/jaychsu/.dcm/master/install-on-ubuntu.sh | bash -s stable```

2. Put sensitive configs in `~/.sensitive`, and then these files are automatically sourced if the extension is `.zsh`. (REF: [.zshrc](./dotfile/.zshrc))

## What will happen

1. Install and use zsh as shell, and config it with [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting).
2. Add some powerful aliases for [shell](./dotfile/.zsh/alias.zsh) and [git](./dotfile/.gitconfig).
3. The following will be installed or updated:

    Packager | Software
    --- | ---
    **DIRECT** | homebrew, rvm
    homebrew | zsh, git, mongodb, postgresql, redis, tree, imagemagick, gnupg, gnupg2, libxml2, libxslt, homebrew/dupes/libiconv, libyaml, thefuck, nvm, pyenv, pyenv-virtualenv
    nvm | node, npm, webpack, webpack-dev-server, gulp, yeoman
    pyenv | python
    rvm | ruby
    gem | bundler, rails

By the way, you may need to change the owner info in [git](./dotfile/.gitconfig).
