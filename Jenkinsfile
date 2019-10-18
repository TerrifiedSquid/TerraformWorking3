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
    // Token addition
    node {
    withCredentials([[$class: 'VaultTokenCredentialBinding', 
   credentialsId: 'vault-github-access-token', 
   vaultAddr: 'http://127.0.0.1:8200']])  
      { ansiColor('xterm') {
        // values will be masked
        sh 'echo TOKEN=$VAULT_TOKEN'
        sh 'echo ADDR=$VAULT_ADDR'
   }
  }
 }
}
  
 

  // Run terraform plan
 
  
  
  stage('plan ') {
    // Token addition
    node {
    withCredentials([[$class: 'VaultTokenCredentialBinding', 
   credentialsId: 'vault-github-access-token', 
   vaultAddr: 'http://127.0.0.1:8200']])  
      { ansiColor('xterm') {
        // values will be masked
        sh 'echo TOKEN=$VAULT_TOKEN'
        sh 'echo ADDR=$VAULT_ADDR'
   }
  }
 }
}
  
  

  if (env.BRANCH_NAME == 'master') {
    
    // Run terraform apply
    stage('apply') {
      node {
       withCredentials([[
      
 $class: 'VaultTokenCredentialBinding', 
   credentialsId: 'vault-github-access-token', 
   vaultAddr: 'http://127.0.0.1:8200']]) 
         {    ansiColor('xterm') {
        // values will be masked
        sh 'echo TOKEN=$VAULT_TOKEN'
        sh 'echo ADDR=$VAULT_ADDR'
         }        
        }
       }                   
      }
     } 
  

   // Run terraform show
   
    stage('show') {
    // Token addition
    node {
    withCredentials([[$class: 'VaultTokenCredentialBinding', 
   credentialsId: 'vault-github-access-token', 
   vaultAddr: 'http://127.0.0.1:8200']])  
      { ansiColor('xterm') {
        // values will be masked
        sh 'echo TOKEN=$VAULT_TOKEN'
        sh 'echo ADDR=$VAULT_ADDR'
   }
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
