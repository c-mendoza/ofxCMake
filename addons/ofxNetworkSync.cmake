# -----------------------------------------------------------------
# --- Script to search for all the .cpp files in the chosen folder
# -----------------------------------------------------------------

file(   GLOB_RECURSE
        OFX_NETWORK_SYNC_CPP
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxNetworkSync/src/*.cpp"
        )

# -----------------------------------------------------------------
# --- Set ALL directories of the addOn, which contain .h files
# -----------------------------------------------------------------

include_directories( "${OF_DIRECTORY_ABSOLUTE}/addons/ofxNetworkSync/src" )

# -----------------------------------------------------------------
# --- Set the keyword, so you can simply include the addOn
# -----------------------------------------------------------------

add_library(    ofxNetworkSync
                STATIC
                ${OFX_NETWORK_SYNC_CPP} )
