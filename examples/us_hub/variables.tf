/**
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */




/* hub variables  */
variable "hub_project_id" {
  description = "Management Project ID."
  type        = string
  default     = "us-hub"
}

variable "hub_network_self_link" {
  description = "HUB Network Self Link."
  type        = string
  default     = "https://www.googleapis.com/compute/v1/projects/us-hub/global/networks/hub-network"
}

variable "region" {
  description = "Region."
  type        = string
  default     = "us-central1"
}


/*
 variable "create_vpn_gateway needs to be set to false only after the hub gateway is created"
*/
variable "create_vpn_gateway" {
  description = "When this variable is set to anyting but true the code will not create a new ha vpn gw"
  default = "false"
  
}

/*
variable "var.router_name" needs to be set to the router name in the hub account to ensure we reuse it and not create a new one
*/

variable "name" {
  description = "The name to be used to construct other resource names"
  default = "hub-to-spoke1"
}
