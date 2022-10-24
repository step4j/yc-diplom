data "yandex_compute_image" "image-nat" {
  family = "nat-instance-ubuntu"
 }
resource "yandex_compute_instance" "proxy" {
  name                      = "proxy"
  hostname                  = "proxy"
  zone                      = "ru-central1-a"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = data.yandex_compute_image.image-nat.id
      size        = "10"
      type = "network-nvme"
      name = "root-proxy"
    }
  }

  network_interface {
    subnet_id      = "e9b1ksog3uds76urm4vd"
    ip_address     = "10.128.0.100"
    nat            = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}
