
provider "google" {
  project     = "staging-us-5g-infrastructure-1"
  region      = "us-central1"

}

provider "google-beta" {
  project     = "staging-us-5g-infrastructure-1"
  region      = "us-central1"

}


terraform {
  backend "gcs" {
    bucket  = "data-devops-terraform"
    prefix  = "network/ha-vpn/staging-us-5g-infrastructure-1-to-hq"
    #credentials = "./key.json"
  }
}
