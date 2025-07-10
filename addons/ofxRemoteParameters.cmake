
set( NAME_ADDON     ofxRemoteParameters )       # <--- Set the name here

# -----------------------------------------------------------------
# --- Script to search for all the .cpp files in the chosen folder
# -----------------------------------------------------------------

file(   GLOB_RECURSE
        ofxRemoteParameters_cpp
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxRemoteParameters/src/*.cpp"
        )

# -----------------------------------------------------------------
# --- Set ALL directories of the addOn, which contain .h files
# -----------------------------------------------------------------

include_directories(    "${OF_DIRECTORY_ABSOLUTE}/addons/ofxRemoteParameters/src" )
include_directories(    "${OF_DIRECTORY_ABSOLUTE}/addons/ofxRemoteParameters/src/ofxRemoteParameters" )

# -----------------------------------------------------------------
# --- Set the keyword, so you can simply include the addOn
# -----------------------------------------------------------------

add_library(    ${NAME_ADDON}
                STATIC
              ${ofxRemoteParameters_cpp} )
