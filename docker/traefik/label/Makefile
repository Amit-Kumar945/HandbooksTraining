rm-traefik:
	docker rm -f traefik || true
run-traefik:
	make rm-traefik
	docker run -d -p 8080:8080 -p 80:80 -v ${PWD}/traefik.toml:/traefik.toml -v /var/run/docker.sock:/var/run/docker.sock --name traefik traefik

rm-be-service-server1:
	docker rm -f be-service-server1 || true
run-be-service-server1:
	make rm-be-service-server1
	docker run --name be-service-server1 -d --label "traefik.backend=be-service" emilevauge/whoami

rm-be-service-server2:
	docker rm -f be-service-server2 || true
run-be-service-server2:
	make rm-be-service-server2
	docker run --name be-service-server2 -d --label "traefik.backend=be-service" emilevauge/whoami

rm-fe-service-server1:
	docker rm -f fe-service-server1 || true
run-fe-service-server1:
	make rm-fe-service-server1
	docker run --name fe-service-server1 -d --label traefik.frontend.rule=Host:fe-service.docker.local -P emilevauge/whoami

rm-fe-service-server2:
	docker rm -f fe-service-server2 || true
run-fe-service-server2:
	make rm-fe-service-server2
	docker run --name fe-service-server2 -d --label traefik.frontend.rule=Host:fe-service.docker.local -P emilevauge/whoami

rm-unmanaged-service:
	docker rm -f unmanaged-service || true
run-unmanaged-service:
	make rm-unmanaged-service
	docker run --name unmanaged-service -d --label traefik.enable=false emilevauge/whoami

run-all:
	make run-traefik run-be-service-server1 run-be-service-server2 run-fe-service-server1 run-fe-service-server2 run-unmanaged-service

rm-all:
	make rm-traefik rm-be-service-server1 rm-be-service-server2 rm-fe-service-server1 rm-fe-service-server2 rm-unmanaged-service
