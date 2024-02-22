import groovy.json.*

timestamps {
    timeout(time: 120, unit: "MINUTES") {
        node {
            environment {
                PATH = "/usr/bin/azure-cli:$PATH"
            }
        stage('Checkout') {
            
                git branch: 'main', url: 'https://github.com/agore25/tf-demo.git'
            
        }
        stage('Terraform init') {
            
                sh 'terraform init'
        
        }
        stage('Login') {
            
                withCredentials([
                    string(credentialsId: 'ARM_CLIENT_ID', variable: 'ARM_CLIENT_ID'),
                    string(credentialsId: 'ARM_CLIENT_SECRET', variable: 'ARM_CLIENT_SECRET'),
                    string(credentialsId: 'ARM_TENANT_ID', variable: 'ARM_TENANT_ID'
                    )]) {
                        sh(script: """
                                    set -x
                                    az login --service-principal \
                                            -u ${ARM_CLIENT_ID} \
                                            -p ${ARM_CLIENT_SECRET} \
                                            --tenant ${ARM_TENANT_ID} 
                                    az account set -s des-tpesafeiac-net-svc
                                    az account show""", returnStdout:true)
                    }
                echo "Logged in!!"
                
                // sh 'terraform plan'
            
            }
        
        stage('Terraform Plan') {
            // steps {
                sh 'terraform plan'
            // }
        }
        // stage('Terraform Apply') {
        //     // steps {
        //         sh 'terraform apply --auto-approve'
        //     // }
        }
        
    }
}
