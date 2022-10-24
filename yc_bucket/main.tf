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
//  token     = ""
  service_account_key_file = "../key.json"
  cloud_id  = "b1gsn4e2o701o3q64qi2"
  folder_id = "b1gofhh7mgk1hopmq2j8"
  zone      = "ru-central1-a"
}

/*resource "yandex_iam_service_account" "sa" {
  name = ""
}

// Назначение роли сервисному аккаунту
resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  role   = "storage.editor"
  member = "serviceAccount:${yandex_iam_service_account.sa.id}"
}
*/

//Создание статического ключа доступа
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = "aje6vak5nr51h02ju6vr"
  description        = "static access key"
}

// Создание бакета с использованием ключа
resource "yandex_storage_bucket" "test" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket     = "step4jho"
}
