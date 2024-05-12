pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS_ID = credentials ('dockerhubJenkins')
        DOCKER_REGISTRY = "https://hub.docker.com/"
        DOCKER_IMAGE_TAG = "latest"
    }
    
    stages 
    {
        stage('Code checkout') 
        {
            steps 
            {
                sh "echo this is a test Jenkinsfile pipeline"
                checkout([
                    $class: 'GitSCM', 
                    //branches: [[name: '*/master']],
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
                sh "cd 'ABC Technologies' && /opt/maven/bin/mvn clean compile"
            }
        }
        stage('Code Test') {
            steps {
                sh "echo ==================================="
                sh "echo Test"
                sh "echo ==================================="
                sh "cd 'ABC Technologies' && /opt/maven/bin/mvn test"
            }
        }

        stage('Code Package') {
            steps {
                sh "echo ==================================="
                sh "echo package"
                sh "echo ==================================="
                sh "cd 'ABC Technologies' && /opt/maven/bin/mvn package"
            }
        }
        // Add more stages as needed
        stage('Build Docker Image') {
            steps {
                sh "cd /var/lib/jenkins/workspace/$JOB_NAME/'ABC Technologies'/target && cp ABCtechnologies-1.0.war /var/lib/jenkins/workspace/$JOB_NAME/abc_tech.war && ls -ltr /var/lib/jenkins/workspace/$JOB_NAME/abc_tech.war"
                //sh "ls -ltr abc_tech.war"
                sh 'docker build -t abc_tech:${BUILD_NUMBER} /var/lib/jenkins/workspace/PipelineJenkinsfile'
                sh 'docker tag abc_tech:$BUILD_NUMBER ravibhattinkw/abc_tech:$BUILD_NUMBER'
                sh 'docker tag abc_tech:$BUILD_NUMBER ravibhattinkw/abc_tech:latest'
            }
        }
        stage('Push Docker Image')
        {
            steps 
            {
                sh 'echo Pushing image to docker hub'
                sh 'echo $DOCKERHUB_CREDENTIALS_ID_PSW | docker login -u $DOCKERHUB_CREDENTIALS_ID_USR --password-stdin'
                sh 'docker push ravibhattinkw/abc_tech:latest'
                sh 'docker push ravibhattinkw/abc_tech:$BUILD_NUMBER'
                /*script {
                    docker.withRegistry( "${DOCKER_REGISTRY}","${DOCKERHUB_CREDENTIALS_ID}") 
                    {
                        docker.image ("ravibhattinkw/abc_tech:$BUILD_NUMBER").push()
                    }
                }*/
            }
        }
        /*stage('Run Docker')
        {
            steps {
                sh 'docker run -itd -p 8090:8090 ravibhattinkw/abc_tech:latest'
                sh 'docker ps'
            }
        }
        
        stage('Deploy Docker image on k8s')
        {
            steps 
            {
                script 
                {
                    // Apply deployment YAML
                    def deploymentApply = sh(script: 'kubectl apply -f deployment.yaml', returnStatus: true)
                    if (deploymentApply != 0) 
                    {
                        error 'Failed to apply deployment YAML'
                    }
        
                    // Check pod status
                    sh 'kubectl get pods'
        
                    // Wait for pods to be ready
                    sh 'kubectl wait --for=condition=ready pod --all --timeout=300s'
        
                    // Check pod status again
                    sh 'kubectl get pods'
        
                    // Apply service YAML
                    def serviceApply = sh(script: 'kubectl apply -f service.yaml', returnStatus: true)
                    if (serviceApply != 0) 
                    {
                        error 'Failed to apply service YAML'
                    }
        
                    // Check service status
                    sh 'kubectl get service -o wide'
                }
            }
        }*/
    }
    
    // Add post-build actions or other pipeline configurations
    post{
        always{
            sh 'docker logout'
        }
    }
}
