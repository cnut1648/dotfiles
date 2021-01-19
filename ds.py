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
        'conda install numpy scipy sympy matplotlib seaborn statsmodels pytest pandas jupyterlab ipywidgets nb_conda',
        # dl
        'conda install pytorch torchvision torchaudio cudatoolkit=11.0 -c pytorch',
        # both gpu & cpu, conda not support tf2
        'pip install tensorflow',
        # ml
        'conda install scikit-learn pillow albumentations scikit-learn opencv tqdm xgboost bayesian-optimization',
        # nlp
        'conda install gensim nltk spacy textblob',
        # others
        'conda install scrapy selenium beautifulsoup4 pymc3 networkx',
        # jupyter lab
        "jupyter labextension install '@aquirdturtle/collapsible_headings' '@jupyter-widgets/jupyterlab-manager' '@jupyterlab/shortcutui' '@jupyterlab/toc' '@krassowski/jupyterlab_go_to_definition' '@kiteco/jupyterlab-kite'",
        # other
        "conda install cached-property",
        # doc
        'conda install sphinx sphinx_rtd_theme recommonmark sphinx-autobuild',
        # pip
        "pip install jupyter-kite"
        ]

for cmd in conda_config + installs:
    os.system(cmd)
