mavenJob('CodeStability') {
	description("I\'ll build the application")
    logRotator(-1, 10)
	scm {
   		git {
     		branch('*/master')
     		remote {
       			name('')
       			refspec('')
       			url('https://github.com/OpsTree/ContinuousIntegration.git')
     		}
   		}
 	}
 	//please enable the maven in your jenkins form jenkins configuration
 	goals('clean compile')
 	rootPOM('Spring3HibernateApp/pom.xml')
}
