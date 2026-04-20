variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    hdd_size      = number
    hdd_type      = string
    preemptible   = bool
    platform_id   = string
    image_family  = string
  }))
  description = "Конфигурация ресурсов для web и db VM"

  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 20
      hdd_size      = 10
      hdd_type      = "network-hdd"
      preemptible   = true
      platform_id   = "standard-v4a"
      image_family  = "ubuntu-2004-lts"
    },
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
      hdd_size      = 10
      hdd_type      = "network-ssd"
      preemptible   = true
      platform_id   = "standard-v4a"
      image_family  = "ubuntu-2004-lts"
    }
  }
}

variable "metadata" {
  type        = map(string)
  description = "Общие метаданные для всех ВМ"
}

variable "vm_web_prefix" {
  type    = string
  default = "netology"
}

variable "vm_web_environment" {
  type    = string
  default = "develop"
}

variable "vm_web_platform" {
  type    = string
  default = "platform"
}

variable "vm_web_role" {
  type    = string
  default = "web"
}

variable "vm_db_prefix" {
  type    = string
  default = "netology"
}

variable "vm_db_environment" {
  type    = string
  default = "develop"
}

variable "vm_db_platform" {
  type    = string
  default = "platform"
}

variable "vm_db_role" {
  type    = string
  default = "db"
}

variable "vm_db_zone" {
  type    = string
  default = "ru-central1-b"
}

#Ниже переменные больше не используются после перехода на vms_resources.
# Оставлены закомментированными по условию задания 6.

# variable "vm_web_platform_id" {
#   type        = string
#   description = "Платформа web VM"
#   default     = "standard-v4a"
# }

# variable "vm_web_cores" {
#   type        = number
#   description = "Количество vCPU для web VM"
#   default     = 2
# }

# variable "vm_web_memory" {
#   type        = number
#   description = "Объем RAM для web VM в ГБ"
#   default     = 1
# }

# variable "vm_web_core_fraction" {
#   type        = number
#   description = "Гарантированная доля CPU для web VM"
#   default     = 20
# }

# variable "vm_web_preemptible" {
#   type        = bool
#   description = "Использовать ли preemptible VM для web"
#   default     = true
# }

# variable "vm_web_image_family" {
#   type        = string
#   description = "Семейство образа для web VM"
#   default     = "ubuntu-2004-lts"
# }

# variable "vm_db_platform_id" {
#   type        = string
#   description = "Платформа db VM"
#   default     = "standard-v4a"
# }

# variable "vm_db_cores" {
#   type        = number
#   description = "Количество vCPU для db VM"
#   default     = 2
# }

# variable "vm_db_memory" {
#   type        = number
#   description = "Объем RAM для db VM в ГБ"
#   default     = 2
# }

# variable "vm_db_core_fraction" {
#   type        = number
#   description = "Гарантированная доля CPU для db VM"
#   default     = 20
# }

# variable "vm_db_preemptible" {
#   type        = bool
#   description = "Использовать ли preemptible VM для db"
#   default     = true
# }

# variable "vm_db_image_family" {
#   type        = string
#   description = "Семейство образа для db VM"
#   default     = "ubuntu-2004-lts"
# }
