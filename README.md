# Feed-The-Beast Infinity (Minecraft 1.7.10) in a Docker Container
Pull image:
```
docker pull audiohacked/ftb_infinity:stable
```

It's highly recommended to run a data container:
```
docker run --name ftb_infinity_datastore audiohacked/ftb_infinity:stable true
```

Then, run the server container:
```
docker run -d -it --name ftb_infinity \
    --volumes-from ftb_infinity_datastore \
    -p 25565:25565 \
    -e EULA=TRUE \
    audiohacked/ftb_infinity:stable
```
