package test

import (
	"fmt"
	"time"
	"testing"
	http_helper "github.com/gruntwork-io/terratest/modules/http-helper"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformWebserverExample(t *testing.T){

	// The values to pass into the Terrform CLI
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.terraformOptions{

		// The path to where the example Terraform code is located
		TerraformDir: "..examples/webserver",

		//Variables to pass to the Terraform code using -var options
		Vars: map[string]interface{}{
			"region": "us-west-2",
			"servername": "testwebserver",
		},

	})

	//Run a Terrform init and apply with the Terraform options
	terrform.InitAndApply(t, terraformOptions)

	//Run a Terraform Destroy at the end of the test
	defer terraform.Destroy(t, terraformOptions)

	publicIp := terraform.Output(t, terrformOptions, "public_ip")

	url := fmt.Sprintf("https://%s:8080", publicIp)

	http_helper.HttpGetWithRetry(t, url, nil, 200, "I made a Terraform Module!", 30, 5*time.Second)

}

// to run start with "go get -t -v"