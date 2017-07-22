node {
    def nodeVersion = '8.2.1'

    dir('build') {
        stage('download') {
            sh "curl -OL https://nodejs.org/dist/v8.2.1/node-v${nodeVersion}.tar.gz"
        }

        stage('extract') {
            sh "tar xvf node-v${nodeVersion}.tar.gz"
        }

        stage('build') {
            sh "cd node-v${nodeVersion}/; ./configure; make"
        }
    }

    cleanWs()
}