// Jenkinsfile
// 

try {
  stage('checkout') {
    node {
      cleanWs()
      checkout scm
    }
    node {
    }
  }
  

  // Run terraform init
  stage('init') {
    node {
      withCredentials([[
        $class: 'AmazonWebServicesCredentialsBinding',
        credentialsId: 'awsCredentials',
        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
      ]]) {
        ansiColor('xterm') {
          sh 'terraform init'
        }
      }
    }
    // Token addition
    node {
  withCredentials([string(
    credentialsId: 'GithubSecretNew1', 
    variable: 'github_token')]) {
    sh '''
      set +x
      curl -H "Token: $github_token" https://api.github.com
    '''
  }
}

  }

  // Run terraform plan
  stage('plan') {
    node {
      withCredentials([[
        $class: 'AmazonWebServicesCredentialsBinding',
        credentialsId: 'awsCredentials',
        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
      ]]) {
        ansiColor('xterm') {
          sh 'terraform plan'
        }
      }
    }
    
    // Token addition
    node {
  withCredentials([string(
    credentialsId: 'GithubSecretNew1', 
    variable: 'github_token')]) {
    sh '''
      set +x
      curl -H "Token: $github_token" https://api.github.com
    '''
  }
}
  }

  if (env.BRANCH_NAME == 'master') {

    // Run terraform apply
    stage('apply') {
      node {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          credentialsId: 'awsCredentials',
          accessKeyVariable: 'AWS_ACCESS_KEY_ID',
          secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]]) {
          ansiColor('xterm') {
            sh 'terraform apply -auto-approve'
          }
        }
      }
    // Token addition
    node {
  withCredentials([string(
    credentialsId: 'GithubSecretNew1', 
    variable: 'github_token')]) {
    sh '''
      set +x
      curl -H "Token: $github_token" https://api.github.com
    '''
  }
}
    }

    // Run terraform show
    stage('show') {
      node {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          credentialsId: 'awsCredentials',
          accessKeyVariable: 'AWS_ACCESS_KEY_ID',
          secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]]) {
          ansiColor('xterm') {
            sh 'terraform show'
          }
        }
      }
    }
    // Token addition
    node {
  withCredentials([string(
    credentialsId: 'GithubSecretNew1', 
    variable: 'github_token')]) {
    sh '''
      set +x
      curl -H "Token: $github_token" https://api.github.com
    '''
  }
}
  }
  currentBuild.result = 'SUCCESS'
}
catch (org.jenkinsci.plugins.workflow.steps.FlowInterruptedException flowError) {
  currentBuild.result = 'ABORTED'
}
catch (err) {
  currentBuild.result = 'FAILURE'
  throw err
}
finally {
  if (currentBuild.result == 'SUCCESS') {
    currentBuild.result = 'SUCCESS'
  }
}

