FactoryBot.define do
  factory :comment do
    content "MyText"
    user
    movie
  end
end
