properties([disableConcurrentBuilds(), pipelineTriggers([])])

node {
    def nodeVersion = '8.2.1'
    def os = (sh(returnStdout: true, script: 'uname -s')).trim().toLowerCase()
    def arch = (sh(returnStdout: true, script: 'uname -m')).trim()
    def artifactName = "node-${os}-${arch}-${nodeVersion}.tar.gz"

    stage('checkout') {
        checkout scm
    }

    dir('build') {
        stage('download') {
            sh "curl -OL https://nodejs.org/dist/v${nodeVersion}/node-v${nodeVersion}.tar.gz"
        }

        stage('extract') {
            sh "tar xvf node-v${nodeVersion}.tar.gz"
        }

        stage('build') {
            sh "cd node-v${nodeVersion}/; ./configure --prefix=./dist; make"
        }

        stage('package') {
            dir('dist') {
                sh 'cp ../../init.sh .'
                sh "tar -czvf ../../${artifactName} ."
            }
        }
    }

    archiveArtifacts artifactName

    cleanWs cleanWhenFailure: false
}