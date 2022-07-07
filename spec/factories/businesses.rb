# frozen_string_literal: true

FactoryBot.define do
  factory :business do
    name { 'MyString' }
    nit { 'MyString' }
    owner { 'MyString' }
    country { 'MyString' }
    city { 'MyString' }
    telephone { 'MyString' }
    email { 'MyString' }
  end
end
