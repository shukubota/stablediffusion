FROM anibali/pytorch:2.0.1-cuda11.8

WORKDIR /app

COPY . .

RUN sudo apt-get update
RUN pip install transformers==4.30.1 diffusers xformers accelerate flask

CMD flask --app main run --port 8080 --host=0.0.0.0
