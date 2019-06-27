# Feed-The-Beast Infinity (Minecraft 1.7.10) in a Docker Container
Pull image:
```
docker pull audiohacked/ftb_infinity:stable
```

It's highly recommended to run a named data volume:
```
docker volume create minecraft_ftb_infinity_data
docker volume create minecraft_ftb_infinity_backups
```

Then, run the server container:
```
docker run --detach --interactive --tty \
    --name ftb_infinity \
    --volume minecraft_ftb_infinity_data:/minecraft/world \
    --volume minecraft_ftb_infinity_backups:/minecraft/backups \
    --publish 25565:25565 \
    --env EULA=TRUE \
    audiohacked/ftb_infinity:stable
```
