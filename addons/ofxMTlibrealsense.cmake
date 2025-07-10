# =================================================================
#
# Template for addOns WITH pre compiled libraries
#
# Easiest way: replace all the NAME into the name of your addOn
# It has to have the same name, as the directory it is in
# [e.g. ofxOneEuroFilter is in of/addons/ofxOneEuroFilter/]
#
# =================================================================

set(NAME_ADDON ofxMTlibrealsense)       # <--- Set the name here

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
add_library(${NAME_ADDON} STATIC ${OFX_ADDON_CPP})

# -----------------------------------------------------------------
# ---------------------------- HEADERS ----------------------------
# -----------------------------------------------------------------

# OF_find_header_directories( HEADERS_SOURCE ${PATH_SRC} )
# include_directories( ${HEADERS_SOURCE} )

# OF_find_header_directories(HEADERS_LIBS ${PATH_LIBS})
include_directories(${PATH_LIBS}/librealsense2/include)

# -----------------------------------------------------------------
# ------------------------------ LIBS  ----------------------------
# -----------------------------------------------------------------

# -----------------------------------------------------------------
# --- In case OS specific libs are needed
# --- Be sure to link them in target_link_libraries()
# -----------------------------------------------------------------

if (APPLE)
    set(lrs2 "${PATH_LIBS}/librealsense2/lib/osx/librealsense2.a")
    set(lrs2-gl "${PATH_LIBS}/librealsense2/lib/osx/librealsense2-gl.a")
    set(lrs-file "${PATH_LIBS}/librealsense2/lib/osx/librealsense-file.a")

    set(EXTRA_LIBS_MTLRS
        ${lrs2}
        ${lrs2-gl}
        ${lrs-file}
        "${PATH_LIBS}/librealsense2/lib/osx/usb-1.0.0.a"
        "${PATH_LIBS}/librealsense2/lib/osx/libfw.a"
        )

    list(APPEND USER_LIBS ${EXTRA_LIBS_MTLRS})
    #    set(${USER_LIBS})
endif ()

# message(${USER_LIBS})
target_link_libraries(${NAME_ADDON} ${EXTRA_LIBS_MTLRS})
