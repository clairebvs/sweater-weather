require 'rails_helper'

describe GoogleGeocodeService do
  location = "Denver, CO"
  subject { GoogleGeocodeService.new(location) }

  it 'exists' do
    expect(subject).to be_a GoogleGeocodeService
  end

  context 'instance methods' do
    context '#coordinates' do
      it 'returns a hash with coordinates data' do
        raw_coordinates = subject.coordinates

        expect(raw_coordinates).to have_key :lat
        expect(raw_coordinates).to have_key :lng
      end
    end
  end
end
