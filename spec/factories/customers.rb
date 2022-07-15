# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    dni { 'MyString' }
    full_name { 'MyString' }
    telephone { 'MyString' }
    birthday { 'MyString' }
    email { 'MyString' }
    business { nil }
  end
end
