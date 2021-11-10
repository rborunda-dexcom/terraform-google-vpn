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


/*  spoke1 variables  */
variable "spoke1_project_id" {
  description = "Spoke1 Project ID."
  type        = string
  default     = "us-spoke1"
}

variable "spoke1_network_self_link" {
  description = "Spoke1 Network Self Link."
  type        = string
  default     = "https://www.googleapis.com/compute/v1/projects/us-spoke1/global/networks/spoke1-network"
}


/*  spoke2 variables  */
variable "spoke2_project_id" {
  description = "Spoke2 Project ID."
  type        = string
  default     = "ringed-furnace-331520"
}

variable "spoke2_network_self_link" {
  description = "Spoke2 Network Self Link."
  type        = string
  default     = "https://www.googleapis.com/compute/v1/projects/ringed-furnace-331520/global/networks/spoke2-network"
}

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
