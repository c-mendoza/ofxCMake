
# ============================================================================
# ------------------------------ Compiler Flags ------------------------------
# set(CMAKE_C_COMPILER "/usr/bin/clang")
set(CMAKE_C_FLAGS "-x objective-c") # -x objective-c

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
message(${APP_NAME})

#configure_file(
#        "${CMAKE_SOURCE_DIR}/openFrameworks-Info.plist.in"
#        "${CMAKE_SOURCE_DIR}/Info.plist"
#        @ONLY
#)

set_target_properties(${APP_NAME} PROPERTIES
        #                      CMAKE_XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY ""
        #                      CMAKE_XCODE_ATTRIBUTE_CODE_SIGNING_REQUIRED "NO"
        MACOSX_BUNDLE_GUI_IDENTIFIER ${MACOS_BUNDLE_ID}
        MACOSX_BUNDLE_INFO_PLIST ${CMAKE_SOURCE_DIR}/openFrameworks-Info.plist.in
        MACOSX_BUNDLE_BUNDLE_NAME ${APP_NAME}
)
#
#set_target_properties(${APP_NAME} PROPERTIES
#        MACOSX_BUNDLE TRUE
#        MACOSX_BUNDLE_INFO_PLIST "${CMAKE_SOURCE_DIR}/Info.plist"
#)

target_link_libraries(${APP_NAME}
        ${OF_CORE_LIBS}
        of_static
        #        ${opengl_lib}
        ${OF_CORE_FRAMEWORKS}
        ${USER_LIBS}
        ${OF_ADDONS}
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
