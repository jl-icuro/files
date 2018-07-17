#!/bin/bash

# Install CUDA
sudo apt-get install -y wget
cd ~
mkdir cuda-9.0
cd cuda-9.0
wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb

# Rename deb file
mv cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb

# unpackage CUDA 9.0
sudo dpkg -i cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb
sudo apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda-9-0

# Fix bashrc
echo "# Fix CUDA Path and Links" >> ~/.bashrc
echo "export PATH=$PATH:/usr/local/cuda-9.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:/home/$USER/protobuf/bin"  >> ~/.bashrc
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-9.0/lib64:" >> ~/.bashrc
echo "export PYTHONPATH=/home/$USER/caffe/python:$PYTHONPATH:/home/$USER/tensorflow/models/research:/home/$USER/tensorflow/models/research/slim" >> ~/.bashrc

# Install cuDNN
cd ~
mkdir cuDNN
cd cuDNN
wget https://github.com/ashokpant/cudnn_archive/raw/master/v7.0/libcudnn7_7.0.5.15-1+cuda9.0_amd64.deb
sudo dpkg -i libcudnn7_7.0.5.15-1+cuda9.0_amd64.deb
sudo apt-get update

#tar -xzvf cudnn-9.0-linux-x64-v7.tgz
#sudo cp cuda/include/cudnn.h /usr/local/cuda/include
#sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
#sudo chmod a+r /usr/local/cuda/include/cudnn.h

# Install Dependencies
sudo apt-get install -y python-pil python-lxml python-tk python-pip python-dev
pip install --user Cython
pip install --user contextlib2
pip install --user jupyter
pip install --user matplotlib

# Clone tensorflow models
sudo apt-get install -y git
cd ~
mkdir tensorflow
cd tensorflow
git clone https://github.com/tensorflow/models.git

# Install Protobuf and compile protobuf
sudo apt-get install -y unzip
cd ~
mkdir protobuf
cd protobuf
wget https://github.com/google/protobuf/releases/download/v3.5.1/protoc-3.5.1-linux-x86_64.zip
unzip protoc-3.5.1-linux-x86_64.zip

# Link protobuf and tensorflow

# Compile protobuf libraries
cd /home/$USER/tensorflow/models/research
export PATH=$PATH:/usr/local/cuda-9.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:/home/$USER/protobuf/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-9.0/lib64:
export PYTHONPATH=/home/$USER/caffe/python:$PYTHONPATH:/home/$USER/tensorflow/models/research:/home/$USER/tensorflow/models/research/slim
protoc object_detection/protos/*.proto --python_out=.

# Install tensorflow
sudo pip install tensorflow-gpu

# Install COCO API
cd ~
git clone https://github.com/cocodataset/cocoapi.git
cd cocoapi/PythonAPI
make
cp -r pycocotools ~/tensorflow/models/research/
