job('AppDeployer') {
    description("I\'ll deploy the webapp")
    logRotator(-1, 10)
    steps {
      shell('docker rm -f appdb || true \n docker run -it -d --name appdb opstree/appdb \n docker rm -f app || true \n docker run -it -d -p 80:8080 --name app --link appdb:mysql opstree/spring3hibernateapp')
    }
}
