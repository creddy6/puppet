file {'/tmp/example-ip':                                            # resource type file and filename
  ensure  => present,                                               # make sure it exists
  mode    => '0644',                                                  # file permissions
  content => "Here is my time zone: ${timezone}. ${system_uptime}\n",  # note the ipaddress_eth0 fact
}
cron { 'chkrootkit':
  command => '/usr/sbin/chkrootkit >    /var/log/chkrootkit.log 2>&1',
  hour    => inline_template('<%= @hostname.sum % 24 %>'),
  minute  => '00',
}
