describe directory('/bin/nano') do
  it { should exist }
end

describe os[:family] do
  it { should eq 'debian' }
end

describe directory('/var/website') do
  it { should exist }
end

describe directory('/var/old-website') do
  it { should_not exist }
end

describe file('/var/website/directions.txt') do
  it { should exist }
  its('content') { should match /website goes here/ }
end

describe file('/var/website/builder.txt') do
  it { should exist }
  its('content') { should match /Test Kitchen built this/ }
end

describe file('/var/website/cheflogo.jpg') do
  it { should exist }
end
