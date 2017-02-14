describe package('nano') do
  it { should be_installed }
end

describe os[:family] do
  it { should eq 'debian' }
end

describe directory('/var/website') do
  it { should exist }
end

describe directory('/bar/website') do
  it { should_not exist }
end

describe file('/var/website/directions.txt') do
  it { should exist }
  its('content') { should eq 'website goes here' }
end

describe directory('/var/website/arch') do
  it { should exist }
  it { should be_directory }
end

describe file('/var/website/arch/README.md') do
  it { should exist }
  its('content') { should match 'The Architect theme' }
end

