build: rootfs.tar Dockerfile
	docker build -t busybox .

tag:
	docker tag busybox aminjam/nginx-proxy:tiny

stage/app:
	wget -q --no-check-certificate https://godist.herokuapp.com/projects/ddollar/forego/releases/current/linux-amd64/forego -P stage/
	wget -q --no-check-certificate https://github.com/jwilder/docker-gen/releases/download/0.3.4/docker-gen-linux-amd64-0.3.4.tar.gz -O docker-gen.tar.gz
	tar -xvzf docker-gen.tar.gz
	mv docker-gen stage/docker-gen
	rm docker-gen.tar.gz

rootfs.tar:
	cd rootfs && docker build -t busybox-rootfs .
	docker run --rm busybox-rootfs cat /tmp/buildroot/output/images/rootfs.tar > rootfs.tar
	docker rmi busybox-rootfs
