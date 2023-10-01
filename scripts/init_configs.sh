# List of dotfiles to symlink
#!/bin/bash

dotfiles_dir="$HOME/arch_vukmark/dotfiles"  # Adjust the path to your dotfiles directory

dotfiles=(
    .vimrc
    .zshrc
    # Add more dotfiles here
)

for file in "${dotfiles[@]}"; do
    # Check if the real file exists
    if [ -e "$HOME/$file" ]; then
        # Backup the existing file
        mv "$HOME/$file" "$HOME/${file}.backup"
        echo "Backed up $file to ${file}.backup"
    fi

    # Create the symlink
    ln -s "$dotfiles_dir/$file" "$HOME/$file"
    echo "Created symlink for $file"
done
