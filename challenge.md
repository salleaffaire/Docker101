# Docker challenge

<https://can01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flearning.oreilly.com%2Fplaylists%2F559446b5-55d2-42a2-82ed-fb53be756224&data=05%7C01%7Crandi.barton%40rossvideo.com%7C4f35e2e221bc45c2871e08dab5e54fdc%7C5d1f9dedbb98418c9ad2e1d24a9152a1%7C1%7C0%7C638022293744647300%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=pWZ09j4v%2BkAL2eKk8YLajz6LAxQDvaufQaScaKonKco%3D&reserved=0>

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
