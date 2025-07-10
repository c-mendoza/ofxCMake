# -----------------------------------------------------------------
# --- Set the name of your AddOn
# -----------------------------------------------------------------

set( NAME_ADDON     ofxIO )

#==================================================================
#==================================================================
# -----------------------------------------------------------------
# ---------------------------- PATHS ------------------------------
# -----------------------------------------------------------------
set( PATH_SOURCE    ${OF_DIRECTORY_ABSOLUTE}/addons/${NAME_ADDON}/src )
set( PATH_LIBS      ${OF_DIRECTORY_ABSOLUTE}/addons/${NAME_ADDON}/libs )

# --- Setting abolute path to prevent errors
get_filename_component( PATH_SOURCE_ABSOLUTE ${PATH_SOURCE} ABSOLUTE)
get_filename_component( PATH_LIBS_ABSOLUTE ${PATH_LIBS} ABSOLUTE)

# -----------------------------------------------------------------
# ---------------------------- SOURCE -----------------------------
# -----------------------------------------------------------------

file( GLOB_RECURSE   OFX_ADDON_CPP   "${PATH_LIBS}/*.cpp" )
file( GLOB_RECURSE   OFX_ADDON_CC    "${PATH_LIBS}/*.cc" )
file( GLOB_RECURSE   OFX_ADDON_C     "${PATH_LIBS}/*.c" )
add_library(  ${NAME_ADDON}   STATIC
        ${OFX_ADDON_CPP}
        ${OFX_ADDON_CC}
        ${OFX_ADDON_C} )

# -----------------------------------------------------------------
# ---------------------------- HEADERS ----------------------------
# -----------------------------------------------------------------

include_directories(
        ${OF_DIRECTORY_ABSOLUTE}/addons/ofxIO/src
        ${OF_DIRECTORY_ABSOLUTE}/addons/ofxIO/libs/alphanum/include
        ${OF_DIRECTORY_ABSOLUTE}/addons/ofxIO/libs/brotli/src
        ${OF_DIRECTORY_ABSOLUTE}/addons/ofxIO/libs/lz4/src
        ${OF_DIRECTORY_ABSOLUTE}/addons/ofxIO/libs/ofxIO/include
        ${OF_DIRECTORY_ABSOLUTE}/addons/ofxIO/libs/snappy/src )


# -----------------------------------------------------------------
# ------------------------------ LIBS  ----------------------------
# -----------------------------------------------------------------
