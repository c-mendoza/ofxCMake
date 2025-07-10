# -----------------------------------------------------------------
# --- Script to search for all the .cpp files in the chosen folder
# -----------------------------------------------------------------

file(   GLOB_RECURSE
        OFX_OPENCV_CPP
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxOpenCv/*.cpp"
        )

# -----------------------------------------------------------------
# --- Set ALL directories of the addOn, which contain .h files
# -----------------------------------------------------------------

include_directories(
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxOpenCv/src"
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxOpenCv/libs/opencv/include"
        "${OF_DIRECTORY_ABSOLUTE}/addons/ofxOpenCv/libs/opencv/include/opencv4"
)

# -----------------------------------------------------------------
# --- Set the keyword, so you can simply include the addOn
# -----------------------------------------------------------------

add_library(    ofxOpenCv
                STATIC
                ${OFX_OPENCV_CPP} )

# -----------------------------------------------------------------
# --- Setting a compiled lib
# -----------------------------------------------------------------
#TODO Libs for other OS (Win & Linux)

if( APPLE )
    find_library( CORE_FOUNDATION_LIB_OPENCV  CoreFoundation)
    find_library( ZLIB_OPENCV z )
    set( ofxOpenCvLibCustom /usr/local/lib/libopencv_core.a
         /usr/local/lib/libopencv_videoio.a
         /usr/local/lib/libopencv_video.a
         /usr/local/lib/libopencv_highgui.a
         /usr/local/lib/libopencv_imgproc.a
         /usr/local/lib/libopencv_imgcodecs.a
         /usr/local/lib/libopencv_calib3d.a
         /usr/local/lib/libopencv_features2d.a
         /usr/local/lib/libopencv_flann.a
         /usr/local/lib/opencv4/3rdparty/libippicv.a
         /usr/local/lib/opencv4/3rdparty/liblibwebp.a
         /usr/local/lib/opencv4/3rdparty/libzlib.a
         /usr/local/lib/opencv4/3rdparty/liblibjpeg-turbo.a
         /usr/local/lib/opencv4/3rdparty/liblibtiff.a
         /usr/local/lib/opencv4/3rdparty/liblibjasper.a
         /usr/local/lib/opencv4/3rdparty/liblibpng.a
         /usr/local/lib/opencv4/3rdparty/libIlmImf.a
         /usr/local/lib/opencv4/3rdparty/libade.a
         /usr/local/lib/opencv4/3rdparty/libippiw.a
         /usr/local/lib/opencv4/3rdparty/liblibprotobuf.a
         /usr/local/lib/opencv4/3rdparty/libquirc.a
         /usr/local/lib/opencv4/3rdparty/libittnotify.a
         /usr/local/lib/opencv4/3rdparty/libade.a
         /usr/local/lib/libdc1394.a
         #        /usr/local/lib/libffmpeg.a
         /usr/local/lib/libavcodec.a
         /usr/local/lib/libswscale.a
         /usr/local/lib/libpostproc.a
         /usr/local/lib/libavresample.a
         /usr/local/lib/libswresample.a
         /usr/local/lib/libavutil.a
         /usr/local/lib/libavformat.a
         /usr/local/lib/libavfilter.a
         /usr/local/lib/libavdevice.a
         /usr/local/lib/libx264.a
         /usr/local/lib/libvorbisenc.a
         /usr/local/lib/libvpx.a
         /usr/local/lib/libx265.a
         /usr/local/lib/libxvidcore.a
         /usr/local/lib/libmp3lame.a
         /usr/local/lib/libvorbis.a
         /usr/local/lib/libtheora.a
         /usr/local/lib/libtheoradec.a
         /usr/local/lib/libtheoraenc.a
         /usr/local/lib/liblzma.a
         /usr/local/lib/libogg.a
         /usr/local/lib/libopus.a
         /usr/lib/libiconv.dylib
         /usr/lib/libbz2.dylib
         /usr/local/lib/libsnappy.a)
    set(    EXTRA_LIBS_OPENCV
            ${CORE_FOUNDATION_LIB_OPENCV}
            ${ZLIB_OPENCV}
            ${ofxOpenCvLibCustom}
            )
endif()

target_link_libraries(  ofxOpenCv ${EXTRA_LIBS_OPENCV} )