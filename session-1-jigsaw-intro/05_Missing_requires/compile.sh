#!/bin/bash

set -eu

# Escape code
esc=$(echo -en "\033")

info="${esc}[0;33m"
normal=$(echo -en "${esc}[m\017")

COM_GREETINGS_FOLDER="mods/com.greetings"
ORG_ASTRO_FOLDER="mods/org.astro"

echo ""
echo "${info} *** Compiling modules in $ORG_ASTRO_FOLDER *** ${normal}"
javac -d $ORG_ASTRO_FOLDER \
      src/org.astro/module-info.java \
      src/org.astro/org/astro/World.java

echo ""
echo "${info} *** Compiling modules in $ORG_ASTRO_FOLDER *** ${normal}"
tree -fl $ORG_ASTRO_FOLDER

echo ""
echo "${info} *** Compiling modules in $COM_GREETINGS_FOLDER (with 'requires' commented out) *** ${normal}"
javac --module-path mods \
       -d $COM_GREETINGS_FOLDER \
       src/com.greetings/module-info.java \
       src/com.greetings/com/greetings/Main.java

# ********************************************************************************
# Compilation does not finish due to compilation error, no artifacts are created.
# Execution does not proceed further, script exists at this point.
# ********************************************************************************

echo ""
echo "${info} *** Compiling modules in $COM_GREETINGS_FOLDER *** ${normal}"
tree -fl $COM_GREETINGS_FOLDER

# See ../01_Greetings/compile.sh for explanations to above commands
