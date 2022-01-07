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
module "vpn-hub" {
  source           = "../../modules/vpn_ha"
  project_id       = var.hub_project_id
  region           = var.region
  network          = var.hub_network_self_link
  name             = var.name
  peer_gcp_gateway =  "" // for existing peer gw, don't invoke to module (it creates a gw), but pass a variable with the name of the existing gw
  router_asn       = 64514
tunnels = {
    remote-0 = {
      bgp_peer = {
        address = "169.254.1.5"
        asn     = 64515
      }
      bgp_peer_options                = null
      bgp_session_range               = "169.254.1.6/30"
      peer_gcp_gateway                 = data.google_compute_ha_vpn_gateway.data-spoke2-to-hub.self_link
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
      peer_gcp_gateway                =  data.google_compute_ha_vpn_gateway.data-spoke2-to-hub.self_link
      ike_version                     = 2
      vpn_gateway_interface           = 1
      peer_external_gateway_interface = null
      shared_secret                   = ""

    }
   
  }
}

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


