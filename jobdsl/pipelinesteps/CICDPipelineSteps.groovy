Stage "Code Fetch"
    build 'DSLCodeFetch'

Stage "Code Stability"
    build 'DSLCodeStability'

Stage "Code Quality"
    build 'DSLCodeQuality'

Stage "Code Coverage"
    build 'DSLCodeCoverage'

Stage "Artifact Generation"
    build 'DSLCodeGenerator'

Stage "Code Deploy"
    build 'DSLCodeDeployer'
