resource "yandex_compute_instance" "db01" {
  name                      = "db01"
  hostname                  = "db01"
  zone                      = "ru-central1-b"
  allow_stopping_for_update = true

  resources {
    cores         = 4
    memory        = 8
  }

  boot_disk {
    initialize_params {
     image_id    = "fd8kb72eo1r5fs97a1ki"
     name        = "root-db01"
     type        = "network-nvme"
     size        = "10"
    }
  }

  network_interface {
    subnet_id = "e2lqccjaoi796nr0l623"
    nat       = false
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}
