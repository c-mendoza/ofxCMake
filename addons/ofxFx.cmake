# =================================================================
#
# Template for addOns
#
# Easiest way: replace all the NAME into the name of your addOn
# It has to have the same name, as the directory it is in
# [e.g. ofxOneEuroFilter is in of/addons/ofxOneEuroFilter/]
#
# =================================================================

set( NAME_ADDON     ofxFX )       # <--- Set the name here

#==================================================================


# -----------------------------------------------------------------
# ---------------------------- PATHS ------------------------------
# -----------------------------------------------------------------
set( PATH_SRC    ${OF_DIRECTORY_ABSOLUTE}/addons/${NAME_ADDON}/src )

# -----------------------------------------------------------------
# ---------------------------- SOURCE -----------------------------
# -----------------------------------------------------------------

file( GLOB_RECURSE   OFX_ADDON_CPP          "${PATH_SRC}/*.cpp" )
add_library(  ${NAME_ADDON}   STATIC   ${OFX_ADDON_CPP} )

# -----------------------------------------------------------------
# ---------------------------- HEADERS ----------------------------
# -----------------------------------------------------------------


OF_find_header_directories( HEADERS_SOURCE ${PATH_SRC} )
OF_find_header_directories( HEADERS_SOURCE1 ${PATH_SRC}/composers )
OF_find_header_directories( HEADERS_SOURCE2 ${PATH_SRC}/filters )
OF_find_header_directories( HEADERS_SOURCE3 ${PATH_SRC}/generative )
OF_find_header_directories( HEADERS_SOURCE4 ${PATH_SRC}/operations )

include_directories( ${HEADERS_SOURCE} )
#include_directories( ${HEADERS_LIBS} )
