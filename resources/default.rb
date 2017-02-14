resource_name :repo_resource
property :repo_link, String, name_property: true

action :create do
  execute 'echo' do
    command 'echo ran command > /var/website/command.txt'
    not_if { ::File.exist?('/var/website/command.txt') }
  end

  git 'arch' do
    destination '/var/website/arch'
    repository repo_link
    action :nothing
    subscribes :sync, 'execute[echo]', :immediately
  end
end
