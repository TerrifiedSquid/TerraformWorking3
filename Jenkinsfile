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
  
  

  if (env.BRANCH_NAME == 'master') {
    
    // Run terraform apply
    stage('apply') {
      node {
       withCredentials([[
      
     $class: 'AmazonWebServicesCredentialsBinding',
        credentialsId: 'awsCredentials',
      accessKeyVariable: 'AWS_ACCESS_KEY_ID',
      secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'],
         
         [$class: 'VaultTokenCredentialBinding', 
         addrVariable: 'VAULT_ADDR', 
         credentialsId: 'vault-github-access-token', 
         tokenVariable: 'VAULT_TOKEN', 
         vaultAddr: 'http://127.0.0.1:8200']])         
         
      {
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
    withCredentials([[$class: 'VaultTokenCredentialBinding', credentialsId: 'vaulttoken', vaultAddr: 'https://localhost:8200']]) {
        // values will be masked
        sh 'echo TOKEN=$VAULT_TOKEN'
        sh 'echo ADDR=$VAULT_ADDR'
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
