# =================================================================
#
# Template for addOns WITH pre compiled libraries
#
# Easiest way: replace all the NAME into the name of your addOn
# It has to have the same name, as the directory it is in
# [e.g. ofxOneEuroFilter is in of/addons/ofxOneEuroFilter/]
#
# =================================================================

set(NAME_ADDON ofxLibRealSense2P)       # <--- Set the name here

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

OF_find_header_directories(HEADERS_SOURCE ${PATH_SRC})
include_directories(${HEADERS_SOURCE})

OF_find_header_directories(HEADERS_LIBS ${PATH_LIBS})
include_directories(${HEADERS_LIBS})

include_directories("${PATH_LIBS}/realsense/include/")
message("${PATH_LIBS}/realsense/lib/osx/")

# -----------------------------------------------------------------
# ------------------------------ LIBS  ----------------------------
# -----------------------------------------------------------------

# -----------------------------------------------------------------
# --- In case OS specific libs are needed
# --- Be sure to link them in target_link_libraries()
# -----------------------------------------------------------------

if (APPLE)
#    find_library(CORE_FOUNDATION_LIB_RS CoreFoundation)
#    set(rsLib
#    set(rsLib2 "${PATH_LIBS}/realsense/lib/osx/librealsense-file.a")
    set(EXTRA_LIBS_RS
#        ${CORE_FOUNDATION_LIB_RS}
        "${PATH_LIBS}/realsense/lib/osx/librealsense2.a"
        "${PATH_LIBS}/realsense/lib/osx/librealsense-file.a"
        "${PATH_LIBS}/realsense/lib/osx/libfw.a"
        "${PATH_LIBS}/realsense/lib/osx/libusb-1.0.0.a"
        )
endif ()

message(${EXTRA_LIBS_RS})

target_link_libraries(${NAME_ADDON} ${EXTRA_LIBS_RS})
#
# add_custom_command(
#         TARGET ${APP_NAME}
#         POST_BUILD
#         COMMAND rsync
#         ARGS -aved ${CMAKE_SOURCE_DIR}/${OF_DIRECTORY_BY_USER}/libs/fmodex/lib/osx/libfmodex.dylib "$<TARGET_FILE_DIR:${APP_NAME}>/../Frameworks/"
# )
#
# add_custom_command(
#         TARGET ${APP_NAME}
#         POST_BUILD
#         COMMAND ${CMAKE_INSTALL_NAME_TOOL}
#         ARGS -change @executable_path/libfmodex.dylib @executable_path/../Frameworks/libfmodex.dylib $<TARGET_FILE:${APP_NAME}>
# )
