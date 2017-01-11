job('Poll SCM') {
	description("I\'ll do the poll scm in every 15 min")
    logRotator(-1, 10)
		scm {
	   		git {
	     		branch('*/master')
	     		remote {
	       			name('')
	       			refspec('')
	       			url('https://github.com/OpsTree/HandbooksTraining.git')
	     		}
	   		}
	 	}
  	triggers {
        scm('H/15 * * * *')
    }
		steps {
        shell('#!/bin/bash \n cp jobs/*.groovy ${JENKINS_HOME}/jobs/SeedJob/workspace/jobs')
		}
}
