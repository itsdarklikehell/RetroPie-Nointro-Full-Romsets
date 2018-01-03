#!/bin/bash
################ config ################ 
CONFIGURE(){
DLDIR="~/Downloads/No-Intro"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo "This script wil download any selected No-Intro romset to $DLDIR"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
MAKEDIRS(){
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo "Making directory $DLDIR/$SETNAME"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
mkdir -p $DLDIR/$SETNAME
}
DLSET(){
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo "Downloading $SETLINK to $DLDIR/$SETNAME"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
wget $SETLINK -O $DLDIR/$SETNAME/$SETNAME.rar
}
EXTRACT(){
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo "Extracting $SETNAME to $DLDIR/$SETNAME"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
#unrar command [-switch_1 -switch_N] archive [files...] [path...]
unrar $DLDIR/$SETNAME/$SETNAME.rar $DLDIR/$SETNAME/
CLEANUP
}
CLEANUP(){
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo "Removing $SETNAME.rar from $DLDIR/$SETNAME"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
rm $DLDIR/$SETNAME/$SETNAME.rar
}
}
CONFIGURE
################ config end ################
C64(){
SETNAME="c64"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo "Commodore 64 (All Regions) $DLDIR/$SETNAME"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
MAKEDIRS
SETLINK="https://download.loveroms.com/roms/sets/Commodore%20-%2064.rar"
DLSET
EXTRACT
}
GAMEBOY(){
SETNAME="gameboy"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo "Gameboy (All Regions) $DLDIR/$SETNAME"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
MAKEDIRS
SETLINK="https://download.loveroms.com/roms/sets/Nintendo%20-%20Game%20Boy.rar"
DLSET
EXTRACT
}
GAMEBOYADVANCED(){
SETNAME="gba"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo "Gameboy Advance (All Regions) $DLDIR/$SETNAME"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
MAKEDIRS
SETLINK=""
DLSET
EXTRACT
}
GAMEBOYCOLOR(){
SETNAME="gbc"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo "Gameboy Color (All Regions) $DLDIR/$SETNAME"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
MAKEDIRS
SETLINK="https://download.loveroms.com/roms/sets/Nintendo%20-%20Game%20Boy%20Color.rar"
DLSET
EXTRACT
}
NINTENDO(){
SETNAME="nes"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo "Nintendo (All Regions) $DLDIR/$SETNAME"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
MAKEDIRS
SETLINK="https://download.loveroms.com/roms/sets/Nintendo%20-%20Nintendo%20Entertainment%20System.rar"
DLSET
EXTRACT
}
NINTENDO64(){
SETNAME="n64"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo "Nintendo 64 (All Regions) $DLDIR/$SETNAME"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
MAKEDIRS
SETLINK=""
DLSET
EXTRACT
}
SEGA32(){
SETNAME="sega32x"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo "Sega 32X (All Regions) $DLDIR/$SETNAME"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
MAKEDIRS
SETLINK="https://download.loveroms.com/roms/sets/Sega%20-%2032X.rar"
DLSET
EXTRACT
}
SEGAGAMEGEAR(){
SETNAME="gamegear"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo "Sega Game Gear (All Regions) $DLDIR/$SETNAME"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
MAKEDIRS
SETLINK="https://download.loveroms.com/roms/sets/Sega%20-%20Game%20Gear.rar"
DLSET
EXTRACT
}
SEGAGENESIS(){
SETNAME="genesis"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo "Sega Genesis (All Regions) $DLDIR/$SETNAME"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
MAKEDIRS
SETLINK="https://download.loveroms.com/roms/sets/Sega%20-%20Mega%20Drive%20-%20Genesis.rar"
DLSET
EXTRACT
}
SEGAMASTERSYSTEM(){
SETNAME="mastersystem"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo "Sega Master System (All Regions) $DLDIR/$SETNAME"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
MAKEDIRS
SETLINK="https://download.loveroms.com/roms/sets/Sega%20-%20Master%20System%20-%20Mark%20III.rar"
DLSET
EXTRACT
}
SUPERNINTENDO(){
SETNAME="snes"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo "Super Nintendo (All Regions) $DLDIR/$SETNAME"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
MAKEDIRS
SETLINK="https://download.loveroms.com/roms/sets/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System.rar"
DLSET
EXTRACT
}
WONDERSWAN(){
SETNAME="wonderswan"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo "WonderSwan And Color (All Regions) $DLDIR/$SETNAME"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
MAKEDIRS
SETLINK="https://download.loveroms.com/roms/sets/Bandai%20-%20WonderSwan%20and%20Color.rar"
DLSET
EXTRACT
}
################ execution ################
C64
GAMEBOY
#GAMEBOYADVANCED
GAMEBOYCOLOR
NINTENDO
#NINTENDO64
SEGA32
SEGAGAMEGEAR
SEGAGENESIS
SEGAMASTERSYSTEM
SUPERNINTENDO
WONDERSWAN