job('CodeCheckout') {
    description("I\'ll do the checkout the code form given git repo")
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
}
