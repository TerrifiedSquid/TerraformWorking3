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
    // define the secrets and the env variables
    def secrets = [
        [path: 'auth/github/config', secretValues: [
            [envVar: 'token', token: 'value_one'],
      ]],
    ]
 
    // optional configuration, if you do not provide this the next higher configuration
    // (e.g. folder or global) will be used
    def configuration = [vaultUrl: 'http://127.0.0.1:8200',
                         vaultCredentialId: 'vault-github-access-token']
    // inside this block your credentials will be available as env variables
    withVault([configuration: configuration, vaultSecrets: secrets]) {
        sh 'echo $testing'
        sh 'echo $testing_again'
        sh 'echo $another_test'
    }
}{
        ansiColor('xterm') {
          sh 'terraform init'
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
    // define the secrets and the env variables
    def secrets = [
        [path: 'auth/github/config', secretValues: [
            [envVar: 'token', token: 'value_one'],
      ]],
    ]
 
    // optional configuration, if you do not provide this the next higher configuration
    // (e.g. folder or global) will be used
    def configuration = [vaultUrl: 'http://127.0.0.1:8200',
                         vaultCredentialId: 'vault-github-access-token']
    // inside this block your credentials will be available as env variables
    withVault([configuration: configuration, vaultSecrets: secrets]) {
        sh 'echo $testing'
        sh 'echo $testing_again'
        sh 'echo $another_test'
    }
}

  }

  if (env.BRANCH_NAME == 'master') {

    
    stage('apply') {
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
    stage('apply 2') {
node {
    // define the secrets and the env variables
    def secrets = [
        [path: 'auth/github/config', secretValues: [
            [envVar: 'token', token: 'value_one'],
      ]],
    ]
 
    // optional configuration, if you do not provide this the next higher configuration
    // (e.g. folder or global) will be used
    def configuration = [vaultUrl: 'http://127.0.0.1:8200',
                         vaultCredentialId: 'vault-github-access-token']
    // inside this block your credentials will be available as env variables
    withVault([configuration: configuration, vaultSecrets: secrets]) {
        sh 'echo $testing'
        sh 'echo $testing_again'
        sh 'echo $another_test'
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
    // define the secrets and the env variables
    def secrets = [
        [path: 'auth/github/config', secretValues: [
            [envVar: 'token', token: 'value_one'],
      ]],
    ]
 
    // optional configuration, if you do not provide this the next higher configuration
    // (e.g. folder or global) will be used
    def configuration = [vaultUrl: 'http://127.0.0.1:8200',
                         vaultCredentialId: 'vault-github-access-token']
    // inside this block your credentials will be available as env variables
    withVault([configuration: configuration, vaultSecrets: secrets]) {
        sh 'echo $testing'
        sh 'echo $testing_again'
        sh 'echo $another_test'
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
