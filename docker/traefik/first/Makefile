run-traefik:
	docker rm -f traefik || true
	docker run -d -p 8080:8080 -p 80:80 -v ${PWD}/traefik.toml:/traefik.toml -v /var/run/docker.sock:/var/run/docker.sock --name traefik traefik

run-service1:
	docker rm -f service1 || true
	docker run --name service1 -d -P emilevauge/whoami

run-service2:
	docker rm -f service2 || true
	docker run --name service2 -d -P emilevauge/whoami

run-all:
	make run-traefik run-service1 run-service2
