include_recipe 'ubuntu'
include_recipe 'nano'

directory '/var/website'

file '/var/website/directions.txt' do
  content 'website goes here'
end
