resource "google_storage_bucket" "image-store" {
  name     = "${var.env_name}-bucket"
  location = "${var.region}"
  storage_class = "regional"

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}
