# Docker challenge

Docker version,

```bash
docker version
```

## Labs

Pull,

```bash
docker pull docker.io/spkane/quantum-game:latest
```

Run,

```bash
docker run --rm -d --name quantum --publish mode=ingress,published=18080,target=8080 docker.io/spkane/quantum-game:latest
```

Copy the file,

```bash
echo "Piotr Migdał, Patryk Hes, Michał Krupiński" > app-authors.txt
```

Get the container details,

```bash
docker inspect quantum > container-details.txt
```

Put it back in the container,

```bash
docker cp README.md quantum:/app
```

Create an image from the running container

```bash
docker commit quantum
docker tag 1ed7a112bfd2 spkane/quantum-game:new-latest
```

Stop and remove the image,

```bash
docker stop quantum
docker image rm spkane/quantum-game:latest
docker image rm spkane/quantum-game:new-latest
```

## Run the container from the image we build in the lab

```bash
docker run -it --rm --publish mode=ingress,target=8080,published=8080 node-server
```

## Repositories

### Docker Hub

Login

```bash
docker login
```

```bash
docker push salleaffaire/demo-node-server:latest
```
