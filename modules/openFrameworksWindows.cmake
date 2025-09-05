
list(APPEND OF_SOURCE_FILES
        ${OF_DIRECTORY_ABSOLUTE}/libs/openFrameworks/video/ofDirectShowGrabber.cpp
        ${OF_DIRECTORY_ABSOLUTE}/libs/openFrameworks/video/ofDirectShowPlayer.cpp
        ${OF_DIRECTORY_ABSOLUTE}/libs/openFrameworks/video/ofMediaFoundationPlayer.cpp
)


list(APPEND OF_CORE_HEADERS
        ${OF_DIRECTORY_ABSOLUTE}/libs/glew/include
        ${OF_DIRECTORY_ABSOLUTE}/libs/openssl/include
        ${OF_DIRECTORY_ABSOLUTE}/libs/cairo/include/cairo
        ${OF_DIRECTORY_ABSOLUTE}/libs/rtAudio/include
        ${OF_DIRECTORY_ABSOLUTE}/libs/boost/include
        ${OF_DIRECTORY_ABSOLUTE}/libs/curl/include
)

set(WIN_LIB_NAMES
        boost
        cairo
        curl
        fmod
        FreeImage
        freetype
        glew
        glfw
        glm
        json
        libpng
        openssl
        pixman
        pugixml
        rtAudio
        tess2
        uriparser
        utf8
        videoInput
        zlib
)

set(WIN_ARCH "x64")

set(OF_CORE_LIBS
)

set(OF_LIB_DIRS )
set(OF_LIB_FILES )

foreach (LIB ${WIN_LIB_NAMES})
    set(INCLUDE_DIR ${OF_DIRECTORY_ABSOLUTE}/libs/${LIB}/include)
    if (EXISTS ${INCLUDE_DIR})
        list(APPEND OF_CORE_HEADERS ${INCLUDE_DIR})
    endif ()
    set(LIB_DIR ${OF_DIRECTORY_ABSOLUTE}/libs/${LIB}/lib/vs/${WIN_ARCH})
    file(GLOB LIB_FILES "${LIB_DIR}/*.lib")
#    foreach(LIB_FILE ${LIB_FILES})
#        get_filename_component(NAME_ONLY ${LIB_FILE} NAME)
#        list(APPEND OF_CORE_LIBS ${NAME_ONLY})
#    endforeach()
    list(APPEND OF_CORE_LIBS ${LIB_FILES})
    list(APPEND OF_LIB_DIRS ${LIB_DIR})
endforeach ()


#message(STATUS "OF_CORE_LIBS = ${OF_CORE_LIBS}")

set(OF_SYSTEM_LIBS
        msimg32
        OpenGL32
        kernel32
        setupapi
        Vfw32
        comctl32
        dsound
        user32
        gdi32
        winspool
        comdlg32
        advapi32
        shell32
        ole32
        oleaut32
        uuid
        glew32s
        crypt32
        libcurl
        Ws2_32
        winmm
        odbc32
        odbccp32
        wldap32
        mf
        mfplat
        mfuuid
        d3d11
        mfreadwrite
        xaudio2
)

list(APPEND OF_CORE_LIBS ${OF_SYSTEM_LIBS})

#foreach (item IN LISTS OF_CORE_LIBS)
#    message(STATUS " - ${item}")
#endforeach ()
##
#cairo-static.lib
#pixman-1.lib
#libpng.lib
#zlib.lib
#msimg32.lib
#OpenGL32.lib
#kernel32.lib
#setupapi.lib
#Vfw32.lib
#comctl32.lib
#rtAudioD.lib
#videoInputD.lib
#libfreetype.lib
#FreeImage.lib
#dsound.lib
#user32.lib
#gdi32.lib
#winspool.lib
#comdlg32.lib
#advapi32.lib
#shell32.lib
#ole32.lib
#oleaut32.lib
#uuid.lib
#glew32s.lib
#fmod64_vc.lib
#libssl.lib
#libcrypto.lib
#crypt32.lib
#libcurl.lib
#uriparser.lib
#pugixmld.lib
#Ws2_32.lib
#tess2.lib
#glfw3.lib
#winmm.lib
#odbc32.lib
#odbccp32.lib
#wldap32.lib
#mf.lib
#mfplat.lib
#mfuuid.lib
#d3d11.lib
#mfreadwrite.lib
#xaudio2.lib
###

# TODO Include OS specific Libs