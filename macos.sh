#!/bin/sh

# based on ~/.osx — https://mths.be/osx
# based on ~/.macos — https://mths.be/macos

set -e
set -u

header "MacOS provision"

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# SSD-specific tweaks                                                         #
###############################################################################

# Disable hibernation (speeds up entering sleep mode)
sudo pmset -a hibernatemode 0

# Disable the sudden motion sensor as it’s not useful for SSDs
sudo pmset -a sms 0

###############################################################################
# OS X Dock, Clock and Preferences                                            #
###############################################################################

# Commit OSX to the dark side
defaults write NSGlobalDomain AppleInterfaceStyle Dark

# Set the timezone; see `sudo systemsetup -listtimezones` for other values
sudo systemsetup -settimezone "Europe/Ljubljana" > /dev/null
# Set the clock settings (System Preferences → Date & Time → Clock)
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM  HH:mm"
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false
defaults write com.apple.menuextra.clock IsAnalog -bool false

# Dock autohide
defaults write com.apple.dock autohide -bool true
# Set Menu Icon sizes and Animation speed
defaults write com.apple.dock tilesize -int 42
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.30
# Set highlight color to green
defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

###############################################################################
# Finder                                                                      #
###############################################################################

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
# Show Hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles YES

###############################################################################
# iTerm 2                                                                     #
###############################################################################

# Don't display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false
# Don't display pane titles
defaults write com.googlecode.iterm2 ShowPaneTitles -bool false

###############################################################################
# Photos                                                                      #
###############################################################################

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

###############################################################################
# Remove unused apps :)                                                       #
###############################################################################

# GarageBand
sudo rm -rf  \
        /Applications/GarageBand.app \
        /Library/Application\ Support/GarageBand \
        /Library/Application\ Support/Logic \
        /Library/Audio/Apple\ Loops \
        /Users/david/Music/GarageBand
