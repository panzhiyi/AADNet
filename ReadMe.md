## [Point Cloud Semantic Segmentation with Sparse and Inhomogeneous Annotations](https://arxiv.org/pdf/2312.06259)

[Zhiyi Pan](https://github.com/panzhiyi), Nan Zhang, Wei Gao, Shan Liu, Ge Li.

#### Installation Guide

##### Prerequisites

Before installing our program, please install [PointNeXt](https://github.com/guochengqian/PointNeXt) first.

##### Installation steps

1. Move all the files of this project to the root directory of PointNeXt.
2. Run the install script `install_AAD.sh`, or replace the corresponding files according to the guide.

#### Usage for S3DIS

**Dataset**  

The presampling is just to collect all point clouds, area by area and room by room, following [PointNeXt](https://github.com/guochengqian/PointNeXt). We provide homogeneous and inhomogeneous annotations with 10%, 1%, 0.1% and 0.01% label rates.

```shell
mkdir -p data/S3DIS/
cd data/S3DIS
gdown https://drive.google.com/u/2/uc?id=1uMA58XjKjkmxwIq3dyIrMCIFWnZ0j_41
unzip s3dis.zip
```

**Training**  

For example, train `PointNeXt-l` with 1% homogeneous sparse annotations

```shell
CUDA_VISIBLE_DEVICES=0 python examples/segmentation/main.py --cfg cfgs/s3dis/pointnext-l-uni-1.yaml
```

**Test on Area 5** 

```shell
CUDA_VISIBLE_DEVICES=0 python examples/segmentation/main.py cfgs/s3dis/<YOUR_CONFIG> wandb.use_wandb=False mode=test --pretrained_path <YOUR_CHECKPOINT_PATH>
```

#### Usage for ScanNet

**Dataset**  

For homogeneous annotations, we provide three settings include 1% label rate, 20 points per scene and 20 points per scene (OTOC setting). While for inhomogeneous  annotations, we provide annotations at 10% and 1% label rates. You can download our preprocessed ScanNet dataset for weak supervision as follows:

```shell
cd data
gdown <the_link_will_be_released_latter>
tar -xvf ScanNet.tar
```

**Training** 

For example, train `PointNeXt-l` with 1% homogeneous sparse annotations

```shell
CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 python examples/segmentation/main.py --cfg cfgs/scannet/pointnext-l-1.yaml
```

**Val**

```shell
CUDA_VISIBLE_DEVICES=0  python examples/segmentation/main.py --cfg cfgs/scannet/<YOUR_CONFIG> mode=test dataset.test.split=val --pretrained_path <YOUR_CHECKPOINT_PATH>
```

#### Algorithm implementation

The algorithm implementation in the program can be found in the `openpoints/dataset/data_util.py` and `openpoints/loss/bulid.py`, respectively:

* Label-aware point cloud downsampling strategy (LaDS) is implemented by rewriting the *voxelize* function (line 128 ~ line 153) in `openpoints/dataset/data_util.py`.
* Multiplicative dynamic entropy for asynchronous training (MDE-AT) is implemented by constructing the *AsynchronousCrossEntropy* function (line 13 ~ line 43) in `openpoints/loss/bulid.py`.

