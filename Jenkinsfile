timeout(time: 20, unit: 'MINUTES') {
timestamps {
ansiColor('xterm') {

node('docker') {
    settingVars version: "2.2"
    stage('Build Docker Image ') {
                    buildDocker()
    }
    stage('Push To Registry') {
                pushDkrToArtifactory()
    }
        }
    }
}
}
