# Sets reasonable macOS defaults.
#
#
# I took some ideas from this brilliant privacy guide.
#   https://github.com/drduh/macOS-Security-and-Privacy-Guide
#
# Or, in other words, set shit how I like in macOS.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.macos
#
# Run ./set-defaults.sh and you'll be good to go.


# Set your screen to lock as soon as the screensaver starts:
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Expose hidden files and Library folder in Finder:
defaults write com.apple.finder AppleShowAllFiles -bool true
chflags nohidden ~/Library

# Show all filename extensions (so that "Evil.jpg.app" cannot masquerade easily).
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Don't default to saving documents to iCloud:
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable crash reporter (the dialog which appears after an application crashes and prompts to report the problem to Apple):
defaults write com.apple.CrashReporter DialogType none

# Disable Bonjour multicast advertisements:
echo "Disable Bonjour multicast advertisements:"
sudo defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool YES

# Enable the firewall with logging and stealth mode:
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on

# Configure Firewall to prevent built-in software as well as code-signed, downloaded software from being whitelisted automatically:
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp off

########## BE CAREFULL WITH THIS ONE
#   Enable FileVault
#   If you can remember the password, there's no reason to save the recovery key. 
#   However, all encrypted data will be lost forever if without either the password or recovery key.
#
#   sudo fdesetup enable
#
#   Enforce system hibernation. This will store the ram on the hard-drive in standby.
sudo pmset -a hibernatemode 25
#
# 
#   Evict FileVault keys from memory instead of traditional sleep to memory:
#   sudo pmset -a destroyfvkeyonstandby 1
#
#   If you choose to evict FileVault keys in standby mode,
#   you should also modify your standby and power nap settings.
#   Otherwise, your machine may wake while in standby mode
#   and then power off due to the absence of the FileVault key. 
#   sudo pmset -a powernap 0
#   sudo pmset -a standby 0
#   sudo pmset -a standbydelay 0
#   sudo pmset -a autopoweroff 0
########################################
