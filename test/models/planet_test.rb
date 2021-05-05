require "test_helper"
require 'json'
require 'open-uri'

class PlanetTest < ActiveSupport::TestCase
  def setup
    @planet = planets(:valid)
  end

  test 'valid planet' do
    assert @planet.valid?
  end

  test 'invalid without name' do
    @planet.name = nil
    refute @planet.valid?, 'saved planet without a name'
    assert_not_nil @planet.errors[:name], 'no validation error for name present'
  end

  test 'invalid without rotation_period' do
    @planet.rotation_period = nil
    refute @planet.valid?
    assert_not_nil @planet.errors[:rotation_period]
  end

  test 'for name fetch using api' do
    url = 'https://swapi.dev/api/planets/'
    planets_serialized = URI.open(url).read
    planets = JSON.parse(planets_serialized)

    assert @planet.name, planets['results'].first['name']
  end
end
