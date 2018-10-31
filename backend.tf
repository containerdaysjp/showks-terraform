terraform {
  backend "gcs" {
    bucket  = "showks-tf-state"
    prefix  = "terraform/state"
  }
}
