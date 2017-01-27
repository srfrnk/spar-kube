all: git-update images deploy

git-update:
	git submodule init
	git submodule update

images: git-update
	make -C application-images/spark push

deploy: git-update
	kubectl create -f kubernetes/examples/spark
