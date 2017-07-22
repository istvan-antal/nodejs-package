node {
    def nodeVersion = '8.2.1'
    def artifactName = "node-${nodeVersion}.tar.gz"

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
            sh 'cp ../init.sh .'
            sh "tar -czvf ../../${artifactName} ."
        }
    }

    archiveArtifacts artifactName

    cleanWs()
}