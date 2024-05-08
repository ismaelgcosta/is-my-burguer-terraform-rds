# precisa começar com TF_VAR_
variable "TF_VAR_POSTGRES_USER" {
  description = "The master username for the database."
  type        = string
  sensitive   = true
}

# precisa começar com TF_VAR_
variable "TF_VAR_POSTGRES_PASSWORD" {
  description = "The master password for the database."
  type        = string
  sensitive   = true
}

# precisa começar com TF_VAR_
variable "TF_VAR_MONGODB_ATLAS_API_PUB_KEY" {
  default = "my-public-key"
  type        = string
  sensitive   = true
}

# precisa começar com TF_VAR_
variable "TF_VAR_MONGODB_ATLAS_API_PRI_KEY" {
  default = "my-private-key"
  type        = string
  sensitive   = true
}

# precisa começar com TF_VAR_
variable "TF_VAR_MONGODB_ATLAS_PROJECT_ID" {
  default = "my-private-project"
  type        = string
  sensitive   = true
}

# precisa começar com TF_VAR_
variable "TF_VAR_MONGODB_PASSWORD" {
  description = "The password for the mongodb database."
  type        = string
  sensitive   = true
}

# precisa começar com TF_VAR_
variable "TF_VAR_MONGODB_USERNAME" {
  description = "The username for the mongodb database."
  type        = string
  sensitive   = true
}

# precisa começar com TF_VAR_
variable "TF_VAR_MONGODB_AUTH_PASSWORD" {
  description = "The password for the mongodb database."
  type        = string
  sensitive   = true
}

# precisa começar com TF_VAR_
variable "TF_VAR_MONGODB_AUTH_USERNAME" {
  description = "The username for the mongodb database."
  type        = string
  sensitive   = true
}

# precisa começar com TF_VAR_
variable "TF_VAR_MONGODB_PAGAMENTO_PASSWORD" {
  description = "The password for the mongodb database."
  type        = string
  sensitive   = true
}

# precisa começar com TF_VAR_
variable "TF_VAR_MONGODB_PAGAMENTO_USERNAME" {
  description = "The username for the mongodb database."
  type        = string
  sensitive   = true
}

# precisa começar com TF_VAR_
variable "TF_VAR_MONGODB_CONTROLE_PEDIDO_PASSWORD" {
  description = "The password for the mongodb database."
  type        = string
  sensitive   = true
}

# precisa começar com TF_VAR_
variable "TF_VAR_MONGODB_CONTROLE_PEDIDO_USERNAME" {
  description = "The username for the mongodb database."
  type        = string
  sensitive   = true
}

