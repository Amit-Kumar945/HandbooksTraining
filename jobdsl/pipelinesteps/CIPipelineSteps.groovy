stage 'Get Code'
  build 'CodeCheckout'

stage 'Code Stability'
  build 'CodeStability'

stage 'Code Quality'
  build 'CodeQuality'
  build 'CodeCoverage'

stage 'ArtifactGenerator'
  build 'ArtifactGenerator'

stage 'Deployer'
  build 'AppDeployer'
