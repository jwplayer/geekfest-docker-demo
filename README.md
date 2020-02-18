Install Docker:

# https://docs.docker.com/install/

Verify installation

```
docker run hello-world
```

Run a python application in container using python 2 base image from docker hub.

```
docker image build -t demo-py:v0.0 python_upgrade_demo/
```

To see the built image
```
docker images
```

Run Python2 container from the image

```
docker run --rm --name "demo-py-run" demo-py:v0.0
```

Update base image to use python3 instead.

```
docker image build -t demo-py:v1.0 python_upgrade_demo/
```

To list all images
```
docker images demo*
```

Run a new container with Python3 image and check the difference in the results of division for verification.
```
docker run --name "demo-py3-run1" demo-py:v1.0
```

Update code to fix the bug.

```
docker image build -t demo-py:v1.1 python_upgrade_demo/
```

Run a new container with Python3 image and check the difference in the results of division for verification.
```
docker run --name "demo-py-run2" demo-python3:v0.0 
```

To list all running containers
```
docker ps -a
```

To stop a running container

```
docker stop demo-py2-run1
```

To remove a container

```
docker rm demo-py2-run1
```

To remove an image

```
docker rmi demo-python3-run1
```

To remove all the containers

```
docker rm $(docker ps -a -q)
```

To remove all images

```
docker rmi $(docker images demo* -q)
```


# PART 2: Container with FFMPEG 

Build the container with ffmpeg and source code
```
docker image build -t "demo-ffmpeg:v0.0" ffmpeg_demo/
```

Run the container 
```
docker run --rm --name "demo-ffmpeg-run1" demo-ffmpeg:v0.0
```

Checking logs
```
docker container logs demo-py2-run5
```

Add following to source code(transcode.sh)

```
python3 --version
```

Update dependencies

```
RUN apk add --no-cache ffmpeg python3
```

Build the container with ffmpeg and source code
```
docker image build -t "demo-ffmpeg:v1.0" ffmpeg_demo/
```

Run the container 
```
docker run --rm --name "demo-ffmpeg-run2" demo-ffmpeg:v1.0
```

Replace entry point with

```
tail -f /dev/null
```

Build the container with ffmpeg and source code
```
docker image build -t "demo-ffmpeg:v1.1" ffmpeg_demo/
```

Run the container 
```
docker run --name "demo-ffmpeg-run3" demo-ffmpeg:v1.1
```

Log into shell
```
docker exec -it demo-ffmpeg-run3 sh

```

Stop the running container

```
docker stop demo-ffmpeg-run4
```