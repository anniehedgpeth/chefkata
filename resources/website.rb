resource_name :git_website
# Property is a made up word for use in the resource and not in quotes so that you can use it in as variable. In this case, "git_repo" is equivalent to "command" in the execute resource. "name_property" is what is in quotes after the resource is called. If you don't put anything as the property, then it uses what's in the name_property.
property :git_repo, String, default: 'https://github.com/pages-themes/architect', name_property: true

action :create do
  execute 'ran' do
    command 'echo ran command > /var/website/command.txt'
    not_if { ::File.exist?('/var/website/command.txt') }
  end

  git 'git-architect' do
    destination '/var/website/architect'
    repository git_repo
    action :nothing
    subscribes :sync, 'execute[ran]', :immediately
  end
end
