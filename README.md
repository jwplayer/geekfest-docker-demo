git # Python upgrade demo

Install Docker:

# https://docs.docker.com/install/

Build python 2 container using python 2 base image from docker.

```
docker image build -t demo-py2 python_upgrade_demo/
docker run --name "demo-py2-run1" demo-python2 

```

Update base image to use python3 instead and check the difference in the results of division for verification.

```
docker image build -t demo-python3 python_upgrade_demo/
docker run --name "demo-python3-run1" demo-python3 
```


# FFMPEG build with H264 and AAC

```
cd ffmpeg_demo
```

Multistage build creating portable ffmpeg build and copying it to the application container

```
docker image build -t ffmpeg_x264 .
docker container run ffmpeg_x264
```

Make changes to bash script by uncommenting the ffprobe command and commenting ffmpeg one.
Redeploy and run using above docker commands.