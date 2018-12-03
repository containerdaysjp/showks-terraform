resource "google_storage_bucket" "prod_concourse_store" {
  name     = "prod-${var.env_name}-concourse-bucket"
  location = "${var.region}"
  storage_class = "REGIONAL"

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}
resource "google_storage_bucket" "stg_concourse_store" {
  name     = "stg-${var.env_name}-concourse-bucket"
  location = "${var.region}"
  storage_class = "REGIONAL"

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}
