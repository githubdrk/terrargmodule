variable "names" {
    type =  map(any)
    description = " Name of the resource group."

}
variable "locations " {
    type =map(any)
    description = "name of the resource group."
}
variable "tags" {
    type = map(string)
    description = "metada tags"
    }
  
