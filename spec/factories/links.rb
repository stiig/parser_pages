FactoryGirl.define do
  factory :link do
    url { Faker::Internet.url }
    page
  end
end
