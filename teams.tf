public static void getSecret() {

String secretName = "GitHubToken";
    String region = "eu-west-3";

// Create a Secrets Manager client
    AWSSecretsManager client  = AWSSecretsManagerClientBuilder.standard()
                                    .withRegion(region)
                                    .build();
    
    // In this sample we only handle the specific exceptions for the 'GetSecretValue' API.
    // See https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_GetSecretValue.html
    // We rethrow the exception by default.
    
    String secret, decodedBinarySecret;
    GetSecretValueRequest getSecretValueRequest = new GetSecretValueRequest()
                    .withSecretId(secretName);
    GetSecretValueResult getSecretValueResult = null;

try {
        getSecretValueResult = client.getSecretValue(getSecretValueRequest);
    } catch (DecryptionFailureException e) {
        // Secrets Manager can't decrypt the protected secret text using the provided KMS key.
        // Deal with the exception here, and/or rethrow at your discretion.
        throw e;
    } catch (InternalServiceErrorException e) {
        // An error occurred on the server side.
        // Deal with the exception here, and/or rethrow at your discretion.
        throw e;
    } catch (InvalidParameterException e) {
        // You provided an invalid value for a parameter.
        // Deal with the exception here, and/or rethrow at your discretion.
        throw e;
    } catch (InvalidRequestException e) {
        // You provided a parameter value that is not valid for the current state of the resource.
        // Deal with the exception here, and/or rethrow at your discretion.
        throw e;
    } catch (ResourceNotFoundException e) {
        // We can't find the resource that you asked for.
        // Deal with the exception here, and/or rethrow at your discretion.
        throw e;
    }

// Decrypts secret using the associated KMS CMK.
    // Depending on whether the secret is a string or binary, one of these fields will be populated.
    if (getSecretValueResult.getSecretString() != null) {
        secret = getSecretValueResult.getSecretString();
    }
    else {
        decodedBinarySecret = new String(Base64.getDecoder().decode(getSecretValueResult.getSecretBinary()).array());
    }

     provider "github" {
 organization = "${var.github_organization}"
 token        = "${var.github_token}"  
  } 

resource "github_membership" "ArranTest" {
username = "ArranTest"
role = "member" 
}

// Your code goes here.
}








