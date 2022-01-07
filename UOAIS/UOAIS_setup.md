# Unseen Object Amodal Instance Segmentation (UOAIS)のセットアップ
基本は[UOAIS](https://github.com/gist-ailab/uoais)Readmeにしたがってセットアップした

## 今後の予定
- [] UOAIS-SIM.zipをダウンロードする

## setupした場所
> ~/clones/

## 本家とやり方が異なったものリスト  
（日本語なのでリンクは機能してないです..)  
- [3. 仮想環境の作成](#3.-仮想環境の作成)
- [5. AdelaiDetのビルド](#5.-AdelaiDetのビルド)

## 1. リポジトリのダウンロードとフォルダ作成
```
cd ~/clones
git clone https://github.com/gist-ailab/uoais.git
cd uoais
mkdir output
```

## 2. サンプルの重みファイルのダウンロード
1. ダウンロード  
[[GDrive](https://drive.google.com/drive/folders/1D5hHFDtgd5RnX__55MmpfOAM83qdGYf0?usp=sharing)]  
直下にあるフォルダや`.pth`ファイルをすべてダウンロード  
※`UOAIS-SIM.zip`はダウンロードしていない．理由はファイル容量が無かったから
2. ファイルの設置  
    - `R50_depth_mlc_occatmask_hom_concat`を`output`へ移動  
    - `R50_rgbdconcat_mlc_occatmask_hom_concat`を`output`へ移動　　
    - `rgbd_fg.pth`を`foreground_segmentation`へ移動  

## 3. 仮想環境の作成  
**ここがREADMEと違う**  
pythorchとCUDAのバージョンが違う問題が発生したため，自分で指定した
```
conda criate -n uoais python=3.8
conda activate uoais
pip install torch==1.10.1+cu113 torchvision==0.11.2+cu113 torchaudio==0.10.1+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html
pip install shapely torchfile opencv-python pyfastnoisesimd rapidfuzz termcolor
pip install imageio
```

## 4. Detectron2のインストール  
sourceからビルドしたよ
```
cd ~/clones
python -m pip install 'git+https://github.com/facebookresearch/detectron2.git'
```

## 5. AdelaiDetのビルド
uoaisのリポジトリに含まれてる  
本家AdelaiDetにいくつか変更を加えているらしい  
```
cd ~/clones/uoais
python setup.py build develop 
```

## 6. サンプルを動かしてみよう
動いたらOK
```
# UOAIS-Net (RGB-D) + CG-Net (foreground segmentation)
python tools/run_on_OSD.py --use-cgnet --dataset-path ./sample_data --config-file configs/R50_rgbdconcat_mlc_occatmask_hom_concat.yaml

# UOAIS-Net (depth) + CG-Net (foreground segmentation)
python tools/run_on_OSD.py --use-cgnet --dataset-path ./sample_data  --config-file configs/R50_depth_mlc_occatmask_hom_concat.yaml

# UOAIS-Net (RGB-D)
python tools/run_on_OSD.py --dataset-path ./sample_data --config-file configs/R50_rgbdconcat_mlc_occatmask_hom_concat.yaml

# UOAIS-Net (depth)
python tools/run_on_OSD.py --dataset-path ./sample_data --config-file configs/R50_depth_mlc_occatmask_hom_concat.yaml
```