job('AppDeployer') {
    description("I\'ll deploy the webapp")
    logRotator(-1, 10)
    steps {
      shell('docker rm -f app || docker run -it -d -p 80:8080 --name app opstree/spring3hibernateapp')
    }
}
