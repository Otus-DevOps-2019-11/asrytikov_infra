variable project {
  description = "Project ID"
}
variable region {
  description = "Region"
  # Значение по умолчанию
  default = "europe-west1"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable disk_image {
  description = "Disk image"
}
variable private_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable zone {
  # Описание переменной
  description = "zone"
  default     = "europe-west1-c"
}
variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}

variable app_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-app-base"
}

variable source_ranges {
  description = "network"
  default     = ["0.0.0.0/0"]
}
