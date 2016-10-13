job('Code Checkout') {
    description("I\'ll do the checkout the code form given git repo")
    logRotator(-1, 10)
    scm {
        github('https://github.com/OpsTree/ContinuousIntegration.git', 'master')
    }
}