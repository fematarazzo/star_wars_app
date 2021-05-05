require "test_helper"
require 'json'
require 'open-uri'

class StarshipTest < ActiveSupport::TestCase
  def setup
    @starship = starships(:valid)
  end

  test 'valid starship' do
    assert @starship.valid?
  end

  test 'invalid without name' do
    @starship.name = nil
    refute @starship.valid?, 'saved starship without a name'
    assert_not_nil @starship.errors[:name], 'no validation error for name present'
  end

  test 'invalid without passengers' do
    @starship.passengers = nil
    refute @starship.valid?
    assert_not_nil @starship.errors[:passengers]
  end

  test 'for name fetch using api' do
    url = 'https://swapi.dev/api/starships/'
    starships_serialized = URI.open(url).read
    starships = JSON.parse(starships_serialized)

    assert @starship.name, starships['results'].first['name']
  end
end
