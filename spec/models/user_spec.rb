require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of   :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of   :password }
  end

  context 'relationships' do
    it {should have_many :favorites}
  end
end
