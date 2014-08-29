require 'spec_helper'

describe Phone, 'Validations' do
  it { should validate_presence_of(:number) }
end

describe Phone, 'Associations' do
  it { should belong_to(:contact) }
end
