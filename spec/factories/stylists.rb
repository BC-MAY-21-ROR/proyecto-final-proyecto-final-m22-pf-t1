# frozen_string_literal: true

FactoryBot.define do
  factory :stylist do
    dni { 'MyString' }
    name { 'MyString' }
    role { 'MyString' }
    actived { false }
    business { nil }
  end
end
