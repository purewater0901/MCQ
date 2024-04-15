#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os
from setuptools import setup

def get_version() -> str:
    # https://packaging.python.org/guides/single-sourcing-package-version/
    init = open(os.path.join("offlinerl", "__init__.py"), "r").read().split()
    return init[init.index("__version__") + 2][1:-1]

setup(
    name='offlinerl',
    description="A Library for Offline RL (Batch RL)",
    version=get_version(),
    python_requires=">=3.7",
    install_requires=[
        "loguru==0.5.3",
        "gtimer",
        "tianshou==0.4.2",
    ],
    
)
