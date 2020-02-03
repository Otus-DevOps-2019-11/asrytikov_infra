
resource "google_compute_forwarding_rule" "balancer" {
  name                  = "reddit-app"
  description           = "forwarding rule"
  target                = google_compute_target_pool.load-balancer-pool.self_link
  port_range            = "9292"
  load_balancing_scheme = "EXTERNAL"
}

resource "google_compute_target_pool" "load-balancer-pool" {
  name          = "load-balancer"
  description   = "load balancer"
  instances     = google_compute_instance.app.*.self_link
  health_checks = ["${google_compute_http_health_check.health-check.name}"]
}

resource "google_compute_http_health_check" "health-check" {
  name                = "health-check"
  port                = 9292
  timeout_sec         = 3
  check_interval_sec  = 4
  healthy_threshold   = 2
  unhealthy_threshold = 3
}
