variable "instance_id" {
   type        = string
}
variable "name_prefix" {
   type        = string
    default     = "prod"
}

variable "cpu_threshold" {
   type        = number
    default     = 80
}

variable "alarm_actions" {
   type        = list(string)
    default     = []
}
