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

##To Prod VPC
module "ha-vpn-projet2-to-project1" {
  source           = "../../modules/vpn_ha"
  project_id       = var.project2_project_id
  region           = var.region
  network          = var.project2_network_self_link
  name             = var.project1_vpn_name
  peer_gcp_gateway = module.ha-vpn-project1-to-project2.self_link
  router_asn       = var.project1_asn
  tunnels = {
    remote-0 = {
      bgp_peer = {
        address = "169.254.1.1"
        asn     = 64513
      }
        bgp_peer_options                = {
        advertise_groups    = []
        advertise_ip_ranges =  {"10.1.0.0/16" = "this is the aggregate route managed by TF"} //The module parses this one map and assigned the key as the IP range and the value as the description of the IP range.
        advertise_mode      = "CUSTOM"
        route_priority      = 7777
    }
      bgp_session_range               = "169.254.1.2/30"
      ike_version                     = 2
      vpn_gateway_interface           = 0
      peer_external_gateway_interface = null
      shared_secret                   = ""
    }
    remote-1 = {
      bgp_peer = {
        address = "169.254.2.1"
        asn     = 64513
      }
      bgp_peer_options                = {
        advertise_groups    = []
        advertise_ip_ranges =  {"10.1.0.0/16" = "this is the aggregate route managed by TF"} //The module parses this one map and assigned the key as the IP range and the value as the description of the IP range.
        advertise_mode      = "CUSTOM"
        route_priority      = 7777
    }
      bgp_session_range               = "169.254.2.2/30"
      ike_version                     = 2
      vpn_gateway_interface           = 1
      peer_external_gateway_interface = null
      shared_secret                   = ""
    }
  }
}


##To MGMT VPC
module "ha-vpn-project1-to-project2" {
  source           = "../../modules/vpn_ha"
  project_id       = var.project1_project_id
  region           = var.region
  network          = var.project1_network_self_link
  name             = "ha_vpn-project1-to-project2"
  router_asn       = 64513
  peer_gcp_gateway = module.ha-vpn-projet2-to-project1.self_link
  tunnels = {
    remote-0 = {
      bgp_peer = {
        address = "169.254.1.2"
        asn     = 64514
      }
      bgp_peer_options                = {
        advertise_groups    = []
        advertise_ip_ranges =  {"10.2.0.0/16" = "this is the aggregate route managed by TF"} //The module parses this one map and assigned the key as the IP range and the value as the description of the IP range.
        advertise_mode      = "CUSTOM"
        route_priority      = 7777
    }
      bgp_session_range               = "169.254.1.1/30"
      ike_version                     = 2
      vpn_gateway_interface           = 0
      peer_external_gateway_interface = null
      shared_secret                   = module.ha-vpn-projet2-to-project1.random_secret
    }
    remote-1 = {
      bgp_peer = {
        address = "169.254.2.2"
        asn     = 64514
      }
       bgp_peer_options                = {
        advertise_groups    = []
        advertise_ip_ranges =  {"10.2.0.0/16" = "this is the aggregate route managed by TF"} //The module parses this one map and assigned the key as the IP range and the value as the description of the IP range.
        advertise_mode      = "CUSTOM"
        route_priority      = 7777
    }
      bgp_session_range               = "169.254.2.1/30"
      ike_version                     = 2
      vpn_gateway_interface           = 1
      peer_external_gateway_interface = null
      shared_secret                   = module.ha-vpn-projet2-to-project1.random_secret
    }
  }
}

