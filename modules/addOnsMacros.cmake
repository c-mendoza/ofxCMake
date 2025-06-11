#==================================================================
# ---- activate INTERNAL addOn
macro(OF_include_internal_addOn NAME_ADDON)
    if (${NAME_ADDON} IN_LIST OFX_INTERNAL_ADDONS)
        if (EXISTS ${OF_DIRECTORY_ABSOLUTE}/addons/${NAME_ADDON}/)
            include(${OF_CMAKE_ADDONS}/internal/${NAME_ADDON}.cmake)
            message(STATUS "${NAME_ADDON} activated")
        else ()
            message(WARNING "${NAME_ADDON} folder not found")
        endif ()
    endif ()
endmacro(OF_include_internal_addOn)

#==================================================================
# ---- activate EXTERNAL addOn
macro(OF_include_external_addOn NAME_ADDON)
    if (${NAME_ADDON} IN_LIST OFX_ADDONS_ACTIVE)
        if (EXISTS ${OF_DIRECTORY_ABSOLUTE}/addons/${NAME_ADDON}/)
            include(${OF_CMAKE_ADDONS}/external/${NAME_ADDON}.cmake)
            message(STATUS "${NAME_ADDON} activated")
        else ()
            message(WARNING "${NAME_ADDON} folder not found")
        endif ()
    endif ()
endmacro(OF_include_external_addOn)

# ---- activate Local addOn
macro(OF_include_local_addOn NAME_ADDON)
    set(GLOBAL_ADDON_PATH "${OF_DIRECTORY_ABSOLUTE}/addons/${NAME_ADDON}")
    set(LOCAL_ADDON_PATH "${CMAKE_CURRENT_SOURCE_DIR}/${NAME_ADDON}")
    set(ADDON_CONFIG ${OF_CMAKE_ADDONS}/external/${NAME_ADDON}.cmake)

    if (EXISTS ${LOCAL_ADDON_PATH})
        message(STATUS "Activating local addon from: ${LOCAL_ADDON_PATH}")
        of_load_generic_addon(${LOCAL_ADDON_PATH} ${NAME_ADDON})
    else ()
        message(WARNING "Local addon ${NAME_ADDON} not found.")
    endif ()
endmacro()

# Attempts to load addons that do not have cmake files. Will work with basic addons that have a src directory.
# If there are libs that have sources, those will be compiled. It WILL NOT add any framework or static lib to
# the project path, however. You can either add a cmake file for that addon or import headers and libraries yourself
# in your projects CMakeFiles.txt
macro(of_load_generic_addon ADDON_PATH NAME_ADDON)
    set(PATH_SRC ${ADDON_PATH}/src)
    set(PATH_LIBS ${ADDON_PATH}/libs)

    set(ADDON_SRC)

    file(GLOB_RECURSE OFX_ADDON_CPP "${PATH_SRC}/*.cpp")
    file(GLOB_RECURSE OFX_ADDON_CC "${PATH_SRC}/*.cc")
    file(GLOB_RECURSE OFX_ADDON_LIBS_CPP "${PATH_LIBS}/*.cpp")
    file(GLOB_RECURSE OFX_ADDON_LIBS_CC "${PATH_LIBS}/*.cc")
    list(APPEND ADDON_SRC ${OFX_ADDON_CPP} ${OFX_ADDON_CC} ${OFX_ADDON_LIBS_CPP} ${OFX_ADDON_LIBS_CC})

    list(LENGTH ADDON_SRC list_length)
    if(list_length EQUAL 0)
        message("List is empty")
    else()
       message("Adding Library ${NAME_ADDON}")
        add_library(${NAME_ADDON} STATIC ${OFX_ADDON_CPP} ${OFX_ADDON_LIBS_CPP})
    endif()

    OF_find_header_directories(HEADERS_SOURCE ${PATH_SRC})
    OF_find_header_directories(HEADERS_LIBS ${PATH_LIBS})
    #    message(STATUS ${HEADERS_SOURCE})
    #    message(STATUS "---")
    #    message(STATUS ${HEADERS_LIB})
    include_directories(${PATH_SRC})
    find_addon_include_dirs(${ADDON_PATH} ADDON_INCLUDE_DIRS)
    #    message(STATUS "Found include directories: ${ADDON_INCLUDE_DIRS}")
    include_directories(${ADDON_INCLUDE_DIRS})
endmacro()


function(find_addon_include_dirs ADDON_PATH OUT_INCLUDE_DIRS)
    set(INCLUDE_DIRS "")
    # Check if the 'libs' directory exists
    set(LIBS_PATH "${ADDON_PATH}/libs")
    if (NOT EXISTS ${LIBS_PATH})
        #        message(WARNING "No 'libs' directory found in ${ADDON_PATH}")
        set(${OUT_INCLUDE_DIRS} "" PARENT_SCOPE)
        return()
    endif ()

    # Loop through directories inside 'libs'
    file(GLOB LIB_DIRS LIST_DIRECTORIES true "${LIBS_PATH}/*")
    foreach (LIB_DIR ${LIB_DIRS})
        if (IS_DIRECTORY ${LIB_DIR})
            set(INCLUDE_PATH "${LIB_DIR}/include")

            # If 'include' directory exists, add it, otherwise add LIB_DIR itself
            if (EXISTS ${INCLUDE_PATH})
                list(APPEND INCLUDE_DIRS ${INCLUDE_PATH})
            else ()
                list(APPEND INCLUDE_DIRS ${LIB_DIR})
            endif ()
        endif ()
    endforeach ()

    # Return the list of include directories
    set(${OUT_INCLUDE_DIRS} "${INCLUDE_DIRS}" PARENT_SCOPE)
endfunction()
#==================================================================

# macro( OF_include_external_addOn NAME_ADDON )
#     if( ${NAME_ADDON} IN_LIST OFX_ADDONS_ACTIVE )
#         if( EXISTS ${OF_DIRECTORY_ABSOLUTE}/addons/${NAME_ADDON}/)
#             include( ${OF_CMAKE_ADDONS}/external/${NAME_ADDON}.cmake )
#             message( STATUS "${NAME_ADDON} activated" )
#         else()
#             message( WARNING "${NAME_ADDON} folder not found" )
#         endif()
#     endif()
# endmacro( OF_include_external_addOn )


# TODO Find also .hpp files
# ---- Find all include directories
MACRO(OF_find_header_directories return_list PATH)
    FILE(GLOB_RECURSE new_list ${PATH}/*.h)
    SET(dir_list "")
    FOREACH (file_path ${new_list})
        GET_FILENAME_COMPONENT(dir_path ${file_path} PATH)
        SET(dir_list ${dir_list} ${dir_path})
    ENDFOREACH ()
    LIST(REMOVE_DUPLICATES dir_list)
    SET(${return_list} ${dir_list})
ENDMACRO(OF_find_header_directories)

#==================================================================

# TODO DOES NOT WORK YET
# ---- Find all source files
macro(OF_find_source_files return_list PATH)
    file(GLOB_RECURSE FILES_CPP "${PATH}/*.cpp")
    file(GLOB_RECURSE FILES_CC "${PATH}/*.cc")
    file(GLOB_RECURSE FILES_C "${PATH}/*.c")
    set(${return_list} ${FILES_CPP} ${FILES_CC} ${FILES_C})
endmacro(OF_find_source_files)

#==================================================================

# TODO automatic search for addOns .cmake files
#file( GLOB_RECURSE ALL_ADDON_FILES  "${OF_CMAKE_ADDONS}*.cmake" )
#include( ALL_ADDON_FILES )

