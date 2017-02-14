resource_name :chefrepolink
property :link, String, name_property: true

action :create do
  execute 'ran' do
    command 'echo ran command > /var/website/command.txt'
    not_if { ::File.exist? ('/var/website/command.txt') }
  end

  git '/var/website/chef-by-example' do
    repository "#{node['chefkata']['chefrepolink']}"
    action :nothing
    subscribes :sync, 'execute[ran]', :immediately
  end
end
