require 'open-uri'
require 'nokogiri'

# puts "Seed is starting, time to relax for some minutes ☕️🍪"

# # Destroy all data
# NewsArticle.destroy_all
# Brand.destroy_all

# def rating_material_calc(materials_desc)
#   case materials_desc
#   when "Great"
#     rating_materials = 5
#   when "Good"
#     rating_materials = 4
#   when "It's a start"
#     rating_materials = 3
#   when "Not good enough"
#     rating_materials = 2
#   when "We avoid"
#     rating_materials = 1
#   else
#     rating_materials = 1
#   end
# end

# def seed_brand(url)
#   doc = Nokogiri::HTML(URI.open(url).read)

#   name = doc.search('h1').text.strip
#   website_url = doc.search('a.sc-cSHVUG.eBknKp')[0].attribute('href').value

#   rating_earth = doc.search('.ijKIAP')[0].text.strip[0].to_i
#   rating_earth = 1 if rating_earth < 1

#   rating_people = doc.search('.ijKIAP')[1].text.strip[0].to_i
#   rating_people = 1 if rating_people < 1

#   rating_animals = doc.search('.ijKIAP')[2].text.strip[0].to_i
#   rating_animals = 1 if rating_animals < 1

#   why_we_love_them = doc.search('h4').text.strip

#   about = doc.search('p')[0].text.strip

#   splash_image = doc.search('img')[0].attribute('src').value
#   price_category = doc.search('.kkXGYR')[1].text.length - 8

#   materials_desc = doc.search('.kkXGYR')[0].text.split(" ")[1]
#   rating_materials = rating_material_calc(materials_desc)

#   style = %w[modern outdoor minimalist retro boujie arty scandinavian grunge formal lounge boho].sample

#   Brand.create(
#     name: name,
#     website_url: website_url,
#     insta_url: "https://www.instagram.com/ecologieoffical/?hl=en-gb",
#     price_category: price_category,
#     rating_earth: rating_earth,
#     rating_people: rating_people,
#     rating_animals: rating_animals,
#     rating_materials: rating_materials,
#     about: about,
#     why_we_love_them: why_we_love_them,
#     splash_image: splash_image,
#     style: style,
#     approved: true,
#     address: Faker::Address.unique.full_address
#   )
# end

# # CREATING RANDOM ECO-BRANDS BY SCRAPING GOODONYOU => creates 120 random eco-brands

# url = "https://directory.goodonyou.eco/"
# html_file = URI.open(url).read
# html_doc = Nokogiri::HTML(html_file)

# html_doc.search('h1 a').each do |category|
#   path = category.attribute('href').value
#   url = "https://directory.goodonyou.eco#{path}"
#   doc = Nokogiri::HTML(URI.open(url).read)

#   brands = doc.search('.evVEkx a')

#   brands.take(10).map do |brand|
#     path = brand.attribute('href').value
#     url = "https://directory.goodonyou.eco#{path}"
#     seed_brand(url)
#   end
# end

# # CREATING SPECIFIC BRANDS (eco & naughty) BY SCRAPING GOODONYOU => creates 9 eco-brands
# # You can specify more brands by adding to the array below :) (just make sure it matches the url path from goodonyou.eco)

# specified_brands = ["zara", "h-and-m", "shein", "prettylittlething", "mango", "boohoo", "forever-21", "victorias-secret", "wawwa", "tala", "ecoalf"]

# specified_brands.each do |path|
#   url = "https://directory.goodonyou.eco/brand/#{path}"
#   seed_brand(url)
# end

# # CREATING NEWS ARTICLES BY SCRAPING FASHIONUNITED.UK => creates articles

# url = "https://fashionunited.uk/tags/sustainable-fashion"
# html_file = URI.open(url).read
# html_doc = Nokogiri::HTML(html_file)

# def create_article(title, url_path, blurb, image_path, date)
#   NewsArticle.create(
#     title: title,
#     url: "https://fashionunited.ukg#{url_path}",
#     blurb: blurb,
#     image: "https://fashionunited.uk#{image_path}",
#     date: date
#   )
# end

# cards = html_doc.search('.MuiGrid-grid-lg-3')

# cards.each do |card|
#   title = card.search('h2').text.strip
#   url_path = card.search('a').attribute('href').value
#   blurb = card.search('p')[0].text.strip[0, 200]
#   date = card.search('p')[1].text.strip
#   image_path = card.search('progressive-img').attribute('src').value

#   article = create_article(title, url_path, blurb, image_path, date)
# end

# # ATTACH PHOTOS (fashion product images) TO EACH BRAND

# brands = Brand.all

# brands.each do |brand|
#   # next if [].includes?(brand.name) ADD chosen brands to skipp attachements in the array

#   counter = 0
#   2.times do # Change to 3 or 4!
#     image_url = URI.open("https://source.unsplash.com/600x600/?fashion")
#     brand.photos.attach(io: image_url, filename: "#{brand.name}#{counter}.jpg", content_type: 'image/jpeg')
#     counter += 1
#     brand.save!
#   end
# end

# puts "Finished creating #{Brand.count} brands (with images) and #{NewsArticle.count} articles 🥳🥳🥳"

puts "Starting to run more custom seeding "

# # REMOVE ATTACHED PHOTOS FROM SPECIFIED BRANDS
# brands_to_edit_images = ["Patagonia", "TALA", "Ecoalf", "WAWWA", "Girlfriend Collective", "Organic Basics", "Adidas by Stella McCartney", "Outerknown", "Jyoti - Fair Works"]

# brands_to_edit_images.each do |name|
#   brand = Brand.find_by_name(name)
#   brand.photos.last.destroy
#   brand.photos.last.destroy
# end

# ADD CUSTOM IMAGES TO SPECIFIED BRANDS

# Patagonia
patagonia = Brand.find_by_name("Patagonia")
p_img_url_one = URI.open("https://www.patagonia.com/dw/image/v2/BDJB_PRD/on/demandware.static/-/Sites-patagonia-master/default/dw3781c6b1/images/hi-res/84212_FGE_OM1.jpg?sw=1600&sh=1600&sfrm=png&q=80&bgcolor=f6f6f6")
patagonia.photos.attach(io: p_img_url_one, filename: "#{patagonia.name}one.jpg", content_type: 'image/jpeg')
p_img_url_two = URI.open("https://www.patagonia.com/dw/image/v2/BDJB_PRD/on/demandware.static/-/Sites-patagonia-master/default/dw54ad2462/images/hi-res/23074_DNAT_BH1.jpg?sw=1600&sh=1600&sfrm=png&q=80&bgcolor=f6f6f6")
patagonia.photos.attach(io: p_img_url_two, filename: "#{patagonia.name}one.jpg", content_type: 'image/jpeg')
patagonia.website_url = "https://www.patagonia.com/home/"
patagonia.insta_url = "https://www.instagram.com/patagonia/?hl=en"
patagonia.save!

# # Patagonia
# patagonia = Brand.find_by_name("Patagonia")
# p_img_url_one = URI.open("")
# patagonia.photos.attach(io: p_img_url_one, filename: "#{patagonia.name}one.jpg", content_type: 'image/jpeg')
# p_img_url_two = URI.open("")
# patagonia.photos.attach(io: p_img_url_two, filename: "#{patagonia.name}one.jpg", content_type: 'image/jpeg')
# patagonia.save!

puts "finitoed"
