if ENV['RACK_ENV'] == 'development'
  namespace :dev do
    desc "Seed data for development environment"
    task prime: "db:setup" do
      Contact.create!([{name: 'Jim',
                      address: '1234 Main St',
                      city: 'Anywhere', state:'CA', zip: '25418'},
                      {name: 'Jane',
                        address: '5628 L St',
                        city: 'Nowhere', state:'CA', zip: '65189'}])

      Phone.create!([{number: '555-555-5555', contact: Contact.find_by_name('Jim')},
                    {number: '555-555-1212', contact: Contact.find_by_name('Jane')}])
    end
  end
end
