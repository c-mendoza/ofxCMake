# --- Was defined OS specifically before


set(OF_SOURCE_FILES
    ${OF_SOURCE_FILES}
    ${ADDON_SOURCE_FILES})


include_directories(${OF_CORE_HEADERS} ${OF_ADDON_HEADERS})

# ============================================================================
# ----------------------------- Setting Libraries ----------------------------
add_library(core OBJECT ${OF_SOURCE_FILES})
add_library(of_static STATIC $<TARGET_OBJECTS:core>)
# add_library(of_shared SHARED $<TARGET_OBJECTS:core>)


# -------------------------------- Linking --------------------------------
#TODO is OF_CORE_FRAMEWORKS OSX specific?
target_link_libraries(of_static ${OF_ADDON_FRAMEWORKS} ${OF_CORE_LIBS} ${OF_CORE_FRAMEWORKS})
# target_link_libraries(of_shared ${OF_ADDON_FRAMEWORKS} ${OF_CORE_LIBS} ${OF_CORE_FRAMEWORKS} )

# -------------------------------- Properties --------------------------------
set_target_properties(of_static PROPERTIES OUTPUT_NAME openFrameworks)
# set_target_properties(of_shared PROPERTIES OUTPUT_NAME openFrameworksShared)

# message( STATUS "${OF_CMAKE_LIBS}" )

# -------------------------- Copy OF Libs into CMake/libs --------------------
set_target_properties(${OFX_ADDONS_ACTIVE}
                      PROPERTIES
                      LIBRARY_OUTPUT_DIRECTORY ${OF_CMAKE_LIBS}/${CMAKE_BUILD_TYPE}
                      ARCHIVE_OUTPUT_DIRECTORY ${OF_CMAKE_LIBS}/${CMAKE_BUILD_TYPE}
                      )

#TODO This does not copy the libs
set_target_properties(of_static PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${OF_CMAKE_LIBS}/${CMAKE_BUILD_TYPE})
set_target_properties(of_static PROPERTIES ARCHIVE_OUTPUT_DIRECTORY ${OF_CMAKE_LIBS}/${CMAKE_BUILD_TYPE})

install(TARGETS of_static
        LIBRARY DESTINATION ${OF_CMAKE_LIBS}/${CMAKE_BUILD_TYPE}
        ARCHIVE DESTINATION ${OF_CMAKE_LIBS}/${CMAKE_BUILD_TYPE})

# install( TARGETS of_shared
# LIBRARY DESTINATION ${OF_CMAKE_LIBS}/${CMAKE_BUILD_TYPE}
# ARCHIVE DESTINATION ${OF_CMAKE_LIBS}/${CMAKE_BUILD_TYPE})

#set_target_properties( of_shared
#        PROPERTIES
#        LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin/${APP_NAME}.app/Contents/Frameworks
#        )
# ============================================================================

#TODO maybe this approach will copy the libs
#install(TARGETS
#        $<TARGET_FILE:of_shared>
#        opengl_lib
#        OFX_ADDONS_ACTIVE
#        ARCHIVE DESTINATION ${OF_DIRECTORY_ABSOLUTE}/CMake/libs/
#        }
