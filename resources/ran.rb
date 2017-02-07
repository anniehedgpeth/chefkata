

  execute 'ran' do
    command 'echo ran command > /var/website/command.txt'
    not_if{ ::File.exist?('/var/website/command.txt') }
  end
  
  git '/var/website/architect' do
    repository 'https://github.com/pages-themes/architect.git'
    action :nothing
    subscribes :sync, 'execute[ran]', :immediately
  end
}