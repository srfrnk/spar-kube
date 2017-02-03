all: git-update images push deploy

git-update:
	git submodule init
	git submodule update

images: git-update
	make -C application-images/spark all

push: images
	make -C application-images/spark push

deploy: git-update
	kubectl apply -f kubernetes/examples/spark

delete-pods: git-update
	kubectl delete -f kubernetes/examples/spark/spark-master-controller.yaml
	kubectl delete -f kubernetes/examples/spark/spark-ui-proxy-controller.yaml
	kubectl delete -f kubernetes/examples/spark/spark-worker-controller.yaml
	kubectl delete -f kubernetes/examples/spark/zeppelin-controller.yaml

update-pods: git-update delete-pods deploy

clean:
	make -C application-images/spark clean

destroy: git-update
	kubectl delete -f kubernetes/examples/spark
