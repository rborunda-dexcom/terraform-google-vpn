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

##To Hub to spoke1
module "vpn-hub-to-spoke1" {
  source           = "../../modules/vpn_ha"
  project_id       = var.hub_project_id
  region           = var.region
  network          = var.hub_network_self_link
  name             = "hub-to-spoke1"
  peer_gcp_gateway = module.vpn-spoke1-to-hub.self_link
  router_asn       = 64514
  tunnels = {
    remote-0 = {
      bgp_peer = {
        address = "169.254.1.1"
        asn     = 64513
      }
      bgp_peer_options                = {
        advertise_groups    = []
        advertise_ip_ranges =  {range = "10.1.0.0/16"}
        advertise_mode      = "CUSTOM"
        route_priority      = 1000
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
      bgp_peer_options                = null
      bgp_session_range               = "169.254.2.2/30"
      ike_version                     = 2
      vpn_gateway_interface           = 1
      peer_external_gateway_interface = null
      shared_secret                   = ""
    }
  }
}

##from Hub to Spoke2
module "vpn-hub-to-spoke2" {
  source           = "../../modules/vpn_ha"
  project_id       = var.hub_project_id
  region           = var.region
  network          = var.hub_network_self_link
  name             = "hub-to-spoke2"
  peer_gcp_gateway = module.vpn-spoke2-to-hub.self_link
  router_asn       = 64516
  tunnels = {
    remote-0 = {
      bgp_peer = {
        address = "169.254.1.5"
        asn     = 64515
      }
      bgp_peer_options                = null
      bgp_session_range               = "169.254.1.6/30"
      ike_version                     = 2
      vpn_gateway_interface           = 0
      peer_external_gateway_interface = null
      shared_secret                   = ""
    }
    remote-1 = {
      bgp_peer = {
        address = "169.254.2.5"
        asn     = 64515
      }
      bgp_peer_options                = null
      bgp_session_range               = "169.254.2.6/30"
      ike_version                     = 2
      vpn_gateway_interface           = 1
      peer_external_gateway_interface = null
      shared_secret                   = ""
    }
  }
}


