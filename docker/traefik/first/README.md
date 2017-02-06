This is the first step of playing with traefik i.e launching the docker container of traefik & accessing some service. You just need a very basic traefik.toml which will have below settings enabled:
- Web configuration, defining the port at which the traefik web console would be available.
- Backend docker configuration i.e the domain with which the services will be accessed

What we will do here
- We will run a traefik container
- Access it's web console at port 8080
- Run a dummy service(emilevauge/whoami) with name service1
- Run a dummy service(emilevauge/whoami) with name service2
- Once all the containers are up you can access the web ui of traefik at localhost:8080
- Access service1 via traefik ```curl -v --header 'Host: service1.docker.local' localhost```
- Access service2 via traefik ```curl -v --header 'Host: service2.docker.local' localhost```

What you can try on later
- Change the web console of traefik
- Chagne the domain name in traefik
