class Contact < ActiveRecord::Base
  validates_presence_of :name, :address, :city,
    :state, :zip

  has_many :phones
end
