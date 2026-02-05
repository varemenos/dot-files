#!/bin/bash
if [ "$__SYSTEM_TYPE" = "Darwin" ]; then
  __log_debug "Setting up macOS"

  # ~/.macos — https://mths.be/macos credits where it's due

  # Close any open System Preferences panes, to prevent them from overriding
  # settings we’re about to change
  osascript -e 'tell application "System Preferences" to quit'

  # Ask for the administrator password upfront
  sudo -v

  # Keep-alive: update existing `sudo` time stamp until `.macos` has finished
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

  #=========== UI/UX

  # Disable the sound effects on boot
  sudo nvram SystemAudioVolume=" "

  # Always show scrollbars
  defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

  # Disable the over-the-top focus ring animation
  defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false

  # Increase window resize speed for Cocoa applications
  defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

  # Expand save panel by default
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

  # Save to disk (not to iCloud) by default
  defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

  # Automatically quit printer app once the print jobs complete
  defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

  # Disable the “Are you sure you want to open this application?” dialog
  defaults write com.apple.LaunchServices LSQuarantine -bool false

  # Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
  /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -r -domain local -domain system -domain user

  # Set Help Viewer windows to non-floating mode
  defaults write com.apple.helpviewer DevMode -bool true

  # Save screenshots to the desktop
  defaults write com.apple.screencapture location -string "${HOME}/Downloads/Screenshots/"

  # Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
  defaults write com.apple.screencapture type -string "png"

  # Disable shadow in screenshots
  defaults write com.apple.screencapture disable-shadow -bool true

  # Enable subpixel font rendering on non-Apple LCDs
  # Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
  defaults write NSGlobalDomain AppleFontSmoothing -int 1

  #=========== Keyboard

  # Disable automatic capitalization as it’s annoying when typing code
  defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

  # Disable smart dashes as they’re annoying when typing code
  defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

  # Disable automatic period substitution as it’s annoying when typing code
  defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

  # Disable smart quotes as they’re annoying when typing code
  defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

  # Disable auto-correct
  defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

  # Set keyboard repeat rate
  defaults write NSGlobalDomain KeyRepeat -int 5
  defaults write NSGlobalDomain InitialKeyRepeat -int 20

  # Set language and text formats
  # Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
  # `Inches`, `en_GB` with `en_US`, and `true` with `false`.
  defaults write NSGlobalDomain AppleLanguages -array "en-SE" "el-SE"
  defaults write NSGlobalDomain AppleLocale -string "en_SE@currency=EUR"
  defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
  defaults write NSGlobalDomain AppleMetricUnits -bool true

  # Show language menu in the top right corner of the boot screen
  sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true

  #=========== Trackpad

  # enable tap to click for this user and for the login screen
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
  defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
  defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
  defaults write NSGlobalDomain com.apple.swipescrolldirection = 1

  #=========== Power

  # Disable machine sleep while charging
  sudo pmset -c sleep 60

  # Restart automatically if the computer freezes
  sudo systemsetup -setrestartfreeze on

  # Sleep the display after 15 minutes
  sudo pmset -a sleep 60
  sudo pmset -a displaysleep 15

  # Set machine sleep to 5 minutes on battery
  sudo pmset -b sleep 5

  #=========== Finder

  # Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
  defaults write com.apple.finder QuitMenuItem -bool true

  # Finder: disable window animations and Get Info animations
  defaults write com.apple.finder DisableAllAnimations -bool true

  # Finder: show all filename extensions
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true

  # Finder: show status bar
  defaults write com.apple.finder ShowStatusBar -bool true

  # Finder: show path bar
  defaults write com.apple.finder ShowPathbar -bool true

  # Display full POSIX path as Finder window title
  defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

  # Keep folders on top when sorting by name
  defaults write com.apple.finder _FXSortFoldersFirst -bool true

  # Disable the warning when changing a file extension
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

  # Use list view in all Finder windows by default
  # Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
  defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

  # Don't show recent applications in Dock
  defaults write com.apple.dock "show-recents" -bool false

  # Enable auto-hide
  defaults write com.apple.dock "autohide" -bool true

  # Hide Spotlight from Control Center
  defaults write com.apple.Spotlight MenuItemHidden -bool true

  # Do not rearrange Spaces based on most recent use
  defaults write com.apple.dock "mru-spaces" -bool false

  # Do not group windows by application in Mission Control
  defaults write com.apple.dock "expose-group-apps" -bool false

  # Reset all Hot Corners to No Action (0)
  defaults write com.apple.dock "wvous-tl-corner" -int 0
  defaults write com.apple.dock "wvous-tr-corner" -int 0
  defaults write com.apple.dock "wvous-bl-corner" -int 0
  defaults write com.apple.dock "wvous-br-corner" -int 0

  # Set Control Center visibility (2=MenuBar, 8=ControlCenter, 16=Default, 18=Both, 0=Hidden)

  # Bluetooth: Show in Menu Bar
  defaults write com.apple.controlcenter "Bluetooth" -int 2

  # Display & Sound: Show in Control Center
  defaults write com.apple.controlcenter "Display" -int 16
  defaults write com.apple.controlcenter "Sound" -int 16

  # Focus Modes: Show in Control Center
  defaults write com.apple.controlcenter "FocusModes" -int 16

  # Now Playing: Hidden
  defaults write com.apple.controlcenter "NowPlaying" -int 0

  # Screen Mirroring: Show in Both Menu Bar and Control Center
  defaults write com.apple.controlcenter "ScreenMirroring" -int 18

  # Siri & Spotlight: Show in Control Center
  defaults write com.apple.controlcenter "Siri" -int 8
  defaults write com.apple.controlcenter "Spotlight" -int 8

  # Weather: Show in Menu Bar
  defaults write com.apple.controlcenter "Weather" -int 2


  # Show the /Volumes folder
  sudo chflags nohidden /Volumes

  # Expand the following File Info panes:
  # “General”, “Open with”, and “Sharing & Permissions”
  defaults write com.apple.finder FXInfoPanesExpanded -dict \
    General -bool true \
    OpenWith -bool true \
    Privileges -bool true

  __log_debug "Done setting up macOS"
  __log_debug "You might need to Ctrl+C if the script seems stuck"
fi
