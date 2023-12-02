FROM anibali/pytorch:2.0.1-cuda11.8

WORKDIR /app

COPY . .

RUN sudo apt-get update
RUN pip install transformers==4.30.1 diffusers invisible-watermark
RUN pip install -r requirements.txt
RUN pip install -e .

RUN sudo apt-get install -y libgl1-mesa-dev

# python scripts/txt2img.py --prompt "a professional photograph of an astronaut riding a horse" --ckpt ./checkpoints/chilloutmix_NiPrunedFp32Fix.safetensors --config configs/stable-diffusion/v2-inference-v.yaml --H 512 --W 512

