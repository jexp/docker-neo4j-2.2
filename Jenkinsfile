timeout(time: 20, unit: 'MINUTES') {
timestamps {
ansiColor('xterm') {

node('docker') {
    settingVars version: "3.5.12"
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
