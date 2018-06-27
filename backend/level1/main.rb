require 'json'
require 'date'

$file = File.read('data/input.json')
$data = JSON.parse($file)
final = { "rentals" => [] }
@rentals = $data["rentals"]

def day_difference(i)
  end_date = Date.parse($data["rentals"][i]["end_date"])
  start_date = Date.parse($data["rentals"][i]["start_date"])

  (end_date - start_date).to_i
end

def car_id(i)
  $data["rentals"][i]["car_id"]
end

def distance(i)
  $data["rentals"][i]["distance"]
end

def price_per_km_and_per_day(i)
  car = $data["cars"].find{ |car| car["id"] == car_id(i)  }
  price_per_km, price_per_day = car["price_per_km"], car["price_per_day"]
end

@rentals.each_with_index do |rental, i|
  ppkm = price_per_km_and_per_day(i)[0]
  ppd = price_per_km_and_per_day(i)[1]

  result = day_difference(i) * ppd + ppkm * distance(i)
  result_hash = { "id": rental["id"], "price": result }
  final["rentals"] << result_hash
  puts final
end

class ClassName

end
