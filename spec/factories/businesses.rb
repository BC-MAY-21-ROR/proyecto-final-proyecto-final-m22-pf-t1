# frozen_string_literal: true

FactoryBot.define do
  factory :business do
    name { 'MyString' }
    nit { 'MyString' }
    country { 'MyString' }
    city { 'MyString' }
    telephone { 'MyString' }
    email { 'MyString' }
    user { nil }
  end
end
