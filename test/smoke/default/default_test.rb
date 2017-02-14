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
