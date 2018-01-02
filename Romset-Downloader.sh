#!/bin/bash
################ config ################ 
CONFIGURE(){
DLDIR="~/Downloads/No-Intro"
echo "this script wil download any selected No-Intro romset to $DLDIR"
MAKEDIRS(){
mkdir -p $DLDIR/$SETNAME
cd $DLDIR/$SETNAME
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
mkdir -p $DLDIR/$SETNAME
cd $DLDIR/$SETNAME
}
GAMEBOYADVANCED(){
SETNAME="gba"
echo "Gameboy Advance (All Regions)"
mkdir -p $DLDIR/$SETNAME
cd $DLDIR/$SETNAME
}
GAMEBOYCOLOR(){
SETNAME="gbc"
echo "Gameboy Color (All Regions)"
mkdir -p $DLDIR/$SETNAME
cd $DLDIR/$SETNAME
}
NINTENDO(){
SETNAME="nes"
echo "Nintendo (All Regions)"
mkdir -p $DLDIR/$SETNAME
cd $DLDIR/$SETNAME
}
NINTENDO64(){
SETNAME="n64"
echo "Nintendo 64 (All Regions)"
mkdir -p $DLDIR/$SETNAME
cd $DLDIR/$SETNAME
}
SEGA32(){
SETNAME="sega32x"
echo "Sega 32X (All Regions)"
mkdir -p $DLDIR/$SETNAME
cd $DLDIR/$SETNAME
}
SEGAGAMEGEAR(){
SETNAME="gamegear"
echo "Sega Game Gear (All Regions)"
mkdir -p $DLDIR/$SETNAME
cd $DLDIR/$SETNAME
}
SEGAGENESIS(){
SETNAME="genesis"
echo "Sega Genesis (All Regions)"
mkdir -p $DLDIR/$SETNAME
cd $DLDIR/$SETNAME
}
SEGAMASTERSYSTEM(){
SETNAME="mastersystem"
echo "Sega Master System (All Regions)"
mkdir -p $DLDIR/$SETNAME
cd $DLDIR/$SETNAME
}
SUPERNINTENDO(){
SETNAME="snes"
echo "Super Nintendo (All Regions)"
mkdir -p $DLDIR/$SETNAME
cd $DLDIR/$SETNAME
}
WONDERSWAN(){
SETNAME="wonderswan"
echo "WonderSwan And Color (All Regions)"
mkdir -p $DLDIR/$SETNAME
cd $DLDIR/$SETNAME
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
