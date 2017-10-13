#!/bin/bash

# Colours
BOLD='\033[1m'
RED='\033[91m'
GREEN='\033[92m'
YELLOW='\033[93m'
BLUE='\033[94m'
ENDC='\033[0m'

echo
echo -e "${BOLD}Mac Bootstrap${ENDC}"
echo

# Prompt the user for their sudo password
sudo -v

# Install Homebrew
if ! which brew > /dev/null 2>&1
then
    echo -e "${BLUE}Installing Homebrew${ENDC}"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null
fi

# Install Unison
if ! brew list unison > /dev/null 2>&1
then
    echo -e "${BLUE}Installing Unison.x${ENDC}"
    brew install unison
fi

# Run Unison copying the homebrew data over so we don't have to download it all
# from the internet.
unison /Users/${USER} ssh://hetfield.patsoffice.com//home/${USER} -auto -path Library/Caches/Homebrew -ignore 'Name {Cache*,.Trash*,.VolumeIcon.icns,.HSicon,Temporary*,.Temporary*,TheFindByContentFolder,TheVolumeSettingsFolder,.Metadata,.filler,.idsff,.Spotlight,.DS_Store,.CFUserTextEncoding}'
