# Docker challenge

Docker version,

```bash
docker version
```

They may not match, that's ok. As long as the server is ahead of the client.

## Labs 1 (Launch and Test Your First Container)

Look at images locally,

```bash
docker images
```

Pull,

```bash
docker pull docker.io/spkane/quantum-game:latest
```

Talk about the image name and tag. Never a good idea in general to use latest.

Run,

```bash
docker run --rm --publish mode=ingress,published=18080,target=8080 docker.io/spkane/quantum-game:latest
```

Run detached with a name,

```bash
docker run --rm -d --name quantum --publish mode=ingress,published=18080,target=8080 docker.io/spkane/quantum-game:latest
```

Look at the running containers,

```bash
docker ps -a
```

Talk about docker container status.

- Created
- Running
- Restarting
- Exited (docker stop)
- Paused
- Dead

[Maybe] Run detached without a name,

```bash
docker run --rm -d --publish mode=ingress,published=18080,target=8080 docker.io/spkane/quantum-game:latest
```

Docker stats,

```bash
docker stats <the container name>
```

Pausing a container,

```bash
docker pause <the container name>
```

Remove the image,

```bash
docker rmi spkane/quantum-game:latest
```

## Labs 2 (Launch, Inspect, Debug, and Configure a Container)

Start the container,

```bash
docker container run --name quantum -d --rm --publish mode=ingress,published=18080,target=8080 docker.io/spkane/quantum-game:latest
```

List containers (new CLI),

```bash
docker container ls
```

Inspect the container,

```bash
docker container inspect <the container name>
```

Exec inside a container,

```bash
docker exec -it quantum sh
```

Once inside the container,

```bash
ls -la
```

```bash
top
```

CTRL-C to end top.

To exit the container,

```bash
exit
```

Stop the container,

```bash
docker container stop quantum
```

## [Skip - it doesn't work] Lab 3 (Challenge: Download, Configure, and Run a Simple Web Container)

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

Docker run,

```bash
docker run --rm --name demo-node-app --env SERVER_PORT=8082 --publish mode=ingress,published=18080,target=8082 demo-node-app:latest
```

Docker tag,

```bash
docker tag demo-node-app:latest demo-node-app:1.0.0
```

Note that we built latest first and tagged after. Good practice to keep a latest up-to-date.

## Repositories

### Docker Hub

Login

```bash
docker login
```

```bash
docker push salleaffaire/demo-node-server:latest
```
