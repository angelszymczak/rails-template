# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) do |n|
      Faker::Internet.email(
        name: "#{Faker::Internet.username(separators: %w[. - _])}+#{n}",
        domain: %w[sample.com email.com].sample,
      )
    end

    password { Faker::Internet.password }
  end
end
