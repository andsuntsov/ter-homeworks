locals {
  vm_web_name = "${var.vm_web_prefix}-${var.vm_web_environment}-${var.vm_web_platform}-${var.vm_web_role}"
  vm_db_name  = "${var.vm_db_prefix}-${var.vm_db_environment}-${var.vm_db_platform}-${var.vm_db_role}"
}
