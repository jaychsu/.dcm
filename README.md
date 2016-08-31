Development Config Manager(.dcm)
=====
Just a backup of my configurations and some automated scripts to build env.

## Installation

1. Install [Xcode](http://developer.apple.com/xcode/) first plz.
2. Run command:

  ```curl -L https://raw.githubusercontent.com/jaychsu/.dcm/master/install.sh | bash -s stable```

3. Do following manually:
  - Remove some trivial command added by scripts in [.zshrc](./dotfile/.zshrc).
  - NVM has some issue about `prefix`, and you can solve it with [here](https://github.com/creationix/nvm/commit/1458de72934a33b279ac3cbb9d648295501ae74d).

## What will happen

1. Install and use `zsh` as shell, and config it with [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting).
2. Add some powerful alias for [shell](./dotfile/.zsh/alias.zsh) and [git](./dotfile/.gitconfig).
3. The following will be installed or updated:
  - `brew` and related `tree`.
  - `ruby` and related `rvm`, `gem`, `rails`, `bundler`.
  - `node` and related `nvm`, `kneesocks`, `webpack`, `gulp`, `yeoman`.
  - `python` and related `thefuck`.
  - `git`
  - `mongodb`
  - `postgresql`
  - `redis`

By the way, you may need to change the owner info in [git](./dotfile/.gitconfig).
