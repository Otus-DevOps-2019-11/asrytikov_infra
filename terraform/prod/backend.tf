terraform {
  backend "gcs" {
    bucket  = "storage-bucket-262714"
    prefix  = "tf-state-prod"
  }
}
