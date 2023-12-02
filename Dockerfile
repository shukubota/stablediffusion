FROM anibali/pytorch:2.0.1-cuda11.8

WORKDIR /app

COPY . .

RUN sudo apt-get update

# RUN sudo apt-get install -y rustc
RUN pip install transformers==4.30.1 diffusers invisible-watermark
RUN pip install -e .
