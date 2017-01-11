job('Poll SCM') {
	description("I\'ll do the poll scm in every 15 min")
    logRotator(-1, 10)
		scm {
	   		git {
	     		branch('*/sandy')
	     		remote {
	       			name('')
	       			refspec('')
	       			url('https://github.com/OpsTree/HandbooksTraining.git')
	     		}
	   		}
	 	}
  	triggers {
        scm('H/1 * * * *')
    }
		steps {
        shell('#!/bin/bash \n cp jenkins/jobs/*.groovy ${JENKINS_HOME}/jobs/SeedJob/workspace')
		}
}
