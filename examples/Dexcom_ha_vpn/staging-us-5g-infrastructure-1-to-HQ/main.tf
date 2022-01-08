
module "staging-us-5g-infrastructure-1-to-hq" {
  source           = "../../../modules/vpn_ha"
  project_id  = var.project_id
  region  = var.region
  network         = var.network_self_link
  name            = var.name
  peer_external_gateway = {
      redundancy_type = "SINGLE_IP_INTERNALLY_REDUNDANT"
      interfaces = [{
          id = 0
          ip_address = "66.85.67.20" # on-prem router ip address # var.peer_external_gw_address

      }]
  }
  router_asn = 65458 # var.router.asn
  tunnels = {
    remote-0 = {
      bgp_peer = {
        address = "169.254.18.94" //– for Staging5G – 169.254.18.94, for Prod5G - 169.254.18.98 # var.tunnels-remote-0-bgp-peer-ip
        asn     = 65456 # var.remot-0-bgp-peer-asn
      }
              bgp_peer_options                = {
        advertise_groups    = [] # var.tunnels.route-0.bgp_peer_options.advertised_group
        advertise_ip_ranges =  {} # var_tunnels_route-0_bgp_peer_options_advertised_ip_ranges
        advertise_mode      = "" # var_tunnels_route-0_bgp_peer_options.advertised_mode
        route_priority      = 7777 # var-tunnels-route-0.bgp_peer_options-route_priority
    }
      bgp_session_range = "169.254.18.93/30" #for Staging5g – 169.254.18.93/30, for Prod5G - 169.254.18.97/30
      ike_version       = 2
      vpn_gateway_interface = 0
      peer_external_gateway_interface = 0
      shared_secret     = "e4-0BQ3HgG$z" #in Thycotic – will provide when ready
    }
    remote-1 = {
      bgp_peer = {
        address = "169.254.19.94" # - for Staging5G – 169.254.19.94, for Prod5G - 169.254.19.98
        asn     = 65456
      }
      # Because this is a default routing that advertise all, we just want to set the priority and no other BGP options
      bgp_peer_options                = {
        advertise_groups    = []
        advertise_ip_ranges =  {}
        advertise_mode      = ""
        route_priority      = 7777
    }
      bgp_session_range = "169.254.19.93/30" #for Staging5g – 169.254.19.93/30, for Prod5G - 169.254.19.97/30
      ike_version       = 2
      vpn_gateway_interface = 1
      peer_external_gateway_interface = 0
      shared_secret     = "e4-0BQ3HgG$z" #in Thycotic – will provide when ready
    }

    }
  }

