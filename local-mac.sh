#!/bin/bash

echo "Creating conda environment from environment.yml..."
conda env create -f environment.yml

# Activate the environment
echo "Activating conda environment..."
source activate llm-template

# Install the metal accelerators for LLM
# https://mlc.ai/mlc-llm/
# https://github.com/mlc-ai/mlc-llm
# Package install instructions: https://mlc.ai/package/
# LLM https://llm.datasette.io/en/stable/
# LLM-mlc: https://github.com/simonw/llm-mlc
# Installs in: Library/Application Support/io.datasette.llm/mlc/dist/p
# brew install git-lfs

llm install llm-mlc
llm mlc pip install --pre --force-reinstall \
  mlc-ai-nightly \
  mlc-chat-nightly \
  -f https://mlc.ai/wheels
llm mlc setup
llm mlc download-model Llama-2-13b-chat --alias l13b