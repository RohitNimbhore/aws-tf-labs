variable "ami" {
    type = string      
}

variable "instancesize" {
    type = string  
}

variable "servernames" {
    type = list(string)
    default = [ "Manjeetserver","Rohitserver","Niharikaserver" ]
  
}

variable "common_tags" {
    type = map(string)
  
}

variable "availability_zone" {
    type = list(string)
    default = [ "us-east-1a,us-east-1b,us-east-1c,us-east-1d" ]
  
}

variable "cidr_block" {
    type = string
    default = "10.10.0.0/24"
  
}

