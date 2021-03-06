#!/bin/bash
export MOUNT_PATH=$1
cd $MOUNT_PATH

if [ ! -d "$MOUNT_PATH/horovod/data" ]; then
  mkdir -p horovod/data
fi

cd $MOUNT_PATH/horovod/data
if [ ! -f "cifar-10-python.tar.gz" ]
then
  echo "Downloading cifar10..."
  wget -q http://www.cs.toronto.edu/~kriz/cifar-10-python.tar.gz
fi
echo "- File 'cifar-10-python.tar.gz' is in $MOUNT_PATH/horovod/data"
if [ ! -d "cifar-10-batches-py" ]
then
  echo "Found cifar-10-python.tar.gz, untarring..."
  sudo tar xzf cifar-10-python.tar.gz
fi
echo "- Folder 'cifar-10-batches-py' is in $MOUNT_PATH/horovod/data"

echo "- Downloading job-pre.sh to $MOUNT_PATH/horovod"
wget -q https://raw.githubusercontent.com/Smarker/batchai-benchmark/master/horovod/job-prep.sh -O $MOUNT_PATH/horovod/job-prep.sh


echo "- Downloading run-cifar10.sh to $MOUNT_PATH/horovod"
wget -q https://raw.githubusercontent.com/Smarker/batchai-benchmark/master/horovod/run-cifar10.sh -O $MOUNT_PATH/horovod/run-cifar10.sh

echo "- Downloading cifar10_cnn.py to $MOUNT_PATH/horovod"
wget -q https://raw.githubusercontent.com/Smarker/batchai-benchmark/master/horovod/cifar10_cnn.py -O $MOUNT_PATH/horovod/cifar10_cnn.py
