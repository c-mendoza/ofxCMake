
# ============================================================================
# ------------------------------ Compiler Flags ------------------------------
# set(CMAKE_C_COMPILER "/usr/bin/clang")
set(CMAKE_C_FLAGS "") # -x objective-c

# set(CMAKE_CXX_COMPILER "/usr/bin/clang++")
set(CMAKE_CXX_FLAGS "-std=c++17 -stdlib=libc++ -D__MACOSX_CORE__ -fobjc-arc") # Removed "-stdlib=libstdc++
set_source_files_properties(${OF_SOURCE_FILES} PROPERTIES COMPILE_FLAGS "-x objective-c++")

#set(CMAKE_OSX_ARCHITECTURES i386)
# set(CMAKE_OSX_ARCHITECTURES x86_64)
add_compile_options(-Wno-deprecated-declarations)

find_program(CCACHE_FOUND ccache)
if (CCACHE_FOUND)
    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
    set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
endif (CCACHE_FOUND)


# ============================================================================
# ------------------------------ Compile and Link ----------------------------
add_executable(${APP_NAME} MACOSX_BUNDLE ${${APP_NAME}_SOURCE_FILES})

target_link_libraries(${APP_NAME}
        ${OF_CORE_LIBS}
        of_static
        #        ${opengl_lib}
        ${OF_CORE_FRAMEWORKS}
        ${USER_LIBS}
        ${OFX_ADDONS_ACTIVE}
        ${OFX_LOCAL_ADDONS}
        ${OFX_INTERNAL_ADDONS}
)

# ============================================================================

add_custom_command(
        TARGET ${APP_NAME}
        POST_BUILD
        COMMAND rsync
        ARGS -aved ${CMAKE_SOURCE_DIR}/${OF_DIRECTORY_BY_USER}/libs/fmod/lib/osx/libfmod.dylib "$<TARGET_FILE_DIR:${APP_NAME}>/../Frameworks/"
)

add_custom_command(
        TARGET ${APP_NAME}
        POST_BUILD
        COMMAND ${CMAKE_INSTALL_NAME_TOOL}
        ARGS -change @executable_path/libfmod.dylib @executable_path/../Frameworks/libfmod.dylib $<TARGET_FILE:${APP_NAME}>
)
