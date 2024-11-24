#!/bin/zsh

set -eu

# see: https://macos-defaults.com/

# ==== Finder ====

# Show all file extensions inside the Finder
defaults write -g "AppleShowAllExtensions" -bool "true"

# Show hidden files inside the Finder
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"

# Show pass bar
defaults write com.apple.finder "ShowPathbar" -bool "true"

# Keep folders on top
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"

# ==== Desktop ===

# Hide all icons on Desktop
defaults write com.apple.finder "CreateDesktop" -bool "false"

# A restart of Dock is required to apply Finder and Desktop changes
killall Finder

# ==== Dock ====

# Autohide the Dock when the mouse is out
defaults write com.apple.dock "autohide" -bool "true"

# Do not display recent apps in the Dock
defaults write com.apple.dock "show-recents" -bool "false"

# Scroll up on a Dock icon to show all Space's opened windows, or open stack
defaults write com.apple.dock "scroll-to-open" -bool "true"

# ==== Mission Control ====

# Keep the Spaces arrangement, Do not rearrange Spaces automatically
defaults write com.apple.dock "mru-spaces" -bool "false"

# A restart of Dock is required to apply Dock and Mission Control changes
killall Dock

# === Mouse ===

# Set movement speed of the mouse cursor, default is 1
defaults write -g com.apple.mouse.scaling "3"
defaults write -g com.apple.trackpad.scaling "3"

# === Keyboard ===

# Increase key repeat rate
defaults write -g "InitialKeyRepeat" -int "12"
defaults write -g "KeyRepeat" -int "2"

# A restart of your Mac is required to apply Mouse and Keyboard changes
# sudo shutdown -r now
