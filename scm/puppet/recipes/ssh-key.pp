
ssh_authorized_key { 'jenkins@ddd05efe3cd2':
  ensure => present,
  user   => 'root',
  type   => 'ssh-rsa',
  key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDKFAwXjgrN39++xc+CIaMx/A2H41oBL5U4+ly51S9O06kZ8HiiMyVFqcMQzBQZqyLtRofpLuCEYMak/I3mwHonpOD6U+B776xDtKSOdLZqRXou0e82w1nJBmmkilHXFqvJ9cs0f9Jca+vVMZ746Vm7XNFV2EvYMOLzwZyVznSTFuRkHsFyFSvaPYT7UkrT+YoDetNl3BQaZaTSqt6biowCuxdMQt7v/WQ1VwK3S5tbLQVwFnl7jZ46NQL0mR/gr8oqWwlOgpmnLW885UHMUC759E7NBaYPbDKkofzwIW0bnSMnWX8fSM/gamCetNgS1EJameYsuocVJmpDDx8rmaUz',
}

