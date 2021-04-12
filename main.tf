terraform {
  required_providers {
    spacelift = {
      source = "spacelift.io/spacelift-io/spacelift"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

module "spacelift_webhook_mystack" {
  source = "git@github.com:auroq/spacelift.git"

  spacelift_stack_id   = "mystackid"
}

resource "spacelift_stack" "webhook_tester_trigger" {
  name = "Webhook Tester Trigger"
  description  = "A stack that has changes on every trigger for testing webhooks"
  
  repository = "tf-trigger-always"
  branch     = "main"
  autodeploy = "true"
}

