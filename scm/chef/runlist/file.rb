file '/tmp/sandy.txt' do
  content 'Hello Sandy'
end

file '/tmp/sandy2.txt' do
  content IO.read('/runlist/sandy.file')
end
