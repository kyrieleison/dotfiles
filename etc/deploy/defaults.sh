#!/bin/zsh

# see: https://macos-defaults.com/

# Show hidden files and folders in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true

# Hide the file in Desktop
defaults write com.apple.finder CreateDesktop -bool false

# Select text in QuickLock
defaults write com.apple.finder QLEnableTextSelection -bool true

killall Finder

# Automatically hide or show the Dock
defaults write com.apple.dock autohide -bool true

# Hide recent apps in the Dock
defaults write com.apple.dock show-recents -bool false

# Wipe all app icons from the Dock
defaults write com.apple.dock persistent-apps -array

# Add scroll gesture in the Dock
defaults write com.apple.dock scroll-to-open -bool true

# Set the icon size
defaults write com.apple.dock tilesize -int 50

killall Dock

# Automatic check for updates
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Increase key repeat rate
defaults write -g InitialKeyRepeat -int 12
defaults write -g KeyRepeat -int 2

# Increase mouse cursor speed
defaults write -g com.apple.mouse.scaling 3
defaults write -g com.apple.trackpad.scaling 1.5

# sudo shutdown -r now
