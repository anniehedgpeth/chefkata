resource_name :arch
property :archrepo, String, name_property: true

action :create do
  execute 'ran' do
    command 'echo ran command > /var/website/command.txt'
    action :run
    not_if { ::File.exist?('/var/website/command.txt') }
  end

  git '/var/website/architect' do
    repository archrepo
    action :nothing
    subscribes :sync, 'execute[ran]', :immediately
  end
end
