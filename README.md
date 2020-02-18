Install Docker:

# https://docs.docker.com/install/

Build python 2 container using python 2 base image from docker.

```
docker image build -t demo-py:v0.0 python_upgrade_demo/
```

To see the built image
```
docker images
```

Run Python2 container from the image

```
docker run --name "demo-py-run1" demo-py:v0.0
```

Update base image to use python3 instead.

```
docker image build -t demo-py:v1.0 python_upgrade_demo/
```

Run a new container with Python3 image and check the difference in the results of division for verification.
```
docker run --name "demo-py-run2" demo-py:v1.0
```

Update code to fix the bug.

```
docker image build -t demo-py:v1.1 python_upgrade_demo/
```

Run a new container with Python3 image and check the difference in the results of division for verification.
```
docker run --name "demo-py-run3" demo-python3:v0.0 
```

To list all images
```
docker images
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

# PART 2: Container with FFMPEG 

Build the container with ffmpeg and source code
```
docker image build -t "demo-ffmpeg:v0.0" ffmpeg_demo/
```

Run the container 
```
docker run --name "ffmpeg_run1" demo-ffmpeg:v0.0
```

Make changes to the transcode.sh script by uncommenting the ffmpeg command using vp9. Redeploy the code

```
docker image build -t "demo-ffmpeg:v0.0" ffmpeg_demo/
docker run --name "ffmpeg_run2" demo-ffmpeg:v0.0
```

Checking logs
```
docker container logs demo-py2-run5
```

Replace entry point with

```
tail -f /dev/null
```

Log into bash
```
docker exec -it "ffmpeg_run2" /bin/bash

```
