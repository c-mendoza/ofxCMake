

add_executable(${APP_NAME}  ${${APP_NAME}_SOURCE_FILES})
set(CMAKE_CXX_FLAGS [=[/std:c++17 /MP /W3 /Zc:wchar_t /Zi /Gm- /Zc:inline /fp:precise /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "POCO_STATIC" /D "CAIRO_WIN32_STATIC_BUILD" /D "DISABLE_SOME_FLOATING_POINT" /D "CURL_STATICLIB" /D "_UNICODE" /D "UNICODE" /MDd]=])


#        [=[/MP /ifcOutput "obj\x64\Debug\" /GS /TP /W3 /Zc:wchar_t /ZI /Gm- /Od /Fd"obj\x64\Debug\vc143.pdb" /Zc:inline /fp:precise /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "POCO_STATIC" /D "CAIRO_WIN32_STATIC_BUILD" /D "DISABLE_SOME_FLOATING_POINT" /D "CURL_STATICLIB" /D "_UNICODE" /D "UNICODE" /errorReport:prompt /WX- /Zc:forScope /RTC1 /Gd /MDd /std:c++17 /FC /Fa"obj\x64\Debug\" /EHsc /nologo  /Fp"obj\x64\Debug\Reentry_debug.pch" /diagnostics:column]=])

#/Fo"obj\x64\Debug\\Build\%(RelativeDir)\Debug\"

target_compile_options(${APP_NAME} PUBLIC -U__MINGW64__ -U__MINGW32__)
#target_compile_definitions(${APP_NAME} PRIVATE BOOST_ALL_NO_LIB)


#foreach (item IN LISTS OF_LIB_DIRS)
#    message(STATUS " - ${item}")
#    target_link_directories(${APP_NAME} PUBLIC ${item})
#endforeach ()
#
#message(STATUS " ------- ")
#
#foreach (item IN LISTS OF_CORE_LIBS)
#    message(STATUS " - ${item}")
#    target_link_libraries(${APP_NAME} PUBLIC ${item})
#endforeach ()


target_link_libraries(${APP_NAME} PUBLIC
#        ${OF_CORE_LIBS}
        of_static
#        ${USER_LIBS}
#        ${OF_ADDONS}
)

target_link_directories(${APP_NAME} PUBLIC ${OF_LIB_DIRS})

get_target_property(LINK_LIBS of_static LINK_LIBRARIES)
message(STATUS "myLib links to: ${LINK_LIBS}")

#message(STATUS "${OF_CORE_LIBS}")

