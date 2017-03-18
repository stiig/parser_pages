FactoryGirl.define do
  factory :page do
    url { Faker::Internet.url }
    factory :page_with_links_and_headers do
      state 1
      after(:create) do |page|
        create_list(:header, 10, page: page)
        create_list(:link, 10, page: page)
      end
    end
  end
end
