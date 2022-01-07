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

/**
 * Copyright 2018 Google LLC
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

variable "network_self_link" {
  type    = string
  default = "https://www.googleapis.com/compute/v1/projects/staging-us-5g-infrastructure-1/global/networks/staging-us-5g-infrastructure-1-network"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "project_id" {
  type    = string
  default = "staging-us-5g-infrastructure-1"
}

variable "peer_ips" {
  type    = string
  default = ""
}

variable "name" {
type      = string
default   = "staging-us-5g-infrastructure-1-to-hq"
}

variable "router_asn" {
  type    = string
  default = "65458"
}

variable "network" {
  type = string 
  default = "staging-us-5g-infrastructure-1-network"
}


variable "create_vpn_gateway" {
  description = "When this variable is set to anyting but true the code will not create a new ha vpn gw"
  default = "true"
  
}



 

 







