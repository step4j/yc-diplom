#provider
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
  }

provider "yandex" {
#  token     = ""
  service_account_key_file = "../key.json"
  cloud_id  = "b1gsn4e2o701o3q64qi2"
  folder_id = "b1gofhh7mgk1hopmq2j8"
  zone      = "ru-central1-a"
}


