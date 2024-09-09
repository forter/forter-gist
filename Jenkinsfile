// vim: filetype=groovy

def stages = [
    'install': {
        try {
            sh 'make install'
    },
]

node('general') {
    def base = load '/var/jenkins_home/workspace/Infra/build-scripts/build/Jenkinsfile'
    base.execute(
        distImages: ['forter-gist'],
	customStages: stages
        credentials: base.get_decrypt_creds(),
        linterReportLocation: 'test-reports/ci-lint-report',
        masterBranch: 'main',
        latestTag: 'prod'
	helm: [
            dist_helm_chart: true,
            helm_chart_dirs: ["helmchart"]
        ],
    )
}
