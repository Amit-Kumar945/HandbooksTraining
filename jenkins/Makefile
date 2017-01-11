build-image:
#	docker build --no-cache -t training/jenkins .
	docker build -t training/jenkins .

run-image:
	docker rm -f jenkins || true
	docker run -it -p 8080:8080 -d --name jenkins training/jenkins

run-image-fg:
	docker run -it --rm -P --name jenkins-fg training/jenkins

run-image-dind:
	docker rm -f jenkins-dind || true
	docker run -it -p 8080:8080 -d --name jenkins-dind training/jenkins
