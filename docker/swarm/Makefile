build:
	docker build -t training/swarm .

run:
	docker run --privileged -it -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) -v ${PWD}:/root/terraform training/swarm /bin/bash
