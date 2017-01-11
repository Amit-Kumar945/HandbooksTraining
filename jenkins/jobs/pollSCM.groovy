job('Poll SCM') {
	description("I\'ll do the poll scm in every 15 min")
    logRotator(-1, 10)
	scm {
        github('https://github.com/OpsTree/ContinuousIntegration.git', 'master')
    }
  	triggers {
        scm('H/15 * * * *')
    }
}
