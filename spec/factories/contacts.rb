# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    name "Rob Love"
    address "6173 Donner St."
    city "Somewhere"
    state "CA"
    zip "92001"
  end
  factory :contact_two, class: Contact do
    name "Jim Shore"
    address "1234 Main St."
    city "AnotherPlace"
    state "CA"
    zip "93001"
  end
end
