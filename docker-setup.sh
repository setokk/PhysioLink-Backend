docker run -p 3306:3306 --name physiolink-db -e MARIADB_ROOT_PASSWORD=root -d mariadb:latest
docker pull setok/physiolink:physiolink-image
docker network create physionet
docker run --name physiolink -d --net=physionet -p 3000:3000 setok/physiolink:physiolink-image
docker network connect --alias physiodb physionet physiolink-db
