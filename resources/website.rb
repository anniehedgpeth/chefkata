resource_name :chefkata
property :kata, String, name_property: true

action :create do
  execute 'ran' do
    command 'echo ran command > /var/website/command.txt'
    not_if { ::File.exist?('/var/website/command.txt') }
  end

  git 'chefkata' do
    destination '/var/website/chefkata'
    repository kata
    action :nothing
    subscribes :sync, 'execute[ran]', :immediately
  end
end
