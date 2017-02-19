describe os[:family] do
  it { should eq 'debian' }
end

describe package('nano') do
  it { should be_installed }
end

describe directory('/var/website') do
  it { should exist }
  it { should be_directory }
end

describe directory('/var/website2') do
  it { should_not exist }
end

describe file('/var/website/directions.txt') do
  it { should exist }
  its('content') { should eq 'website goes here' }
end

describe file('/var/website/builder.txt') do
  it { should exist }
  its('content') { should eq 'Test Kitchen built this' }
end

describe file('/var/website/logo.jpg') do
  it { should exist }
end

describe file('/var/website/command.txt') do
  it { should exist }
  its('content') { should match 'ran command' }
end

describe directory('/var/website/arch') do
  it { should exist }
end

describe file('/var/website/arch/README.md') do
  it { should exist }
  its('content') { should match 'The Architect theme' }
end

describe file('/var/website/arch/jekyll-theme-architect.gemspec') do
  it { should exist }
end

describe file('/var/website/welcome.txt') do
  it { should exist }
  its('content') { should eq 'Welcome to Chef Learning!' }
end
