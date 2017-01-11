job('AppDeployer') {
    description("I\'ll deploy the webapp")
    logRotator(-1, 10)
    steps {
      shell('docker rm -f app || docker rm -f appdb \n docker run -it -d --name appdb opstree/spring3hibernateapp \n docker run -it -d -p 80:8080 --name app --link appdb:mysql opstree/spring3hibernateapp')
    }
}
