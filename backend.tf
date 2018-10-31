terraform {
  backend "gcs" {
    bucket  = "showks-tf-state-test"
    prefix  = "terraform/state"
  }
}
