mavenJob("CodeQuality") {
  logRotator(60, 20, 1, -1)
  description('Code Coverage Test for application')
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
  goals('clean package')
  rootPOM('Spring3HibernateApp/pom.xml')
  mavenInstallation('maven2')
}
