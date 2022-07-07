# frozen_string_literal: true

FactoryBot.define do
  factory :catalog do
    reference { 'MyString' }
    name { 'MyString' }
    description { 'MyString' }
    price { 1 }
    actived { false }
  end
end
