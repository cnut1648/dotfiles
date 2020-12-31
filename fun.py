import os

conda_config = [
        # latest python supported by tf & torch is 3.8
        'conda create -n fun python=3.8',
        # true: flexible
        # false: disabled
        # strict: when find pkg in one channel then won't look at lower-priority channel
        #   reduce time for SAT solver
        'conda config --set channel_priority strict',
        'conda config --add channels conda-forge'
        ]

installs = [
        # doc
        'conda install sphinx sphinx_rtd_theme recommonmark sphinx-autobuild',
        # pip
        "pip install taichi"
        ]

for cmd in conda_config + installs:
    os.system(cmd)
