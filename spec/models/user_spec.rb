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

    context 'with email uniqueness' do
      subject(:taken_user) { build(:user, email: 'taken@mail.com') }

      before { taken_user.save }

      it { is_expected.to validate_uniqueness_of(:email) }

      it 'when try DUPLICATED value' do
        expect { build(:user, email: taken_user.email).save! }
          .to (not_change { described_class.count })
          .and raise_error(ActiveRecord::RecordInvalid)
      end

      it 'when try DUPLICATED value skipping validations' do
        expect { build(:user, email: taken_user.email).save!(validate: false) }
          .to (not_change { described_class.count })
          .and raise_error(ActiveRecord::RecordNotUnique)
      end
    end

    context 'with email format' do
      it { is_expected.to allow_value('user@email.com').for(:email) }
      it { is_expected.not_to allow_value('user@not_allowed.com').for(:email) }

      it 'when not allowed format email value' do
        expect { build(:user, email: 'user@not_allowed.com').save! }
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

    context 'with password format' do
      {
        'at minimum length': 'abc123+',
        'at maximum length': 'abc-123-ABC-123-abc-123-ABC-123-34',
        'at least one lowercase letter': 'ABC1234+',
        'at least one uppercase letter': 'abc1234+',
        'at least one digit': 'abcDEF+!',
        'at least one special character': 'abcD1234',
        'avoid white space': '123 +abc',
      }.each do |rule_format, invalid_password|
        it "when not accomplish #{rule_format}" do
          expect { build(:user, password: invalid_password).save! }
            .to (not_change { described_class.count })
            .and raise_error(ActiveRecord::RecordInvalid)
        end
      end
    end
  end

  describe '.authenticate' do
    subject(:user) { create(:user) }

    it { expect(described_class.authenticate(user, user.password)).to eq(user) }
    it { expect(described_class.authenticate(user, 'wrong_pass')).to be_falsey }
  end
end
