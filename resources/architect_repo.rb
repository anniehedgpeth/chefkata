resource_name :architect_repo
property :git_link, String, name_property: true

action :create do
  execute 'echo' do
    command 'echo ran command > /var/website/command.txt'
    action :run
    not_if { ::File.exist?('/var/website/command.txt') }
  end

  git '/var/website/architect' do
    repository git_link
    action :nothing
    subscribes :sync, 'execute[echo]', :immediately
  end
end
