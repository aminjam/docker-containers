
build: rootfs.tar Dockerfile
	docker build -t busybox .

tag:
	docker tag busybox aminjam/nginx-static:tiny

rootfs.tar:
	cd rootfs && docker build -t busybox-rootfs .
	docker run --rm busybox-rootfs cat /tmp/buildroot/output/images/rootfs.tar > rootfs.tar
	docker rmi busybox-rootfs