#
#/OUT:"bin\Reentry_debug.exe" /MANIFEST /NXCOMPAT /PDB:"bin\Reentry_debug.pdb" /DYNAMICBASE:NO "cairo-static.lib" "pixman-1.lib" "libpng.lib" "zlib.lib" "msimg32.lib" "OpenGL32.lib" "kernel32.lib" "setupapi.lib" "Vfw32.lib" "comctl32.lib" "rtAudioD.lib" "videoInputD.lib" "libfreetype.lib" "FreeImage.lib" "dsound.lib" "user32.lib" "gdi32.lib" "winspool.lib" "comdlg32.lib" "advapi32.lib" "shell32.lib" "ole32.lib" "oleaut32.lib" "uuid.lib" "glew32s.lib" "fmod64_vc.lib" "libssl.lib" "libcrypto.lib" "crypt32.lib" "libcurl.lib" "uriparser.lib" "pugixmld.lib" "Ws2_32.lib" "tess2.lib" "glfw3.lib" "winmm.lib" "odbc32.lib" "odbccp32.lib" "wldap32.lib" "mf.lib" "mfplat.lib" "mfuuid.lib" "d3d11.lib" "mfreadwrite.lib" "xaudio2.lib" "PocoCryptomdd.lib" "PocoDatamdd.lib" "PocoDataSQLitemdd.lib" "PocoFoundationmdd.lib" "PocoJSONmdd.lib" "PocoNetmdd.lib" "PocoNetSSLmdd.lib" "PocoPDFmdd.lib" "PocoUtilmdd.lib" "PocoXMLmdd.lib" "PocoZipmdd.lib" "iphlpapi.lib" /DEBUG /MACHINE:X64 /NODEFAULTLIB:"atlthunk.lib" /NODEFAULTLIB:"msvcrt" /NODEFAULTLIB:"libcmt" /NODEFAULTLIB:"LIBC" /NODEFAULTLIB:"LIBCMTD" /INCREMENTAL /PGD:"bin\Reentry_debug.pgd" /SUBSYSTEM:CONSOLE /MANIFESTUAC:"level='asInvoker' uiAccess='false'" /ManifestFile:"obj\x64\Debug\Reentry_debug.exe.intermediate.manifest" /LTCGOUT:"obj\x64\Debug\Reentry_debug.iobj" /ERRORREPORT:PROMPT /ILK:"obj\x64\Debug\Reentry_debug.ilk" /NOLOGO /LIBPATH:"C:\Users\c\Documents\developer\canogar\openFrameworks\libs\openFrameworksCompiled\project\vs\\..\..\..\..\\libs\glfw\lib\vs\x64" /LIBPATH:"C:\Users\c\Documents\developer\canogar\openFrameworks\libs\openFrameworksCompiled\project\vs\\..\..\..\..\\libs\rtAudio\lib\vs\x64" /LIBPATH:"C:\Users\c\Documents\developer\canogar\openFrameworks\libs\openFrameworksCompiled\project\vs\\..\..\..\..\\libs\FreeImage\lib\vs\x64" /LIBPATH:"C:\Users\c\Documents\developer\canogar\openFrameworks\libs\openFrameworksCompiled\project\vs\\..\..\..\..\\libs\freetype\lib\vs\x64" /LIBPATH:"C:\Users\c\Documents\developer\canogar\openFrameworks\libs\openFrameworksCompiled\project\vs\\..\..\..\..\\libs\fmod\lib\vs\x64" /LIBPATH:"C:\Users\c\Documents\developer\canogar\openFrameworks\libs\openFrameworksCompiled\project\vs\\..\..\..\..\\libs\videoInput\lib\vs\x64" /LIBPATH:"C:\Users\c\Documents\developer\canogar\openFrameworks\libs\openFrameworksCompiled\project\vs\\..\..\..\..\\libs\cairo\lib\vs\x64" /LIBPATH:"C:\Users\c\Documents\developer\canogar\openFrameworks\libs\openFrameworksCompiled\project\vs\\..\..\..\..\\libs\glew\lib\vs\x64" /LIBPATH:"C:\Users\c\Documents\developer\canogar\openFrameworks\libs\openFrameworksCompiled\project\vs\\..\..\..\..\\libs\glu\lib\vs\x64" /LIBPATH:"C:\Users\c\Documents\developer\canogar\openFrameworks\libs\openFrameworksCompiled\project\vs\\..\..\..\..\\libs\openssl\lib\vs\x64" /LIBPATH:"C:\Users\c\Documents\developer\canogar\openFrameworks\libs\openFrameworksCompiled\project\vs\\..\..\..\..\\libs\curl\lib\vs\x64" /LIBPATH:"C:\Users\c\Documents\developer\canogar\openFrameworks\libs\openFrameworksCompiled\project\vs\\..\..\..\..\\libs\tess2\lib\vs\x64" /LIBPATH:"C:\Users\c\Documents\developer\canogar\openFrameworks\libs\openFrameworksCompiled\project\vs\\..\..\..\..\\libs\boost\lib\vs\x64" /LIBPATH:"C:\Users\c\Documents\developer\canogar\openFrameworks\libs\openFrameworksCompiled\project\vs\\..\..\..\..\\libs\uriparser\lib\vs\x64" /LIBPATH:"C:\Users\c\Documents\developer\canogar\openFrameworks\libs\openFrameworksCompiled\project\vs\\..\..\..\..\\libs\pugixml\lib\vs\x64" /LIBPATH:"C:\Program Files (x86)\Visual Leak Detector\lib\Win64" /LIBPATH:"..\..\openFrameworks\addons\ofxPoco\libs\poco\lib\vs\x64\Debug" /LIBPATH:"..\..\openFrameworks\addons\ofxPoco" /TLBID:1