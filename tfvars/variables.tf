variable "domain_name" {
    default="asividevops.online"
}
variable "zone_id"{
    default="Z04729101AWEOYIE4LE28"
}
variable "instances" {
    type=map
  
}

variable "common_tags" {
    default={
        project="expense"
        terraform=true
    }
}
variable "tags" {
    type=map
  
}
variable "environment" {
  
}