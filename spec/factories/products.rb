# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    reference { 'MyString' }
    name { 'MyString' }
    description { 'MyText' }
    price { 1 }
    actived { false }
    cannon { 1.5 }
    category { nil }
  end
end
