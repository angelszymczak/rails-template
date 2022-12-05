# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  password   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  # Allow lower/uppercase Latin letters A-Za-z.
  # Allow digits 0-9.
  # Allow underscore, middle hyphen, plus, and dots.
  LOCAL_SECTION = 'A-Za-z0-9+_.-'
  DOMAIN_SECTION = 'mail|email|sample'
  TLD_SECTION = 'com|org|net'

  EMAIL_PATTERN = /[#{LOCAL_SECTION}]+@(#{DOMAIN_SECTION})\.(#{TLD_SECTION})/

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: EMAIL_PATTERN, message: I18n.t('errors.messages.format') }

  validates :password, presence: true
end
