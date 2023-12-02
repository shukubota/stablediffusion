FROM anibali/pytorch:2.0.1-cuda11.8

WORKDIR /app

RUN sudo apt-get update

# RUN sudo apt-get install -y rustc
pip install transformers==4.30.1 diffusers invisible-watermark
