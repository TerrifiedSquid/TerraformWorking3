// Jenkinsfile
// 

try {
  stage('checkout') {
    node {
      cleanWs()
      checkout scm
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
  }
  
  stage('init 2') {
    // Token addition
    node {
  withCredentials([string(
    credentialsId: 'GithubSecretNew1', 
    variable: 'TOKEN')]) {
    sh '''
      set +x
      curl -H "Token: $TOKEN" https://api.github.com
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
  }
  
    // Token addition
    stage('plan 2') {
    node {
  withCredentials([string(
    credentialsId: 'GithubSecretNew1', 
    variable: 'TOKEN')]) {
    sh '''
      set +x
      curl -H "Token: $TOKEN" https://api.github.com
    '''
  }
}
  }

  if (env.BRANCH_NAME == 'master') {

    
    stage('apply 2') {
    // Token addition
    node {
  withCredentials([string(
    credentialsId: 'GithubSecretNew1', 
    variable: 'TOKEN')]) {
    sh '''
      set +x
      curl -H "Token: $TOKEN" https://api.github.com
    '''
  }
}
    }
    
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
    
    stage('show 2') {
    // Token addition
    node {
  withCredentials([string(
    credentialsId: 'GithubSecretNew1', 
    variable: 'TOKEN')]) {
    sh '''
      set +x
      curl -H "Token: $TOKEN" https://api.github.com
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
