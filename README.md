# Python upgrade demo

```
cd python_upgrade
```

Build python 2 container using python 2 base image from docker.


```
cd python_upgrade_demo
docker image build -t python_demo_3 .
docker container run python_demo_3
```

Update base image to use python3 instead and check the difference in the results of division for verification.

```
docker image build -t python_demo_3 .
docker container run python_demo_3
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