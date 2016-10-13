freeStyleJob('hello world'){
	description("I am a hello world Job")
  	steps {
        shell('echo "hello Word"')
	}
}
