require 'open-uri'
require 'nokogiri'

def rating_material_calc(materials_desc)
  case materials_desc
  when "Great"
    rating_materials = 5
  when "Good"
    rating_materials = 4
  when "It's a start"
    rating_materials = 3
  when "Not good enough"
    rating_materials = 2
  when "We avoid"
    rating_materials = 1
  else
    rating_materials = 0
  end
end

# CREATING BRAND INSTANCES BY SCRAPING FROM GOODONYOU => creates approx. 119 eco-brands

url = "https://directory.goodonyou.eco/"
html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('h1 a').each do |category|
  path = category.attribute('href').value
  url = "https://directory.goodonyou.eco#{path}"
  doc = Nokogiri::HTML(URI.open(url).read)

  brands = doc.search('.evVEkx a')

  brands.take(10).map do |brand|
    path = brand.attribute('href').value
    url = "https://directory.goodonyou.eco#{path}"
    doc = Nokogiri::HTML(URI.open(url).read)

    name = doc.search('h1').text.strip
    website_url = doc.search('a.sc-cSHVUG.eBknKp')[0].attribute('href').value

    rating_earth = doc.search('.ijKIAP')[0].text.strip[0].to_i
    rating_earth = 1 if rating_earth < 1

    rating_people = doc.search('.ijKIAP')[1].text.strip[0].to_i
    rating_people = 1 if rating_people < 1

    rating_animals = doc.search('.ijKIAP')[2].text.strip[0].to_i
    rating_animals = 1 if rating_animals < 1

    why_we_love_them = doc.search('h4').text.strip

    about = doc.search('p')[0].text.strip

    splash_image = doc.search('img')[0].attribute('src').value
    price_category = doc.search('.kkXGYR')[1].text.length - 8

    materials_desc = doc.search('.kkXGYR')[0].text.split(" ")[1]
    rating_materials = rating_material_calc(materials_desc)

    style = %w[modern outdoor minimalist retro boujie arty scandinavian grunge formal lounge boho].sample # test passed

    Brand.create(
      name: name,
      website_url: website_url,
      price_category: price_category,
      rating_earth: rating_earth,
      rating_people: rating_people,
      rating_animals: rating_animals,
      rating_materials: rating_materials,
      about: about,
      why_we_love_them: why_we_love_them,
      splash_image: splash_image,
      style: style,
      approved: true
    )
  end
end

puts "Number eco-brand:#{Brand.count}"






# For now only taking first para, what would be best way to take all paras and make it easy for us to format this
# para_one = doc.search('.igGybB p')[0].text.strip
# para_two = doc.search('.igGybB p')[1].text.strip
# para_three = doc.search('.igGybB p')[2].text.strip

# BRAND items needed
    # t.string "name" DONE :D
    # t.string "website_url" DONE
    # t.string "insta_url" MANUALLY ADD?????
    # t.integer "price_category" DONE
    # t.integer "rating_earth" DONE
    # t.integer "rating_people" DONE
    # t.integer "rating_animals" DONE
    # t.integer "rating_materials" DONE
    # t.text "about" DONE
    # t.text "why_we_love_them" DONE
    # t.string "address" USE FAKER????
    # t.string "splash_image" DONE
    # t.string "style" DONE

# IMPORTANT NOTES & TO DOS for BRANDS
# This seed is only getting eco-brands. How shall we get naughty ones? Scrape specific ones from goodonyou or manually create them?
# goodonyou locations are countries..this won't be very effective for map feature as really we need a pinpoint location. Use faker for UK addresses instead?
# MANUALLY add brands we want to be included for the demo - maybe, because we want them to be created_at a different time
# Get product images
# For demo we can manually edit style
