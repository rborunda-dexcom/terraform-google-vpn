/*


##To MGMT VPC
module "vpn-ha-to-hub" {
  source           = "../../modules/vpn_ha"
  project_id       = var.spoke1_project_id
  region           = var.region
  network          = var.spoke1_network_self_link
  name             = "prod-to-mgmt"
  router_asn       = 64513
  peer_gcp_gateway = module.vpn-ha-to-spoke1.self_link
  tunnels = {
    remote-0 = {
      bgp_peer = {
        address = "169.254.1.5"
        asn     = 64514
      }
      bgp_peer_options                = null
      bgp_session_range               = "169.254.1.4/30"
      ike_version                     = 2
      vpn_gateway_interface           = 2
      peer_external_gateway_interface = null
      shared_secret                   = module.vpn-ha-to-hub.random_secret
    }
    remote-1 = {
      bgp_peer = {
        address = "169.254.2.2"
        asn     = 64514
      }
      bgp_peer_options                = null
      bgp_session_range               = "169.254.2.4/30"
      ike_version                     = 2
      vpn_gateway_interface           = 3
      peer_external_gateway_interface = null
      shared_secret                   = module.vpn-ha-to-hub.random_secret
    }
  }
}

*/

