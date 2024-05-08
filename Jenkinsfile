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
        stage('Code compile') {
            steps {
                sh "echo ==================================="
                sh "echo Compile"
                sh "echo ==================================="
                dir('ABC\' Technologies') 
                {
                    sh '/opt/mvn clean compile'
                }
            }
        }
        stage('Code Test') {
            steps {
                sh "echo ==================================="
                sh "echo Test"
                sh "echo ==================================="
                dir('ABC\' Technologies') 
                {
                    sh '/opt/mvn test'
                }
            }
        }

        stage('Code Package') {
            steps {
                sh "echo ==================================="
                sh "echo package"
                sh "echo ==================================="
                dir('ABC\' Technologies') 
                {
                    sh '/opt/mvn package'
                }
            }
        }
        // Add more stages as needed        
    }
    // Add post-build actions or other pipeline configurations
}
