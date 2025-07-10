
set( NAME_ADDON     ofxParameterCollection )       # <--- Set the name here

# -----------------------------------------------------------------
# --- Script to search for all the .cpp files in the chosen folder
# ----------------------------------------------------------------
file(   GLOB_RECURSE
        OFX_PARAMETER_COLLECTION
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxParameterCollection/src/*.cpp"
        )
#
# -----------------------------------------------------------------
# --- Set ALL directories of the addOn, which contain .h files
# -----------------------------------------------------------------
#
include_directories(    "${OF_DIRECTORY_ABSOLUTE}/addons/ofxParameterCollection/src" )
#
# -----------------------------------------------------------------
# --- Set the keyword, so you can simply include the addOn
# -----------------------------------------------------------------
add_library(  ${NAME_ADDON}   STATIC   ${OFX_ADDON_CPP} ${OFX_ADDON_LIBS_CPP} )
