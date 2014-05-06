require 'spec_helper_lite'
require 'group'

describe Group do
  it { should respond_to(:name) }
  it { should respond_to(:address) }
  it { should respond_to(:city) }
  it { should respond_to(:state) }
  it { should respond_to(:zip) }
  it { should respond_to(:email) }
  it { should respond_to(:phone) }
  it { should respond_to(:meeting_wday) }
end
