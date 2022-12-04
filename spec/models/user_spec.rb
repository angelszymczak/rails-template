# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'factory creates a valid instance' do
    it { expect(create(:user)).to be_valid }
  end

  describe 'validations' do
    context 'with email presence' do
      it { is_expected.to validate_presence_of(:email) }

      it 'when NIL value' do
        expect { build(:user, email: nil).save! }
          .to (not_change { described_class.count })
          .and raise_error(ActiveRecord::RecordInvalid)
      end

      it 'when NIL value skipping validations' do
        expect { build(:user, email: nil).save!(validate: false) }
          .to (not_change { described_class.count })
          .and raise_error(ActiveRecord::NotNullViolation)
      end

      it 'when EMPTY value' do
        expect { build(:user, email: '').save! }
          .to (not_change { described_class.count })
          .and raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context 'with password presence' do
      it { is_expected.to validate_presence_of(:password) }

      it 'when NIL value' do
        expect { build(:user, password: nil).save! }
          .to (not_change { described_class.count })
          .and raise_error(ActiveRecord::RecordInvalid)
      end

      it 'when NIL value skipping validations' do
        expect { build(:user, password: nil).save!(validate: false) }
          .to (not_change { described_class.count })
          .and raise_error(ActiveRecord::NotNullViolation)
      end

      it 'when EMPTY value' do
        expect { build(:user, password: '').save! }
          .to (not_change { described_class.count })
          .and raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
