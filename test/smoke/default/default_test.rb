describe directory('/bin/nano') do
  it { should exist }
end

describe os[:family] do
  it { should eq 'debian' }
end
