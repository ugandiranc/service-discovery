def getDetails(){

    env.COMMIT_HASH = ""//sh(returnStdout: true, script: 'git rev-parse HEAD').take(7)
    env.COMMITER_NAME = sh( script: 'git --no-pager show -s --format=\'%an\'', returnStdout: true).trim()
    env.COMMIT_MESSAGE = sh(script: 'git log -1  --pretty=\'%s\'', returnStdout: true)
	env.BRANCH_NAME = 'master'
    println "This build is for the commit : ${COMMIT_HASH} was done by ${COMMITER_NAME} on branch ${BRANCH_NAME}"

}

pipeline {
	  environment {
	    registry = "ugandiranc/ugandiran"
	    registryCredential = 'dockerhub'
	  }
	  agent any
	  stages {

		stage('Get Details'){
		   getDetails()
		}
	
		stage("CHECKOUT"){
            checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/ugandiranc/service-discovery.git']]])		}
		
        stage('build'){
              sh 'mvn clean compile'
        }
        stage('package'){
                sh 'mvn package'
        }

       /* stage('Docker Build'){
            DOCKER_IMAGE = docker.build("my-image:service-discover")
        }*/
		stage('Building image') {
		  steps{
			script {
			  docker.build registry + ":1"
			}
		  }
		}
	  }		
}
