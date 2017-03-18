FactoryGirl.define do
  factory :link do
    content { Faker::Lorem.sentence }
    url { Faker::Internet.url }
    page
  end
end
