require 'json'
require 'date'

file = File.read('data/input.json')
data = JSON.parse(file)
final = { "rentals" => [] }
@rentals = data["rentals"]
@cars = data["cars"]

def day_difference(i)
  end_date = Date.parse(@rentals[i]["end_date"])
  start_date = Date.parse(@rentals[i]["start_date"])

  (end_date - start_date).to_i
end

def price_per_km_and_per_day(i)
  rented_car = @cars.find{ |car| car["id"] == @rentals[i]["car_id"]  }
  price_per_km, price_per_day = rented_car["price_per_km"], car["price_per_day"]
end

def calculate_price(i)
  ppkm = price_per_km_and_per_day(i)[0]
  ppd = price_per_km_and_per_day(i)[1]

  result = day_difference(i) * ppd + ppkm * @rentals[i]["distance"]
end

@rentals.each_with_index do |rental, i|
  result = { "id": rental["id"], "price": calculate_price(i) }
  final["rentals"] << result
  puts final
end
