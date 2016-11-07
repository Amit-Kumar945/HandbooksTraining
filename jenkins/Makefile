build:
	docker build --no-cache -t training/jenkins .

run:
	docker rm -f jenkins || true
	docker run -it -P -d --name jenkins training/jenkins

run2:
	docker run -it -P -d --name jenkins2 training/jenkins
	
