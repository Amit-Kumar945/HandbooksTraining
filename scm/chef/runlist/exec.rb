execute 'delete_file' do
  command 'rm -f sandy.txt'
  cwd '/tmp'
#  environment 'PATH' => '/usr/bin:/bin/tar:/bin'
  path ['/usr/bin', '/bin/tar', '/bin']
end
