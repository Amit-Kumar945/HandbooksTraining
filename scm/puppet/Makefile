build-image:
	docker build -t training/puppet .

run-image:
	docker run --privileged -it -P -v ${PWD}/recipes:/root/recipes  -v ${PWD}/modules:/root/modules training/puppet
