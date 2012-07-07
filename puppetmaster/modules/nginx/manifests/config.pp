class nginx::config inherits nginx::params {
  $www_user = 'www-data'
  Exec {
    path      => "${::path}",
    logoutput => on_failure,
  }
  file { 'nginx::config::vhost_unisubs_example_com':
    path    => '/etc/nginx/conf.d/unisubs.example.com.conf',
    content => template('nginx/vhost_unisubs.example.com.conf.erb'),
    owner   => "${nginx::config::www_user}",
    mode    => 0644,
    require => Package['nginx'],
    notify  => Service['nginx'],
  }
}
