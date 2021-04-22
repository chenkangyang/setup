#!/usr/bin/zsh
# install opencv with cuda11（成功）, conda base python-opencv (失败)
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME1="opencv"
NAME2="opencv_contrib"
TYPE=".tar.gz"
FILE1="$NAME1$TYPE"
FILE2="$NAME2$TYPE"
DOWNLOADURL1="https://github.com/opencv/opencv/archive/4.3.0.tar.gz"
DOWNLOADURL2="https://github.com/opencv/opencv_contrib/archive/4.3.0.tar.gz"
echo $NAME1 will be installed in "$ROOTDIR"

mkdir -p "$ROOTDIR/downloads"
cd "$ROOTDIR"

if [ -f "downloads/$FILE1" ]; then
    echo "downloads/$FILE1 exist"
else
    echo "$FILE1 does not exist, downloading from $DOWNLOADURL1"
    wget $DOWNLOADURL1 -O $FILE1
    mv $FILE1 downloads/
fi

if [ -f "downloads/$FILE2" ]; then
    echo "downloads/$FILE2 exist"
else
    echo "$FILE2 does not exist, downloading from $DOWNLOADURL2"
    wget $DOWNLOADURL2 -O $FILE2
    mv $FILE2 downloads/
fi

mkdir -p src/$NAME1
mkdir -p src/$NAME2
tar -zxf downloads/$FILE1 -C src/$NAME1 --strip-components 1
tar -zxf downloads/$FILE2 -C src/$NAME2 --strip-components 1

cd src/$NAME1
mkdir -p build
cd build

export PKG_CONFIG_PATH="$ROOTDIR"/lib/pkgconfig:$PKG_CONFIG_PATH
echo "CUDA11, GCC9.1.0, c++14, cmake 3.20.1"
echo "CUDA10.2, GCC4.8.5, c++11, cmake 3.19.1"

cmake \
    -DCMAKE_CXX_STANDARD=14 \
    -DBUILD_EXAMPLES=OFF \
    -DWITH_QT=OFF \
    -DCUDA_GENERATION=Auto \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DBUILD_opencv_hdf=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DBUILD_TESTS=OFF \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DBUILD_opencv_cnn_3dobj=OFF \
    -DBUILD_opencv_dnn=OFF \
    -DBUILD_opencv_datasets=OFF \
    -DBUILD_opencv_aruco=OFF \
    -DBUILD_opencv_tracking=OFF \
    -DBUILD_opencv_text=OFF \
    -DBUILD_opencv_stereo=OFF \
    -DBUILD_opencv_saliency=OFF \
    -DBUILD_opencv_rgbd=OFF \
    -DBUILD_opencv_reg=OFF \
    -DBUILD_opencv_ovis=OFF \
    -DBUILD_opencv_matlab=OFF \
    -DBUILD_opencv_freetype=OFF \
    -DBUILD_opencv_dpm=OFF \
    -DBUILD_opencv_face=OFF \
    -DBUILD_opencv_dnn_superres=OFF \
    -DBUILD_opencv_dnn_objdetect=OFF \
    -DBUILD_opencv_bgsegm=OFF \
    -DBUILD_opencv_cvv=OFF \
    -DBUILD_opencv_ccalib=OFF \
    -DBUILD_opencv_bioinspired=OFF \
    -DBUILD_opencv_dnn_modern=OFF \
    -DBUILD_opencv_dnns_easily_fooled=OFF \
    -DBUILD_JAVA=OFF \
    -DBUILD_opencv_python2=OFF \
    -DBUILD_opencv_python3=ON \
    -DHAVE_opencv_python3=ON \
    -DPYTHON3_EXECUTABLE=$(python -c "import sys; print(sys.executable)") \
    -DPYTHON3_NUMPY_INCLUDE_DIRS=$(python -c "import numpy; print (numpy.get_include())") \
    -DPYTHON3_INCLUDE_DIR=/home/zhangwenting/anaconda3/include/python3.7m \
    -DPYTHON3_LIBRARY=/home/zhangwenting/anaconda3/lib/libpython3.so \
    -DPYTHON3_PACKAGES_PATH=/home/zhangwenting/anaconda3/lib/python3.7/site-packages \
    -DWITH_OPENGL=ON \
    -DWITH_VTK=OFF \
    -DFORCE_VTK=OFF \
    -DWITH_TBB=ON \
    -DBUILD_TBB=ON \
    -DBUILD_TIFF=ON \
    -DWITH_GDAL=ON \
    -DCUDA_FAST_MATH=ON \
    -DWITH_CUBLAS=ON \
    -DWITH_MKL=ON \
    -DMKL_USE_MULTITHREAD=ON \
    -DOPENCV_ENABLE_NONFREE=ON \
    -DWITH_CUDA=ON \
    -DCUDNN_INCLUDE_DIR=/home/share/cudnn-8.0-v5.1/include \
    -DCUDNN_LIBRARY=/home/share/cudnn-8.0-v5.1/lib64 \
    -DNVCC_FLAGS_EXTRA="--default-stream per-thread" \
    -DWITH_NVCUVID=OFF \
    -DBUILD_opencv_cudacodec=OFF \
    -DMKL_WITH_TBB=ON \
    -DWITH_FFMPEG=ON \
    -DMKL_WITH_OPENMP=ON \
    -DWITH_XINE=ON \
    -DENABLE_PRECOMPILED_HEADERS=OFF \
    -DCMAKE_INSTALL_PREFIX="$ROOTDIR" \
    -DOPENCV_GENERATE_PKGCONFIG=ON \
    -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
    ..

make -j"$(nproc)" && make install

echo "$NAME1" installed on "$ROOTDIR"
echo add following line to .zshrc
echo export OpenCV_DIR="$ROOTDIR"
