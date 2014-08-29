require 'spec_helper'

describe Contact, 'Validations' do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:zip) }
end

describe Contact, 'Associations' do
  it { should have_many(:phones) }
end
