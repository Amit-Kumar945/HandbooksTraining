build-image:
#	docker build --no-cache -t training/jenkins .
	docker build -t training/jenkins .

run-image:
	docker rm -f jenkins || true
	docker run -it -P -d --name jenkins training/jenkins

run-image-fg:
	docker run -it --rm -P --name jenkins-fg training/jenkins
