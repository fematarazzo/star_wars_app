require "test_helper"
require 'json'
require 'open-uri'

class SpeciesTest < ActiveSupport::TestCase
  def setup
    @species = species(:valid)
  end

  test 'valid species' do
    assert @species.valid?
  end

  test 'invalid without name' do
    @species.name = nil
    refute @species.valid?, 'saved species without a name'
    assert_not_nil @species.errors[:name], 'no validation error for name present'
  end

  test 'invalid without average_lifespan' do
    @species.average_lifespan = nil
    refute @species.valid?
    assert_not_nil @species.errors[:average_lifespan]
  end

  test 'for name fetch using api' do
    url = 'https://swapi.dev/api/species/'
    species_serialized = URI.open(url).read
    species = JSON.parse(species_serialized)

    assert @species.name, species['results'].first['name']
  end
end
