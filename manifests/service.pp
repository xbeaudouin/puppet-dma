# @summary This class contain the services for DMA module
# @example include dma::service
#
class dma::service {
  # DMA service configuration
  if $dma::default_mta == true {
    if $facts['os']['family'] == 'FreeBSD' {
      file {
        $dma::params::config_mailer_conf:
          ensure  => file,
          mode    => $dma::mailer_conf_mode,
          owner   => $dma::mailer_conf_owner,
          group   => $dma::mailer_conf_group,
          path    => $dma::params::config_mailer_conf,
          content => template($dma::params::config_mailer_conf_template);
      }
    }
  }
}
