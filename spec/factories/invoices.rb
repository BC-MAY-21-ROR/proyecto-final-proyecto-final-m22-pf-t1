# frozen_string_literal: true

FactoryBot.define do
  factory :invoice do
    date { '2022-07-14 18:55:36' }
    customer { nil }
    amount { 1 }
  end
end
