# @summary This module manage local dma installation
#
# @param default_mta Boolean, if set to dma, dma will be set as default mta
# @param nullclient Mail will be directly sent to smarthost without parsing aliases
# @param smarthost Server that is used for outgoing mail
# @param mailname Mail name (default fdqn)
# @param usestarttls Override dma.conf parameter
# @param opportunistictls Override dma.conf parameter
#
# @example Declaring the class
#    class { '::dma':
#      smarthost        => 'mail.example.local',
#      opportunistictls => true,
#    }
#
class dma (
  $default_mta           = $dma::params::default_mta,
  $nullclient            = $dma::params::nullclient,
  $smarthost             = $dma::params::smarthost,
  $mailname              = undef,
  $usestarttls           = undef,
  $opportunistictls      = undef,
) inherits dma::params {
  # Start workflow
  if $dma::params::supported {
    class{ '::dma::config': }
    -> class{ '::dma::service': }
    -> Class['dma']
  }
  else {
    warning('The current operating system is not supported!')
  }
}
