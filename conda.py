import os

conda_config = [
        # latest python supported by tf & torch is 3.8
        'conda create -n ds python=3.8',
        # true: flexible
        # false: disabled
        # strict: when find pkg in one channel then won't look at lower-priority channel
        #   reduce time for SAT solver
        'conda config --set channel_priority strict',
        'conda config --add channels conda-forge'
        ]

installs = [
        # computing
        'conda install numpy scipy sympy matplotlib seaborn pandas jupyterlab ipywidgets',
        # dl
        'conda install pytorch torchvision torchaudio cudatoolkit=11.0 -c pytorch',
        # both gpu & cpu, conda not support tf2
        'pip install tensorflow',
        # ml
        'conda install scikit-learn pillow albumentations scikit-learn opencv tqdm',
        # nlp
        'conda install gensim nltk spacy',
        # others
        'conda install scrapy selenium beautifulsoup4 pymc3 networkx',
        ]

for cmd in conda_config + installs:
    os.system(cmd)
