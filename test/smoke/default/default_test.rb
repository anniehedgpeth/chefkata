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
  its('content') { should eq 'website goes here' }
end

describe file('/var/website/builder.txt') do
  it { should exist }
  its('content') { should match 'Test Kitchen built this' }
end

describe file('/var/website/logo.jpg') do
  it { should exist }
end

describe file('/var/website/command.txt') do
  it { should exist }
  its('content') { should match 'ran command' }
end

describe directory('/var/website/architect') do
  it { should exist }
end

describe file('/var/website/architect/README.md') do
  it { should exist }
  its('content') { should match 'The Architect theme' }
  its('content') { should match 'Architect is a Jekyll theme for GitHub Pages.' }
end
