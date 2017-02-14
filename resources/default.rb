resource_name :ran_archrepo
property :clonelink, String, name_property: true

action :create do
  execute 'ran' do
    command 'echo ran command > /var/website/command.txt'
    not_if { ::File.exist?('/var/website/command.txt') }
  end

  git '/var/website/arch' do
    repository clonelink
    action :nothing
    subscribes :sync, 'execute[ran]', :immediately
  end
end
