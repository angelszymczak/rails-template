# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'factory creates a valid instance' do
    it { expect(create(:user)).to be_valid }
  end
end
