mavenJob('Code Building') {
	description("I\'ll build the application")
    logRotator(-1, 10)
	scm {
   		git {
     		branch('*/master')
     		remote {
       			name('')
       			refspec('')
       			url('git@github.com:OpsTree/ContinuousIntegration.git')
     		}
   		}     
 	}
 	//please enable the maven in your jenkins form jenkins configuration
 	goals('clean install')
 	rootPOM('Spring3HibernateApp/pom.xml')
}
