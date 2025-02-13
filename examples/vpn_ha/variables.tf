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

variable "prod_project_id" {
  description = "Production Project ID."
  type        = string
  default = "project1-330918"
}

variable "prod_network_self_link" {
  description = "Production Network Self Link."
  type        = string
  default = "https://www.googleapis.com/compute/v1/projects/project1-330918/global/networks/preexisting1-project1"
}

variable "mgt_project_id" {
  description = "Management Project ID."
  type        = string
  default = "project2-330918"
}

variable "mgt_network_self_link" {
  description = "Management Network Self Link."
  type        = string
  default = "https://www.googleapis.com/compute/v1/projects/project2-330918/global/networks/preexisting2-project2"
}

variable "region" {
  description = "Region."
  type        = string
  default     = "europe-west4"
}
