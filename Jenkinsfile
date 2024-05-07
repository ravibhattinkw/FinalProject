pipeline {
    agent any
    stages {
        stage('Code checkout') {
            steps {
                sh "echo this is a test Jenkinsfile pipeline"
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/master']],
                    userRemoteConfigs: [[url: 'https://github.com/ravibhattinkw/FinalProject.git']],
                    extensions: [[$class: 'CloneOption', depth: 1, noTags: true, reference: '', shallow: true]]
                ])
                sh " echo path of the checkout file: "
                sh " pwd"
            }
        }
        // Add more stages as needed
    }
    // Add post-build actions or other pipeline configurations
}
