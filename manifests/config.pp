# @summary This class contain the configuration for dma module
# @example include dma::config
#
class dma::config {
  # make parameters available in local scope for usage in templates
  $default_mta           = $dma::default_mta
  $nullclient            = $dma::nullclient
  $smarthost             = $dma::smarthost
  $mailname              = $dma::mailname
  $usestarttls           = $dma::usestarttls
  $opportunistictls      = $dma::opportunistictls

  # sSMTP configuration
  file {
    $dma::params::config_dma_conf:
      ensure  => file,
      mode    => $dma::params::dma_conf_mode,
      owner   => $dma::params::dma_conf_owner,
      group   => $dma::params::dma_conf_group,
      path    => $dma::params::config_dma_conf,
      content => template($dma::params::config_dma_conf_template);
  }
}
