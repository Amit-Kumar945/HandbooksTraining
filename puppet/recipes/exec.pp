exec { 'rm -f sandy.txt':
  cwd => '/tmp',
   path    => '/usr/bin:/bin/tar:/bin',
}
