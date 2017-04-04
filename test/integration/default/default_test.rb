# # encoding: utf-8

# Inspec test for recipe chefkata::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# unless os.windows?
#   describe user('root') do
#     it { should exist }
#     skip 'This is an example test, replace with your own test.'
#   end
# end

# describe port(80) do
#   it { should_not be_listening }
#   skip 'This is an example test, replace with your own test.'
# end

describe package('nano') do
  it { should be_installed }
end

describe file('/var/website/builder.txt') do
  its('content') { should match /Test Kitchen built this/ }
end

describe file('/var/website/directions.txt') do
  its('content') { should match /website goes here/ }
end

describe file('/var/website/logo.jpg') do
  it { should exist }
end

describe file('/var/website/command.txt') do
  its('content') { should match /ran command/ }
end

describe file('/var/website/architect/README.md') do
  its('content') { should match /The Architect theme/ }
end
