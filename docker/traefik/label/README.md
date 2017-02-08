This is the second step in learning traefik, here we will use lables to understand how we can pass information to traefik such as
- assigning application to a backend: traefik.backend
- registering a port: traefik.port
- assigning weight to application: traefik.weight

Go through below blogs to get a basic understanding
http://programmableinfrastructure.com/guides/load-balancing/traefik/
https://docs.traefik.io

 first step of playing with traefik i.e launching the docker container of traefik & accessing some service. You just need a very basic traefik.toml which will have below settings enabled:
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

Findings
- In dynamic mode every container is getting exposed both as frontend and backend
- We can override the backend mapping by providing a label "traefik.backend=be-service"
- We can override the frontend mapping by providing a label "traefik.frontend.rule=Host:fe-service.docker.local"
- Can we make a service only front-end/back-end?
- Can we use backend service in another front-end service?
