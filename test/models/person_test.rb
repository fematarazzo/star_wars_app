require "test_helper"
require 'json'
require 'open-uri'

class PersonTest < ActiveSupport::TestCase
  def setup
    @person = people(:valid)
  end

  test 'valid person' do
    assert @person.valid?
  end

  test 'invalid without name' do
    @person.name = nil
    refute @person.valid?, 'saved person without a name'
    assert_not_nil @person.errors[:name], 'no validation error for name present'
  end

  test 'invalid without homeworld' do
    @person.homeworld = nil
    refute @person.valid?
    assert_not_nil @person.errors[:homeworld]
  end

  test 'for name fetch using api' do
    url = 'https://swapi.dev/api/people/'
    people_serialized = URI.open(url).read
    people = JSON.parse(people_serialized)

    assert @person.name, people['results'].first['name']
  end
end
