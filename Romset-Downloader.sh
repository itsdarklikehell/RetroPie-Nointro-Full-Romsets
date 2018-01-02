#!/bin/bash
################ config ################ 
CONFIGURE(){
DLDIR="~/Downloads/No-Intro"
echo "this script wil download any selected No-Intro romset to $DLDIR"
MAKEDIRS(){
mkdir -p $DLDIR/$SETNAME
}
}
CONFIGURE
################ config end ################
C64(){
SETNAME="c64"
echo "Commodore 64 (All Regions)"
MAKEDIRS
}
GAMEBOY(){
SETNAME="gameboy"
echo "Gameboy (All Regions)"
MAKEDIRS
}
GAMEBOYADVANCED(){
SETNAME="gba"
echo "Gameboy Advance (All Regions)"
MAKEDIRS
}
GAMEBOYCOLOR(){
SETNAME="gbc"
echo "Gameboy Color (All Regions)"
MAKEDIRS
}
NINTENDO(){
SETNAME="nes"
echo "Nintendo (All Regions)"
MAKEDIRS
}
NINTENDO64(){
SETNAME="n64"
echo "Nintendo 64 (All Regions)"
MAKEDIRS
}
SEGA32(){
SETNAME="sega32x"
echo "Sega 32X (All Regions)"
MAKEDIRS
}
SEGAGAMEGEAR(){
SETNAME="gamegear"
echo "Sega Game Gear (All Regions)"
MAKEDIRS
}
SEGAGENESIS(){
SETNAME="genesis"
echo "Sega Genesis (All Regions)"
MAKEDIRS
}
SEGAMASTERSYSTEM(){
SETNAME="mastersystem"
echo "Sega Master System (All Regions)"
MAKEDIRS
}
SUPERNINTENDO(){
SETNAME="snes"
echo "Super Nintendo (All Regions)"
MAKEDIRS
}
WONDERSWAN(){
SETNAME="wonderswan"
echo "WonderSwan And Color (All Regions)"
MAKEDIRS
}
################ execution ################
C64
GAMEBOY
GAMEBOYADVANCED
GAMEBOYCOLOR
NINTENDO
NINTENDO64
SEGA32
SEGAGAMEGEAR
SEGAGENESIS
SEGAMASTERSYSTEM
SUPERNINTENDO
WONDERSWAN
