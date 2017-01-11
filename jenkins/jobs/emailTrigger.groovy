job('Email Trigger') {
	description("I\'ll trigger the mail")
    logRotator(-1, 10)

  	publishers {
		extendedEmail {
			recipientList('sandeep@opstree.com')
			defaultSubject('email')
			defaultContent('hello test system')
			contentType('text/html')
			triggers {
				beforeBuild()
				stillUnstable {
					subject('Subject')
					content('Body')
					sendTo {
						developers()
						requester()
						culprits()
  					}
 				}
			}
		}
	}
}