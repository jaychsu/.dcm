Development Config Manager(.dcm)
=====
An automated script to build development environment.

## Installation

```
cd && git clone --recursive git@github.com:jaychsu/.dcm.git && .dcm/install.zsh
```

## What will happen

1. Install and use `zsh` as shell, and config it with [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting).
2. Add some powerful alias for [shell](./dotfile/.zsh/alias.zsh) and [git](./dotfile/.gitconfig).
3. The following will be installed or updated:
  - `brew` and related.
  - `node` and related.
  - `ruby` and related.

By the way, you may need to change the owner info in [`variable.zsh`](./dotfile/.zsh/variable.zsh).
