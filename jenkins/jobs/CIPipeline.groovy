pipelineJob("CIPipeline") {

  logRotator {
    daysToKeep(60)
    numToKeep(20)
    artifactDaysToKeep(1)
  }

  description('CI Pipe Line')

  definition {
    cpsScm {
      scm {
        git {
          branch('*/sandy')
          remote {
            name('')
            refspec('')
            url('https://github.com/OpsTree/HandbooksTraining.git')
          }
        }
        scriptPath('jobdsl/pipelinesteps/CIPipelineSteps.groovy')
      }
    }
  }
}
