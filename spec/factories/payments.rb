# frozen_string_literal: true

FactoryBot.define do
  factory :payment do
    date { '2022-07-14 18:43:26' }
    invoice { nil }
    value { 'MyString' }
    type { '' }
    note { 'MyString' }
  end
end
