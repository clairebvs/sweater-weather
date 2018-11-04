require 'rails_helper'

describe GoogleGeocodeService do
  location = "Denver, CO"
  subject { GoogleGeocodeService.new(location) }

  it 'exists' do
    expect(subject).to be_a GoogleGeocodeService
  end

  context 'instance methods' do
    context '#coordinates' do
      it 'returns an array of hashes with coordinates data' do
        raw_coordinates = subject.coordinates
        raw_coordinate = raw_coordinates.first
        
        expect(raw_coordinate).to have_key :formatted_address
        expect(raw_coordinate).to have_key :geometry
      end
    end
  end
end
