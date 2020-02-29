Development Config Manager(.dcm)
=====

Just a backup of my configurations and some automated scripts to build env.

## Quick Start <a href="./install.sh"><img src="https://img.shields.io/badge/status-stable-green.svg?style=flat" alt="status:stable"></a>

1. Install [Xcode](http://developer.apple.com/xcode/) first please.
2. Run command:

    ```curl -L https://raw.githubusercontent.com/jaychsu/.dcm/master/install.sh | bash -s stable```

3. Put shared sensitive configs in `~/.sensitive`, and then these files are automatically sourced if the extension is `.zsh`. (REF: [.zshrc](./dotfile/.zshrc))
4. With same logic, you can also put personal custom configs in `~/.zsh_custom`
