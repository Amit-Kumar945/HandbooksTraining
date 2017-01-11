import jenkins.model.*
import hudson.security.*
def userId = "admin"
def password = "password"
def instance = Jenkins.getInstance()
def hudsonRealm = new HudsonPrivateSecurityRealm(false)

hudsonRealm.createAccount(userId, password)
instance.setSecurityRealm(hudsonRealm)

def strategy = new hudson.security.FullControlOnceLoggedInAuthorizationStrategy()
strategy.setAllowAnonymousRead(false)
instance.setAuthorizationStrategy(strategy)
    instance.save()
