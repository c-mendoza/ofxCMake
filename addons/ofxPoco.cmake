# =================================================================
#
# Template for addOns WITH pre compiled libraries
#
# Easiest way: replace all the NAME into the name of your addOn
# It has to have the same name, as the directory it is in
# [e.g. ofxOneEuroFilter is in of/addons/ofxOneEuroFilter/]
#
# =================================================================

set(NAME_ADDON ofxPoco)       # <--- Set the name here

#==================================================================


# -----------------------------------------------------------------
# ---------------------------- PATHS ------------------------------
# -----------------------------------------------------------------
set(PATH_SRC ${OF_DIRECTORY_ABSOLUTE}/addons/${NAME_ADDON}/src)
set(PATH_LIBS ${OF_DIRECTORY_ABSOLUTE}/addons/${NAME_ADDON}/libs)

# -----------------------------------------------------------------
# ---------------------------- SOURCE -----------------------------
# -----------------------------------------------------------------

file(GLOB_RECURSE OFX_ADDON_CPP "${PATH_SRC}/*.cpp")
file(GLOB_RECURSE OFX_ADDON_LIBS_CPP "${PATH_LIBS}/*.cpp")
add_library(${NAME_ADDON} STATIC ${OFX_ADDON_CPP} ${OFX_ADDON_LIBS_CPP})

# -----------------------------------------------------------------
# ---------------------------- HEADERS ----------------------------
# -----------------------------------------------------------------

# OF_find_header_directories( HEADERS_SOURCE ${PATH_SRC} )
# include_directories( ${HEADERS_SOURCE} )
#
# OF_find_header_directories( HEADERS_LIBS ${PATH_LIBS} )
# include_directories( ${HEADERS_LIBS} )
include_directories("${PATH_LIBS}/openssl/include")
include_directories("${PATH_LIBS}/poco/include")

# -----------------------------------------------------------------
# ------------------------------ LIBS  ----------------------------
# -----------------------------------------------------------------

# -----------------------------------------------------------------
# --- In case OS specific libs are needed
# --- Be sure to link them in target_link_libraries()
# -----------------------------------------------------------------

if (APPLE)
    set(openSSL1 "${OF_DIRECTORY_ABSOLUTE}/addons/ofxPoco/libs/openssl/lib/osx/crypto.a")
    set(openSSL2 "${OF_DIRECTORY_ABSOLUTE}/addons/ofxPoco/libs/openssl/lib/osx/ssl.a")
#
#    set(poco1 "${OF_DIRECTORY_ABSOLUTE}/addons/ofxPoco/libs/openssl/lib/osx/crypto.a")
#    set(poco2 "${OF_DIRECTORY_ABSOLUTE}/addons/ofxPoco/libs/openssl/lib/osx/ssl.a")
#    set(poco3 "${OF_DIRECTORY_ABSOLUTE}/addons/ofxPoco/libs/poco/lib/osx/PocoCrypto.a")
#    set(poco4 "${OF_DIRECTORY_ABSOLUTE}/addons/ofxPoco/libs/poco/lib/osx/PocoFoundation.a")
#    set(poco5 "${OF_DIRECTORY_ABSOLUTE}/addons/ofxPoco/libs/poco/lib/osx/PocoJSON.a")
#    set(poco6 "${OF_DIRECTORY_ABSOLUTE}/addons/ofxPoco/libs/poco/lib/osx/PocoNet.a")
#    set(poco7 "${OF_DIRECTORY_ABSOLUTE}/addons/ofxPoco/libs/poco/lib/osx/PocoNetSSL.a")
#    set(poco8 "${OF_DIRECTORY_ABSOLUTE}/addons/ofxPoco/libs/poco/lib/osx/PocoXML.a")
#    set(poco9 "${OF_DIRECTORY_ABSOLUTE}/addons/ofxPoco/libs/poco/lib/osx/PocoZip.a")
    #    find_library( CORE_FOUNDATION_LIB_${NAME_ADDON}  CoreFoundation)
    #    set( compiledLib    "${OF_CMAKE_ADDONS}/${NAME_ADDON}/lib/myLib.a" )
    set(EXTRA_LIBS_ofxPoco
            "${OF_DIRECTORY_ABSOLUTE}/addons/ofxPoco/libs/poco/lib/osx/PocoZip.a"
            "${OF_DIRECTORY_ABSOLUTE}/addons/ofxPoco/libs/poco/lib/osx/PocoCrypto.a"
            "${OF_DIRECTORY_ABSOLUTE}/addons/ofxPoco/libs/poco/lib/osx/PocoData.a"
            "${OF_DIRECTORY_ABSOLUTE}/addons/ofxPoco/libs/poco/lib/osx/PocoEncodings.a"
            "${OF_DIRECTORY_ABSOLUTE}/addons/ofxPoco/libs/poco/lib/osx/PocoFoundation.a"
            "${OF_DIRECTORY_ABSOLUTE}/addons/ofxPoco/libs/poco/lib/osx/PocoJSON.a"
            "${OF_DIRECTORY_ABSOLUTE}/addons/ofxPoco/libs/poco/lib/osx/PocoJWT.a"
            "${OF_DIRECTORY_ABSOLUTE}/addons/ofxPoco/libs/poco/lib/osx/PocoNet.a"
            "${OF_DIRECTORY_ABSOLUTE}/addons/ofxPoco/libs/poco/lib/osx/PocoNetSSL.a"
            "${OF_DIRECTORY_ABSOLUTE}/addons/ofxPoco/libs/poco/lib/osx/PocoRedis.a"
            "${OF_DIRECTORY_ABSOLUTE}/addons/ofxPoco/libs/poco/lib/osx/PocoUtil.a"
            "${OF_DIRECTORY_ABSOLUTE}/addons/ofxPoco/libs/poco/lib/osx/PocoXML.a"
            ${openSSL1}
            ${openSSL2}
    )
endif ()
message(STATUS "${EXTRA_LIBS_ofxPoco}")
target_link_libraries(ofxPoco ${EXTRA_LIBS_ofxPoco})
