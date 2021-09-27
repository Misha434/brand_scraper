require 'uri'
require 'net/http'
require 'json'
require 'csv'

page_title = "List_of_mobile_phone_brands_by_country"
table_order = 0

uri = URI.parse("https://www.wikitable2json.com/api/#{page_title}?table=#{table_order}")

json = Net::HTTP.get(uri)
result = JSON.parse(json)

json_chunk_order = 0

brand_amount = result[json_chunk_order]["data"].size
order_brand_name_column = 2

brands = []

brand_amount.times do |array_order|
  brands << result[json_chunk_order]["data"][array_order][order_brand_name_column]
end

brands.map!{|x| x== "Brand" ? "name" : x }
brands.compact!

csv_string = CSV.generate do |csv|
  brands.each do |d|
    csv << [d]
  end
end

puts csv_string
