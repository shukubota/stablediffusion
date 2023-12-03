import torch
from diffusers import StableDiffusionPipeline
from flask import Flask, request

import base64
from io import BytesIO


################
pipe = StableDiffusionPipeline.from_pretrained("CompVis/stable-diffusion-v1-4", revision="fp16", torch_dtype=torch.float16)
pipe.to("cuda")
pipe.enable_xformers_memory_efficient_attention()
#############

globalpipe = 1123

app = Flask(__name__)

@app.route("/")
def hello_world():
    return {"body": "hello"}

@app.route("/txt2img", methods=["POST"])
def txt2img():
    body = request.get_json()
    prompt = body['prompt']

    result = pipe(prompt)
    image = result.images[0]
    buffer = BytesIO()
    image.save(buffer, "jpeg")
    img_str = base64.b64encode(buffer.getvalue()).decode('ascii')

    print(img_str)
    return {'data': img_str}

