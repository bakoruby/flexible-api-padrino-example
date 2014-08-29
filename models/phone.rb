class Phone < ActiveRecord::Base
  validates_presence_of :number

  belongs_to :contact

end
