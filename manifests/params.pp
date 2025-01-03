# @summary This class contain the default parameters for dma module
# @example include dma::param
#
class dma::params {
  # Operating system specific definitions
  #case $::osfamily {
  case $facts['os']['family'] {
    'FreeBSD': {
      $supported                   = true

      # Package definitions
      $package_dma                 = 'dma'

      # Config definition
      $config_dma_conf             = '/etc/dma/dma.conf'
      $config_dma_conf_template    = 'dma/dma.conf.erb'
      $config_mailer_conf          = '/etc/mail/mailer.conf'
      $config_mailer_conf_template = 'dma/mailer.conf.erb'
      $dma_conf_mode               = '0644'
      $dma_conf_owner              = 'root'
      $dma_conf_group              = 'wheel'
      $revaliases_conf_group       = 'wheel'
      $mailer_conf_mode            = '0644'
      $mailer_conf_owner           = 'root'
      $mailer_conf_group           = 'wheel'
    }

    default  : {
      $supported                   = false
    }
  }

  # DMA definitions
  $default_mta            = false
  $nullclient             = false
  $smarthost              = 'mail.example.local'
  # Todo masquerade
  #$revaliases             = ['# Custom revaliases']
}
