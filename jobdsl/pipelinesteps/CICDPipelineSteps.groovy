stage 'Code Fetch'
    build 'DSLCodeFetch'

stage 'Code Stability'
    build 'DSLCodeStability'

stage 'Code Quality'
    build 'DSLCodeQuality'

stage 'Code Coverage'
    build 'DSLCodeCoverage'

stage 'Artifact Generation'
    build 'DSLArtifactGenerator'

input message: 'Do you want to Continue', ok: 'Deploy'
stage 'Code Deploy'
    build 'DSLCodeDeployer'
