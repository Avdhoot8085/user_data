variable "region_name" {
  default = "ap-south-1"
}
variable "image" {
  default = "ami-051a31ab2f4d498f5"
}
variable "instance_type" {
  default = "t3.micro"
}
variable "key_pair" {
    default = "Avdhoot-key"
}
variable "sg" {
  default = ["sg-01f81067fcda67f7b"]
}