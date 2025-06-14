# ============================================================================
# ---------------------------------- CMAKE -----------------------------------
cmake_policy(SET CMP0057 NEW)

# ============================================================================
# ---------------------------------- PATHS -----------------------------------
# ============================================================================
# --- Set an absolute path name, in case the project used a relative one
get_filename_component(OF_DIRECTORY_ABSOLUTE ${OF_DIRECTORY_BY_USER} ABSOLUTE)
set(CMAKE_PATH_NAME addons/ofxCMake)
set(OF_CMAKE_MODULES ${OF_DIRECTORY_ABSOLUTE}/${CMAKE_PATH_NAME}/modules)
set(OF_CMAKE_ADDONS ${OF_DIRECTORY_ABSOLUTE}/${CMAKE_PATH_NAME}/addOns)
set(OF_CMAKE_LIBS ${OF_DIRECTORY_ABSOLUTE}/${CMAKE_PATH_NAME}/libs)


# ============================================================================
# --------------------------------- ADDONS -----------------------------------
# --- Include all addOn .cmake files.
# --- Libs are only linked, if set in the project CMakeLists.txt
# ============================================================================
#include(${OF_CMAKE_MODULES}/addOns.cmake)
include(${OF_CMAKE_MODULES}/addOnsMacros.cmake)

foreach(ADDON IN LISTS OFX_INTERNAL_ADDONS)
    OF_include_internal_addOn(${ADDON})
endforeach()

 foreach(ADDON IN LISTS OFX_ADDONS_ACTIVE)
     OF_include_external_addOn(${ADDON})
 endforeach()

foreach(ADDON IN LISTS OFX_LOCAL_ADDONS)
    OF_include_local_addOn(${ADDON})
endforeach()


# ============================================================================
# -------------------------------- OF SOURCE FILES ---------------------------
# ============================================================================
include(${OF_CMAKE_MODULES}/openFrameworks.cmake)

if (APPLE) # Apple is a Unix, too. So dont ask only first UNIX
    include(${OF_CMAKE_MODULES}/openFrameworksApple.cmake)
elseif (UNIX)
    include(${OF_CMAKE_MODULES}/openFrameworksLinux.cmake)
elseif (WIN32)
    include(${OF_CMAKE_MODULES}/openFrameworksWindows.cmake)
else ()
    message(FATAL_ERROR "Operating System not supported")
endif ()


# ============================================================================
# -------------------------------- OF CONFIGURATION --------------------------
# ============================================================================
include(${OF_CMAKE_MODULES}/config.cmake)

if (APPLE)
    include(${OF_CMAKE_MODULES}/configApple.cmake)
elseif (UNIX)
    include(${OF_CMAKE_MODULES}/configLinux.cmake)
elseif (WIN32)
    include(${OF_CMAKE_MODULES}/configWindows.cmake)
else ()
    message(FATAL_ERROR "Operating System not supported")
endif ()


# ============================================================================
# ------------------------------- APP CONFIGURATION --------------------------
# ============================================================================
#add_dependencies( ${APP_NAME} of_shared )
set(OUTPUT_APP_NAME ${APP_NAME})

if (CMAKE_BUILD_TYPE MATCHES Debug)
    set(OUTPUT_APP_NAME "${APP_NAME}_debug")
endif ()

set_target_properties(${APP_NAME}
                      PROPERTIES
                      RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin
                      OUTPUT_NAME ${OUTPUT_APP_NAME}
                      )
