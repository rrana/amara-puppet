class config::roles::jenkins inherits config::params {
  if ! defined(Class['::jenkins']) {
    class { '::jenkins':
      port => $config::params::jenkins_port,
    }
  }
  if ! defined(Class['rabbitmq']) { class { 'rabbitmq': } }
  if ! defined(Class['redis']) { class { 'redis': } }
  if ! defined(Class['solr']) { class { 'solr': configure => false, } }
  if ! defined(Class['virtualenv']) { class { 'virtualenv': } }
}
