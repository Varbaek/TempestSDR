#!/bin/bash
# The file was made for 64 bit Ubuntu
# gcc-multilib is installed for cross-compilation for 32 bit Linux
# mingw-w64-bin_x86_64-linux_20111101_sezero.tar.gz in opt/cross_win64 for Windows x64 target from http://kent.dl.sourceforge.net/project/mingw-w64/Toolchains%20targetting%20Win64/Personal%20Builds/sezero_4.5_20111101/
# mingw-w32-bin_x86_64-linux_20111101_sezero.tar.gz in opt/cross_win86 for Windows x86 target from http://kent.dl.sourceforge.net/project/mingw-w64/Toolchains%20targetting%20Win32/Personal%20Builds/sezero_4.5_20111101/

# Define Windows mappings
C=/media/741C85CD1C858B36

# Define Mirics home
MIRICS_HOME=$C/PROGRA~1/MiricsSDR

# Register the paths to your cross compilers (if they are not in the PATH already)
export PATH=$PATH:/opt/cross_win64/bin:/opt/cross_win32/bin

# For each cross compiler specify platform (LINUX or WINDOWS) and archtype (X86 or X64)
CCs=(x86_64-w64-mingw32- i686-w64-mingw32- "" "")
OSNAMEs=(WINDOWS WINDOWS LINUX LINUX)
ARCHNAMEs=(X64 X86 X64 X86)
JAVA_HOMEs=($C/PROGRA~2/Java/jdk1.7.0_45 $C/PROGRA~2/Java/jdk1.7.0_45 /usr/lib/jvm/java-6-openjdk-amd64 /usr/lib/jvm/java-6-openjdk-amd64)

make clean
make java

for i in "${!CCs[@]}"; do 
	CC=${CCs[$i]}gcc
	AR=${CCs[$i]}ar
	OSNAME=${OSNAMEs[$i]}
	ARCHNAME=${ARCHNAMEs[$i]}
	JAVA_HOME=${JAVA_HOMEs[$i]}
	make jnilib CC=$CC AR=$AR OSNAME=$OSNAME ARCHNAME=$ARCHNAME JAVA_HOME=$JAVA_HOME MIRICS_HOME=$MIRICS_HOME
	make cleandependent CC=$CC OSNAME=$OSNAME ARCHNAME=$ARCHNAME JAVA_HOME=$JAVA_HOME
done

make jar