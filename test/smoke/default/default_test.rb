describe package('nano') do
  it { should be_installed }
end

describe os[:family] do
  it { should eq 'debian'}
end

describe directory('/var/website') do
  it { should exist }
end

describe directory('/var/old-website') do
  it { should_not exist }
end

describe file('/var/website/builder.txt') do
  it { should exist }
  its('content') { should match /Test Kitchen built this/ }
end

describe file('/var/website/logo.jpg') do
  it { should exist }
end

describe file('/var/website/command.txt') do
  it { should exist }
  its('content') { should match /ran command/ }
end

describe directory('/var/website/architect') do
  it { should exist }
end
