variable "hash_commit" {
  default     = "7b4facbba78e4eab86ea32aaef3f4709"
  description = "Hash para complementar o nome da AMI"
}

variable "name" {
  type        = string
  description = "Nome do produto"
}

variable "enable_sg" {
  type        = bool
  default     = false
  description = "Habilitar funcionalidade de criação do SG"
}

variable "ingress_ports" {
  type        = list(number)
  default     = []
  description = "Lista de portas a serem liberadas"
}

variable "instance_count" {
  type        = int
  default     = "1"
  description = "Quantidade de instâncias a serem criadas."
}