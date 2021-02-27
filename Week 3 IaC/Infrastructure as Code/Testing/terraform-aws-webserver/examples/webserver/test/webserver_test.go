// To kick this off first run "go get -t -v"
// Then run "go test -v .\webserver_test.go"
package test

import (
	"fmt"
	"testing"
	"time"

	http_helper "github.com/gruntwork-io/terratest/modules/http-helper"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformWebserverExample(t *testing.T) {

	// The values to pass into the Terrform CLI
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{

		// The path to where the example Terraform code is located
		TerraformDir: "/Users/Kallor/DevOps/Learnings/CloudNative-DevOps-Bootcamp/Week 3 IaC/Infrastructure as Code/Testing/terraform-aws-webserver/examples/webserver",

		//Variables to pass to the Terraform code using -var options
		Vars: map[string]interface{}{
			"region":     "us-west-2",
			"servername": "testwebserver",
		},
	})

	//Run a Terrform init and apply with the Terraform options
	terraform.InitAndApply(t, terraformOptions)

	//Run a Terraform Destroy at the end of the test
	defer terraform.Destroy(t, terraformOptions)

	publicIp := terraform.Output(t, terraformOptions, "public_ip")

	url := fmt.Sprintf("http://%s:8080", publicIp)

	http_helper.HttpGetWithRetry(t, url, nil, 200, "I made a Terraform Module!", 30, 5*time.Second)

}
