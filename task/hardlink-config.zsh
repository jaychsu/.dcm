#!/bin/zsh

files=()

RED='\e[0;31m'
GREEN='\e[0;32m'
YELLOW='\e[0;33m'
RESET='\e[0m'

get_files() {
  find . \
    ! '(' -path '*/.git' -prune ')' \
    ! '(' -path '*/.DS_Store' -prune ')' \
    -type f \
    -print0
}

link_file() {
  file="$1"
  dirname=$(dirname "$file")
  if [[ ! -d $HOME/$dirname ]]; then
    mkdir -p "$HOME/$dirname"
  fi

  # Use hardlink in Cygwin since NTFS does not support symbolic link for file
  if [[ $OSTYPE == cygwin ]]; then
    ln "$PWD/$file" "$HOME/$file"
  else
    ln -sfn "$PWD/$file" "$HOME/$file"
  fi
}

cd ../dotfile
git submodule update --init

while IFS= read -r -d '' file; do
  # Strip the "./" prefix
  files+=("${file:2}")
done < <(get_files)

for file in "${files[@]}"; do
  if [[ ! -e $HOME/$file ]]; then
    echo -e "${GREEN}Linking${RESET} ~/$file"
    link_file "$file"
    continue
  fi

  if cmp -s "$HOME/$file" "$file"; then
    echo -e "${GREEN}Identical${RESET} ~/$file"
    rm -rf "$HOME/$file"
    link_file "$file"
  else
    echo -n "Overwrite ~/$file? [yn] "
    while read -s -r answer; do
      if [[ $answer == [YyNn] ]]; then
        [[ $answer == [Yy] ]] && overwrite=0
        [[ $answer == [Nn] ]] && overwrite=1
        break
      fi
    done

    if [[ $overwrite == 0 ]]; then
      echo -e "\n${RED}Renaming${RESET} ~/$file to ~/$file.original"
      mv "$HOME/$file" "$HOME/$file.original"
      echo -e "\n${GREEN}Linking${RESET} ~/$file"
      link_file "$file"
    else
      echo -e "\n${YELLOW}Skipping${RESET} ~/$file"
    fi
  fi
done

# vim: set ft=sh:
