class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
