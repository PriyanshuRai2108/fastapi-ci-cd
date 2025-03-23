name: Docker Image Build
on: push
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - name: Build & Push Image
        run: |
          echo "${{ secrets.DOCKERTOKEN }}" | docker login -u "<your-dockerhub-username>" --password-stdin
          docker build -t <your-dockerhub-username>/<image-name>:latest .
          docker push <your-dockerhub-username>/<image-name>:latest
