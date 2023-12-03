!#/bin/bash
commit=(`git show --format='%h' --no-patch`)
DOCKER_BUILDKIT=1 docker build --platform linux/amd64 . -f Dockerfile -t asia-northeast1-docker.pkg.dev/empowerme-bb3c5/empowerme-diffusion/${commit}:latest

gcloud artifacts repositories describe empowerme-diffusion --project=empowerme-bb3c5 --location=asia-northeast1
gcloud auth configure-docker asia-northeast1-docker.pkg.dev
docker push asia-northeast1-docker.pkg.dev/empowerme-bb3c5/empowerme-diffusion/${commit}
