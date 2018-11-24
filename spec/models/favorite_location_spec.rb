require 'rails_helper'

describe FavoriteLocation do
  locations = ["denver,co", "golden,co"]
  subject { FavoriteLocation.new(locations) }

  it 'exists' do
    expect(subject).to be_a(FavoriteLocation)
  end
end
