build-image:
	docker build --no-cache -t training/jenkins .

run-image:
	docker rm -f jenkins || true
	docker run -it -P -d --name jenkins training/jenkins
