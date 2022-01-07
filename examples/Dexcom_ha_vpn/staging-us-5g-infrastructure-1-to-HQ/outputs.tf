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



output "external_GT" {
  value = module.staging-us-5g-infrastructure-1-to-hq.external_gateway
}


output "ha_gateway_name" {
  value = module.staging-us-5g-infrastructure-1-to-hq.gateway
}


output "gw_name" {
  value = module.staging-us-5g-infrastructure-1-to-hq.name
}

output "router" {
  value = module.staging-us-5g-infrastructure-1-to-hq.router
}

output "router_name" {
  value = module.staging-us-5g-infrastructure-1-to-hq.router_name
}

output "ha_vnp_selflink" {
  value = module.staging-us-5g-infrastructure-1-to-hq.self_link
}

output "vpn_tunnel_name" {
  value = module.staging-us-5g-infrastructure-1-to-hq.tunnel_names
  sensitive = true
}

output "vpn_tunnel_selflink" {
  value = module.staging-us-5g-infrastructure-1-to-hq.tunnel_self_links
  sensitive   = true
}


output "tunnels" {
  value = module.staging-us-5g-infrastructure-1-to-hq.tunnels
  sensitive = true
}