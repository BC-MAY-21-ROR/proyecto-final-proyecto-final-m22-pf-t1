# frozen_string_literal: true

FactoryBot.define do
  factory :deduction do
    date { '2022-07-24 14:54:46' }
    amount { 1 }
    stylist { nil }
    description { 'MyText' }
    status { 'MyString' }
  end
end
