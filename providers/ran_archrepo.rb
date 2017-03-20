action :create do
  execute 'ran' do
    command 'echo ran command > /var/website/command.txt'
    not_if { ::File.exist?('/var/website/command.txt') }
  end

  git '/var/website/arch' do
    repository new_resource.clonelink
    action :nothing
    subscribes :sync, 'execute[ran]', :immediately
  end
end
