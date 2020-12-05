import os

conda_config = [
        # true: flexible
        # false: disabled
        # strict: when find pkg in one channel then won't look at lower-priority channel
        #   reduce time for SAT solver
        'conda config --set channel_priority strict',
        'conda config --add channels conda-forge'
        ]

installs = [
        # latest python supported by tf & torch is 3.8
        'conda create -n ds python=3.8 tensorflow=2.2.0 tensorflow-gpu',
        # computing
        'conda install numpy scipy sympy matplotlib seaborn pandas jupyterlab ipywidgets',
        # others
        'conda install scrapy selenium beautifulsoup4 pymc3 networkx',
        # ml
        'conda install scikit-learn pillow albumentations scikit-learn opencv tqdm xgboost bayesian-optimization',
        # nlp
        'conda install gensim nltk spacy',
        # torch, tf 2.2 only support cudatoolkit=10
        'conda install pytorch=1.7 torchvision torchaudio -c pytorch',
        ]

for cmd in conda_config + installs:
    os.system(cmd)
