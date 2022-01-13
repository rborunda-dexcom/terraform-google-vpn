
module "staging-us-5g-infrastructure-1-to-hq" {

    source = "terraform-google-modules/vpn/google//modules/vpn_ha" #The folder path is required because GCP created a submodule HA-VPN rather than a new repo. https://registry.terraform.io/modules/terraform-google-modules/vpn/google/latest/submodules/vpn_ha
    version = "2.1.0"
    ##source    = "github.com/terraform-google-modules/terraform-google-vpn.git//modules/vpn_ha?ref=v2.1.0" ### This one works
    

    #source             = "github.com/sweetspot/terraform-modules.git//terraform-google-vpn//modules/vpn_ha"


  # source           = "../../../modules/vpn_ha" ##Local Development
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
        advertise_mode      = "DEFAULT" # var_tunnels_route-0_bgp_peer_options.advertised_mode
        route_priority      = 7777 # var-tunnels-route-0.bgp_peer_options-route_priority
    }
      bgp_session_range = "169.254.18.93/30" #for Staging5g – 169.254.18.93/30, for Prod5G - 169.254.18.97/30 # var.var-tunnels-remote-0-bgp_session_range
      ike_version       = 2 # var.ike_version
      vpn_gateway_interface = 0 #var.tunnels-remote-0-vpn_gateway_interface
      peer_external_gateway_interface = 0 #var.peer_external_gateway_interface
      shared_secret     = "e4-0BQ3HgG$z" #in Thycotic – will provide when ready #var.shared_secret
    }
    remote-1 = {
      bgp_peer = {
        address = "169.254.19.94" # - for Staging5G – 169.254.19.94, for Prod5G - 169.254.19.98 # var.tunnels-remote-1-bgp-peer-ip
        asn     = 65456 # var.remot-1-bgp-peer-asn
      }
      # Because this is a default routing that advertise all, we just want to set the priority and no other BGP options
      bgp_peer_options                = {
        advertise_groups    = [] # var.tunnels.route-1.bgp_peer_options.advertised_group
        advertise_ip_ranges =  {} # var_tunnels_route-1_bgp_peer_options_advertised_ip_ranges
        advertise_mode      = "DEFAULT" # var_tunnels_route-1_bgp_peer_options.advertised_mode
        route_priority      = 7777 # var-tunnels-route-1.bgp_peer_options-route_priority
    }
      bgp_session_range = "169.254.19.93/30" #for Staging5g – 169.254.19.93/30, for Prod5G - 169.254.19.97/30 # var.var-tunnels-remote-1-bgp_session_range
      ike_version       = 2 # var.ike_version
      vpn_gateway_interface = 1 #var.tunnels-remote-1-vpn_gateway_interface
      peer_external_gateway_interface = 0  #var.peer_external_gateway_interface
      shared_secret     = "e4-0BQ3HgG$z" #in Thycotic – will provide when ready  #var.shared_secret
    }

    }
  }

