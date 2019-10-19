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
      secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'],
                        
    [$class: 'VaultTokenCredentialBinding', 
   credentialsId: 'vault-github-access-token', 
   vaultAddr: 'http://c909c28c.ngrok.io']]) 
         {    ansiColor('xterm') {
  
        // values will be masked
        sh 'echo TOKEN=$VAULT_TOKEN'
        sh 'echo ADDR=$VAULT_ADDR'
           sh 'terraform init' 
           
         }        
        }
       }                   
      }

 

  // Run terraform plan
  stage('plan ') {
    node {
       withCredentials([[
      
     $class: 'AmazonWebServicesCredentialsBinding',
        credentialsId: 'awsCredentials',
      accessKeyVariable: 'AWS_ACCESS_KEY_ID',
      secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'],
                        
    [$class: 'VaultTokenCredentialBinding', 
   credentialsId: 'vault-github-access-token', 
   vaultAddr: 'http://c909c28c.ngrok.io']]) 
         {    ansiColor('xterm') {
  
        // values will be masked
        sh 'echo TOKEN=$VAULT_TOKEN'
        sh 'echo ADDR=$VAULT_ADDR'
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
      secretKeyVariable: 'AWS_SECRET_ACCESS_KEY' ],
                        
    [$class: 'VaultTokenCredentialBinding', 
   credentialsId: 'vault-github-access-token', 
   vaultAddr: 'http://c909c28c.ngrok.io']]) 
         {    ansiColor('xterm') {
  
      //  values will be masked
        sh 'echo TOKEN=vault-github-access-token'
        sh 'echo ADDR=$VAULT_ADDR'
           {
        sh 'terraform apply -auto-approve'
           }
      
    //    sh 'vault-github-access-token'
           
         }        
        }
       }                   
      }
     } 
  

   // Run terraform show
    stage('show') {
    // Token addition
      node {
       withCredentials([[
      
     $class: 'AmazonWebServicesCredentialsBinding',
        credentialsId: 'awsCredentials',
      accessKeyVariable: 'AWS_ACCESS_KEY_ID',
      secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'],
                        
    [$class: 'VaultTokenCredentialBinding', 
   credentialsId: 'vault-github-access-token', 
   vaultAddr: 'http://03095bcf.ngrok.io']]) 
         {    ansiColor('xterm') {
  
        // values will be masked
        sh 'echo TOKEN=$VAULT_TOKEN'
        sh 'echo ADDR=$VAULT_ADDR'
           sh 'terraform show' 
           
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
