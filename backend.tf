terraform {
  backend "s3" {
    bucket  = "github-oidc-terraform-aws-tfstates-orquestracao"
    encrypt = true
    key     = "case_dma_permissoes.tfstate"
    region  = "us-east-1"
  }
}