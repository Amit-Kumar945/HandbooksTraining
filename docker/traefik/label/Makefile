run-traefik:
	docker rm -f traefik || true
	docker run -d -p 8080:8080 -p 80:80 -v ${PWD}/traefik.toml:/traefik.toml -v /var/run/docker.sock:/var/run/docker.sock --name traefik traefik

run-be-service-server1:
	docker rm -f be-service-server1 || true
	docker run --name be-service-server1 -d --label "traefik.backend=be-service" emilevauge/whoami

run-be-service-server2:
	docker rm -f be-service-server2 || true
	docker run --name be-service-server2 -d --label "traefik.backend=be-service" emilevauge/whoami

run-fe-service-server1:
	docker rm -f fe-service-server1 || true
	docker run --name fe-service-server1 -d --label traefik.frontend.rule=Host:fe-service.docker.local -P emilevauge/whoami

run-fe-service-server2:
	docker rm -f fe-service-server2 || true
	docker run --name fe-service-server2 -d --label traefik.frontend.rule=Host:fe-service.docker.local -P emilevauge/whoami

run-unmanaged-service:
	docker rm -f unmanaged-service || true
	docker run --name unmanaged-service -d --label traefik.enable=false emilevauge/whoami

run-all:
	make run-traefik run-be-service-server1 run-be-service-server2 run-fe-service-server1 run-fe-service-server2 run-unmanaged-service
