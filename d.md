# SalKG
[![arXiv](https://img.shields.io/badge/arXiv-1234.56789-00ff00.svg)](https://arxiv.org/abs/2104.08793) ![PyTorch](https://img.shields.io/badge/PyTorch-%23EE4C2C.svg?style=for-the-badge&logo=PyTorch&logoColor=white)


This is the official PyTorch implementation of our NeurIPS 2021 [paper](https://arxiv.org/abs/2104.08793)

```
SalKG: Learning From Knowledge Graph Explanations for Commonsense Reasoning
Aaron Chan, Jiashu Xu*, Boyuan Long*, Soumya Sanyal, Tanish Gupta, Xiang Ren
NeurIPS 2021
*=equal contritbution
```

**Please note that this is still under construction**

**TODO**

- [ ] fine occl
- [ ] hybrid models
- [ ] release dataset files



## Requirements

- python >= 3.6
- pytorch >= 1.7.0

After you have pytorch (preferably with cuda support), please install other requirements by `pip install -r requirements.txt`



## Data

First download data and make the dataset looks like this
(assuming you want to train SalKG models on csqa)

```
data/ # root dir
  csqa/
    path_embedding.pickle

  mhgrn_data/
    csqa/
      graph/
      paths/
      statement/
```



## Usage

We use neptune to track our experiment. Please set the api token and project id by
```
export NEPTUNE_API_TOKEN='<YOUR API KEY>'
export NEPTUNE_PROJ_NAME='<YOUR PROJECT NAME>'
```

The pipeline to train SalKG models:

1. run `runs/build_qa.sh` for generating indexed dataset required by nokg and kg model

  The flag `--fine-occl` would generate indexed dataset required by fine occl model

2. run `runs/qa.sh` to run nokg and kg model

3. run `runs/save_target_saliency.sh` with nokg / kg checkpoints to generate the model's saliency. Currently we suppport coarse occlusion and fine {occlusion, gradient} saliency 



## Results

The table below shows our results in three commonly used QA benchmarks: **CommonsenseQA (CSQA)**, **OpenbookQA (OBQA)**, and **CODAH**

For each column,

- ![#c5f015](000000.png) Green cells are the best performer
- ![#1589F0](https://via.placeholder.com/15/1589F0/000000?text=+) 

- ![#f03c15](000000.png) `#f03c15`
- ![#c5f015](000000.png) `#c5f015`
- ![#1589F0](000000.png) `#1589F0`
