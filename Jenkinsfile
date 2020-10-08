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
			steps{
				getDetails()
			}
		}
	}
