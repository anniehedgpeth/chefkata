property :site_name, String, name_attribute: true

action :create do
  execute 'echo' do
    command 'echo ran command > /var/website/command.txt'
    action :run
    not_if { ::File.exist?('/var/website/command.txt') }
    notifies :sync, 'git[/var/website/architect]', :immediately
  end

  git '/var/website/architect' do
    repository 'https://github.com/pages-themes/architect.git'
    action :nothing
  end
end
