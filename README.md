# How to use
------------

```
$ docker build -t flask-app-image .
```
is going to output, among other things,
```
WARNING: You are using pip version 19.2.3, however version 20.2.2 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
```

```
$ docker image ls
```

```
$ docker run -it --rm --entrypoint /bin/sh flask-app-image
~ $ whoami
themightyuser
~ $ exit
```

```
$ docker run \
  --name flask-app-container \
  -d \
  -p 8000:5000 \
  --rm \
  flask-app-image:latest
```
to make sure the web application is running, open a web browser and verify that you can
navigate to 127.0.0.1:8000/, 127.0.0.1:8000/Alice, 127.0.0.1:8000/Bob without any errors

```
$ docker container ls
$ docker container stop flask-app-container
$ docker container ls

$ docker image ls
$ docker image rm flask-app-image
$ docker image ls
```



# Encountered errors
--------------------

```
$ docker run -it --rm --entrypoint /bin/bash flask-app-image:latest 
docker: Error response from daemon: OCI runtime create failed: container_linux.go:349: starting container process caused "exec: \"/bin/bash\": stat /bin/bash: no such file or directory": unknown.
```
as per https://stackoverflow.com/questions/29535015/error-cannot-start-container-stat-bin-sh-no-such-file-or-directory execute
```
$ docker inspect flask-app-image
```
and note that `["ContainerConfig"]["Cmd"]` doesn't contain `/bin/bash` but `/bin/sh`

the following discussion is loosely relation to the previous error: https://stackoverflow.com/questions/54820846/starting-container-process-caused-exec-bin-sh-stat-bin-sh-no-such-file