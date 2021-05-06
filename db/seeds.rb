require 'json'
require 'open-uri'

puts "Cleaning database..."

Person.destroy_all
Planet.destroy_all
Species.destroy_all
Starship.destroy_all

models = ["people", "starships", "planets", "species"]

models.each do |model|
  puts "...Fetching #{model}..."

  url = "https://swapi.dev/api/#{model}/"
  url_serialized = URI.open(url).read
  url_parsed = JSON.parse(url_serialized)

  url_parsed['count'].times do
    case model
    when "people"
      url_parsed['results'].each do |api_person|
        puts "Creating person..."
        person = Person.new(
          name: api_person['name'],
          birth_year: api_person['birth_year'],
          eye_color: api_person['eye_color'],
          gender: api_person['gender'],
          hair_color: api_person['hair_color'],
          height: api_person['height'],
          mass: api_person['mass'],
          skin_color: api_person['skin_color'],
          url: api_person['url']
        )
        person.save!
        puts "...all set! Person #{person.id} created!"
      end
    when "starships"
      url_parsed['results'].each do |api_starship|
        puts "Creating starship..."
        starship = Starship.new(
          name: api_starship['name'],
          model: api_starship['model'],
          starship_class: api_starship['starship_class'],
          manufacturer: api_starship['manufacturer'],
          cost_in_credits: api_starship['cost_in_credits'],
          length: api_starship['length'],
          crew: api_starship['crew'],
          passengers: api_starship['passengers'],
          max_atmosphering_speed: api_starship['max_atmosphering_speed'],
          hyperdrive_rating: api_starship['hyperdrive_rating'],
          MGLT: api_starship['MGLT'],
          cargo_capacity: api_starship['cargo_capacity'],
          consumables: api_starship['consumables'],
          url: api_starship['url']
        )
        starship.save!
        puts "...associating #{starship.name} with it's pilots..."
        pilots_url = api_starship['pilots']
        puts "...checking each pilot's URL..."
        pilots_url.each do |pilot_url|
          person = Person.find_by(url: pilot_url)
          StarshipPossession.create!(starship: starship, person: person)
          puts "...association between #{starship.name} and #{person.name} done!"
        end
        puts "All set! Starship #{starship.id} created and associated!"
      end
    when "planets"
      url_parsed['results'].each do |api_planet|
        puts "Creating planet..."
        planet = Planet.new(
          name: api_planet['name'],
          diameter: api_planet['diameter'],
          rotation_period: api_planet['rotation_period'],
          orbital_period: api_planet['orbital_period'],
          gravity: api_planet['gravity'],
          population: api_planet['population'],
          climate: api_planet['climate'],
          terrain: api_planet['terrain'],
          surface_water: api_planet['surface_water'],
          url: api_planet['url']
        )
        planet.save!
        puts "...associating #{planet.name} with it's residents..."
        residents_url = api_planet['residents']
        puts "...checking each residents' URL..."
        residents_url.each do |resident_url|
          person = Person.find_by(url: resident_url)
          PlanetPerson.create!(planet: planet, person: person)
          puts "...association between #{planet.name} and #{person.name} done!"
        end
      end
    when "species"
      url_parsed['results'].each do |api_species|
        puts "Creating species..."
        species = Species.new(
          name: api_species['name'],
          classification: api_species['classification'],
          designation: api_species['designation'],
          average_height: api_species['average_height'],
          average_lifespan: api_species['average_lifespan'],
          eye_colors: api_species['eye_colors'],
          hair_colors: api_species['hair_colors'],
          skin_colors: api_species['skin_colors'],
          language: api_species['language'],
          url: api_species['url']
        )
        species.save!
        puts "...associating #{species.name} with it's people..."
        people_url = api_species['people']
        puts "...checking each people's URL..."
        people_url.each do |people_url|
          person = Person.find_by(url: people_url)
          SpeciesPerson.create!(species: species, person: person)
          puts "...association between #{species.name} and #{person.name} done!"
        end
        puts "All set! Species #{species.id} created and associated!"
      end
    end
    puts "Changing page..."
    break if url_parsed["next"].nil?
    url = url_parsed["next"]
    url_serialized = URI.open(url).read
    url_parsed = JSON.parse(url_serialized)
  end
end

puts "...Models Done!"
