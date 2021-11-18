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





##To MGMT VPC
module "vpn-spoke1-to-hub" {
  source           = "../../modules/vpn_ha"
  project_id       = var.spoke1_project_id
  region           = var.region
  network          = var.spoke1_network_self_link
  name             = "spoke1-to-hub"
  router_asn       = 64513
  peer_gcp_gateway = data.google_compute_ha_vpn_gateway.vpn-hub.self_link
  tunnels = {
    remote-0 = {
      bgp_peer = {
        address = "169.254.1.2"
        asn     = 64514
      }
      bgp_peer_options                = {
        advertise_groups    = []
        advertise_ip_ranges =  {"10.1.0.0/16" = "this is the aggregate route managed by TF"} //The module parses this one map and assigned the key as the IP range and the value as the description of the IP range.
        advertise_mode      = "CUSTOM"
        route_priority      = 500
    }
      bgp_session_range               = "169.254.1.1/30"
      ike_version                     = 2
      vpn_gateway_interface           = 0
      peer_external_gateway_interface = null
      shared_secret                   = module.vpn-hub.random_secret
    }
    remote-1 = {
      bgp_peer = {
        address = "169.254.2.2"
        asn     = 64514
      }
      bgp_peer_options                = {
        advertise_groups    = []
        advertise_ip_ranges =  {"10.1.0.0/16" = "this is the aggregate route managed by TF"} //The module parses this one map and assigned the key as the IP range and the value as the description of the IP range.
        advertise_mode      = "CUSTOM"
        route_priority      = 500
    }
      bgp_session_range               = "169.254.2.1/30"
      ike_version                     = 2
      vpn_gateway_interface           = 1
      peer_external_gateway_interface = null
      shared_secret                   = module.vpn-hub.random_secret
    }
  }
}


