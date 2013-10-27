# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :advertise do
    name "MyString"
    description "MyText"
    contact_details "MyText"
    user_id 1
    category_id 1
  end
end
