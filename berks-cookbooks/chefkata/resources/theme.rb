resource_name :theme
property :repolink, String, name_property: true

action :create do
  execute 'ran' do
    command 'echo ran command > /var/website/command.txt'
    action :run
    not_if { ::File.exist?('/var/website/command.txt') }
  end

  git '/var/website/arch' do
    repository repolink
    action :nothing
    subscribes :sync, 'execute[ran]', :immediately
  end
end
