build-image:
	docker build -t training/puppet .

run-image:
	docker run -it -P -v ${PWD}/recipes:/root/recipes training/puppet
