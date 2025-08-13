
# ============================================================================
# ------------------------------ Compiler Flags ------------------------------
set_source_files_properties( ${OF_SOURCE_FILES} PROPERTIES COMPILE_FLAGS "-std=c++11 -Wall -fPIC" )

# ============================================================================
# ------------------------------ Compile and Link ----------------------------
add_executable( ${APP_NAME} ${${APP_NAME}_SOURCE_FILES} )

# set_target_properties( of_shared PROPERTIES POSITION_INDEPENDENT_CODE TRUE )
target_link_libraries(  ${APP_NAME}
                        ${OF_CORE_LIBS}
                        of_static
                        ${OF_CORE_FRAMEWORKS}
                        ${USER_LIBS}
                        ${OFX_ADDONS_ACTIVE}
                    )
target_link_libraries(${APP_NAME} ${OF_CORE_LIBS})

