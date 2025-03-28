rm openpoints/dataset/s3dis/s3dis.py
cp AADNet/openpoints/dataset/s3dis/s3dis.py openpoints/dataset/s3dis/s3dis.py
rm openpoints/dataset/scannetv2/scannet.py
cp AADNet/openpoints/dataset/scannetv2/scannet.py openpoints/dataset/scannetv2/scannet.py

rm openpoints/dataset/data_util.py
cp AADNet/openpoints/dataset/data_util.py openpoints/dataset/data_util.py
rm openpoints/loss/build.py
cp AADNet/openpoints/loss/build.py openpoints/loss/build.py

cp AADNet/cfgs/ cfgs/
