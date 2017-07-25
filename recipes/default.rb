#
# Cookbook:: chefkata
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'nano'

directory '/var/website'

file '/var/website/directions.txt' do
  content 'website goes here'
end
