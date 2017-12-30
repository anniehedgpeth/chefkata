# # encoding: utf-8

# Inspec test for recipe chefkata::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package('nano') do
  it { should be_installed }
end

describe directory('/var/website') do
  it { should exist }
end

describe directory('/var/old-website') do
  it { should_not exist }
end

describe file('/var/website/directions.txt') do
  its('content') { should match(/website goes here/) }
end

describe file('/var/website/builder.txt') do
  its('content') { should match(/Test Kitchen built this/) }
end

describe file('/var/website/logo.png') do
  it { should exist }
end

describe file('/var/website/command.txt') do
  its('content') { should match(/ran command/) }
end

describe file('/var/website/architect') do
  it { should exist }
end

describe file('/var/website/welcome.txt') do
  its('content') { should match(/Welcome to the BEST Chef learning EVER!!!/) }
end
