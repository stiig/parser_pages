FactoryGirl.define do
  factory :header do
    page
    header_type { Header.header_types.keys.sample }
    content { Faker::Lorem.sentence }
  end
end
