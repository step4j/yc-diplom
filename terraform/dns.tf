resource "yandex_dns_zone" "step4j-ru" {
  name    = "step4j-ru"
  zone    = "step4j.ru."
  public  = true
}

resource "yandex_dns_recordset" "record-set" {
  for_each = toset(["www.", "gitlab.", "grafana.", "alertmanager.", "prometheus.",""])

  zone_id = yandex_dns_zone.step4j-ru.id
  name    = "${each.key}step4j.ru."
  type    = "A"
  ttl     = 30
  data    = [
    yandex_compute_instance.proxy.network_interface.0.nat_ip_address
  ]
  depends_on = [
    yandex_compute_instance.proxy
  ]
}

