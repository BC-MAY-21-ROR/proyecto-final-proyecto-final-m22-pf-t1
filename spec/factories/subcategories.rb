# frozen_string_literal: true

FactoryBot.define do
  factory :subcategory do
    name { 'MyString' }
    category { nil }
  end
end
