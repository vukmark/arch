#!/bin/bash

# Update package database
sudo pacman -Syu

# Install Apache
sudo pacman -S --noconfirm apache

# Install MariaDB (MySQL)
sudo pacman -S --noconfirm mariadb

# Start and enable services
sudo systemctl start httpd mariadb
sudo systemctl enable httpd mariadb

# Install PHP
sudo pacman -S --noconfirm php php-apache
sudo pacman -S --noconfirm php-imagick

# Uncomment the PHP module in Apache configuration
sudo sed -i 's/^#\(LoadModule php_module modules\/libphp\.so\)/\1/' /etc/httpd/conf/httpd.conf

# Restart Apache to apply changes
sudo systemctl restart httpd


# Display a message indicating the setup is complete
echo "LAMP stack installation on Arch Linux is complete."
echo "You can test your setup by visiting http://localhost/"
