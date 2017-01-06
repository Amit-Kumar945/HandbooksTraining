job('DSLCodeFetch') {
  description('Code Fetch')
  logRotator {
        daysToKeep(60)
        numToKeep(20)
        artifactDaysToKeep(1)
    }
    scm {
        git {
      remote {
        url("$REPOSITORY")
      }
      branch("*/$BRANCH")
     }
    }
  }


job('DSLCodeStability') {
  description('Code Stability')
  logRotator {
        daysToKeep(60)
        numToKeep(20)
        artifactDaysToKeep(1)
    }
    scm {
        git {
      remote {
        url("$REPOSITORY")
      }
      branch("*/$BRANCH")
     }
    }
    steps {
       maven {
         mavenInstallation('default')
         goals('compile')
         rootPOM('pom.xml')
  }
  }
}

job('DSLCodeQuality') {
  description('Code Quality')
  logRotator {
    daysToKeep(60)
    numToKeep(20)
    artifactDaysToKeep(1)
  }
  scm {
     git {
      remote {
        url("$REPOSITORY")
      }
      branch("*/$BRANCH")
     }
  }
  steps {
    maven {
      mavenInstallation('default')
      goals('pmd:pmd')
      goals('checkstyle:checkstyle')
      goals('-DskipTests')
      rootPOM('pom.xml')
    }
  }
  publishers {
	checkstyle('**/target/checkstyle-result.xml')
  }
}

job('DSLAPICodeCoverage') {
  description('Code Coverage')
  logRotator {
    daysToKeep(60)
    numToKeep(20)
    artifactDaysToKeep(1)
  }
  scm {
     git {
      remote {
        url("$REPOSITORY")
      }
      branch("*/$BRANCH")
     }
  }
  steps {
    maven {
      mavenInstallation('default')
      goals('cobertura:cobertura')
      goals('-Dcobertura.report.format=xml')
      rootPOM('pom.xml')
    }
  }
  publishers {
	cobertura('**/target/site/cobertura/coverage.xml')
  }
}

job('DSLArtifactGenerator') {
  description('Artifact Generator')
  logRotator {
    daysToKeep(60)
    numToKeep(20)
    artifactDaysToKeep(1)
  }
  scm {
     git {
      remote {
        url("$REPOSITORY")
      }
      branch("*/$BRANCH")
     }
  }
  steps {
    maven {
      mavenInstallation('default')
      goals('install')
      rootPOM('pom.xml')
    }
    shell('cp $WORKSPACE/target/*.war /tmp/')
  }
      
}


job('DSLCodeDeployer') {
  description('Code Deployer')
  scm {
     git {
      remote {
        url("https://github.com/OpsTree/HandbooksTraining.git")
      }
      branch("*/master")
     }
  }
  steps {
    shell('echo "Copy latest artifact to app server"\n' +
		 'scp /tmp/*war root@appserver:/tmp/ \n' +
		 'scp $WORKSPACE/scripts/deployer.sh root@appserver:/tmp/deployer.sh \n' +
		 'echo "Run a sccript that will stop tomcat deploy war and start tomcat" \n' +
		 'ssh root@appserver "bash /tmp/deployer.sh " \n'  
         )
  }
}






pipelineJob("DSLCICDPipeline") {
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
          branch("*/master")
          remote {
            name('')
            refspec('')
            url("https://github.com/OpsTree/HandbooksTraining.git")
          }
        }
        scriptPath('jobdsl/pipelinesteps/CICDPipelineSteps.groovy')
      }
    }
  }
}
