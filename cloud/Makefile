build-image:
	docker build -t training/cloud .

run-image:
	docker run --privileged -it -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) -v ${PWD}/terraform:/root/terraform training/cloud /bin/bash
