describe package('nano') do
  it { should be_installed }
end

describe directory('/var/website') do
  it { should be_directory }
  it { should exist }
end

describe directory('/var/old-website') do
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

describe directory('/var/website/chef-by-example') do
  it { should exist }
end

describe file('/var/website/chef-by-example/README.md') do
  it { should exist }
  its('content') { should match 'Learning Chef can be difficult with real world examples' }
end
