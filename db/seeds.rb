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

puts "Starting to run more custom seeding, just a few more mins"

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
# p_img_url_one = URI.open("https://www.patagonia.com/dw/image/v2/BDJB_PRD/on/demandware.static/-/Sites-patagonia-master/default/dw3781c6b1/images/hi-res/84212_FGE_OM1.jpg?sw=1600&sh=1600&sfrm=png&q=80&bgcolor=f6f6f6")
# patagonia.photos.attach(io: p_img_url_one, filename: "#{patagonia.name}one.jpg", content_type: 'image/jpeg')
# p_img_url_two = URI.open("https://www.patagonia.com/dw/image/v2/BDJB_PRD/on/demandware.static/-/Sites-patagonia-master/default/dw54ad2462/images/hi-res/23074_DNAT_BH1.jpg?sw=1600&sh=1600&sfrm=png&q=80&bgcolor=f6f6f6")
# patagonia.photos.attach(io: p_img_url_two, filename: "#{patagonia.name}one.jpg", content_type: 'image/jpeg')
# patagonia.website_url = "https://www.patagonia.com/home/"
# patagonia.insta_url = "https://www.instagram.com/patagonia/?hl=en"
patagonia.address = "133 Portobello Rd London"
patagonia.save!

# TALA
tala = Brand.find_by_name("TALA")
t_img_url_one = URI.open("https://cdn.shopify.com/s/files/1/0081/8711/7664/products/Screenshot2021-11-22at21.22.08_1800x1800.png?v=1637616214")
tala.photos.attach(io: t_img_url_one, filename: "#{tala.name}one.jpg", content_type: 'image/jpeg')
t_img_url_two = URI.open("https://cdn.shopify.com/s/files/1/0081/8711/7664/products/Cosyjoggers_Cream_2_1800x1800.jpg?v=1623243921")
tala.photos.attach(io: t_img_url_two, filename: "#{tala.name}one.jpg", content_type: 'image/jpeg')
tala.address = "100 Wardour Street London"
tala.save!

# Ecoalf
ecoalf = Brand.find_by_name("Ecoalf")
e_img_url_one = URI.open("https://ecoalf.com/27142-thickbox_default/livorno-jacket-man.jpg")
ecoalf.photos.attach(io: e_img_url_one, filename: "#{ecoalf.name}one.jpg", content_type: 'image/jpeg')
e_img_url_two = URI.open("https://ecoalf.com/27115-thickbox_default/katman-jacket-man.jpg")
ecoalf.photos.attach(io: e_img_url_two, filename: "#{ecoalf.name}one.jpg", content_type: 'image/jpeg')
ecoalf.address = "12 Upper St Martin's Ln London"
ecoalf.save!

# WAWWA
wawwa = Brand.find_by_name("WAWWA")
w_img_url_one = URI.open("https://cdn.shopify.com/s/files/1/1377/2863/products/IMG_0955_1_750x_baaa56f5-5cd4-4494-a632-b9d89e4a8f1a_1080x.jpg?v=1638280967")
wawwa.photos.attach(io: w_img_url_one, filename: "#{wawwa.name}one.jpg", content_type: 'image/jpeg')
w_img_url_two = URI.open("https://cdn.shopify.com/s/files/1/1377/2863/products/SSXXIecom-28_a16a595b-b3fa-41c8-acde-d643030b34a3_1080x.jpg?v=1625836661")
wawwa.photos.attach(io: w_img_url_two, filename: "#{wawwa.name}one.jpg", content_type: 'image/jpeg')
wawwa.insta_url = "https://www.instagram.com/wawwaclothing/?hl=en"
wawwa.address = "Ladbroke grove London"
wawwa.save!

# Girlfriend Collective
gc = Brand.find_by_name("Girlfriend Collective")
gc_img_url_one = URI.open("https://cdn.shopify.com/s/files/1/0019/2217/0943/products/20210312_Girlfriend_FloatHats_L12_073.jpg?v=1617306664")
gc.photos.attach(io: gc_img_url_one, filename: "#{gc.name}one.jpg", content_type: 'image/jpeg')
gc_img_url_two = URI.open("https://cdn.shopify.com/s/files/1/0019/2217/0943/products/LuxeLegging_Navy_PDP1.jpg?v=1605558259")
gc.photos.attach(io: gc_img_url_two, filename: "#{gc.name}one.jpg", content_type: 'image/jpeg')
gc.save!

# Organic Basics
ob = Brand.find_by_name("Organic Basics")
ob_img_url_one = URI.open("https://cdn.shopify.com/s/files/1/0013/3470/6276/products/h0ibcsgosd40bnjdoxyp_9bb5315b-b275-4de2-ac21-f7cf34b50887_x1400.jpg?v=1625735533")
ob.photos.attach(io: ob_img_url_one, filename: "#{ob.name}one.jpg", content_type: 'image/jpeg')
ob_img_url_two = URI.open("https://cdn.shopify.com/s/files/1/0013/3470/6276/products/idkfaqy0kjnfwj8iykho_x1400.jpg?v=1631604085")
ob.photos.attach(io: ob_img_url_two, filename: "#{ob.name}one.jpg", content_type: 'image/jpeg')
ob.save!


# Adidas by Stella McCartney
addidas = Brand.find_by_name("Adidas by Stella McCartney")
addi_img_url_one = URI.open("https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/f43bacf4e1694534a3d7ad25010cebd5_9366/adidas_by_Stella_McCartney_Ultraboost_3D_Knit_Shoes_Black_GY4916_01_standard.jpg")
addidas.photos.attach(io: addi_img_url_one, filename: "#{addidas.name}one.jpg", content_type: 'image/jpeg')
addi_img_url_two = URI.open("https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/c14edc93b96940e58939ad41011beaea_9366/adidas_by_Stella_McCartney_Shiny_Training_Leggings_Silver_GU1581_21_model.jpg")
addidas.photos.attach(io: addi_img_url_two, filename: "#{addidas.name}one.jpg", content_type: 'image/jpeg')
addidas.save!

# Outerknown
outerknown = Brand.find_by_name("Outerknown")
out_img_url_one = URI.open("https://cdn.shopify.com/s/files/1/2445/4975/products/030A7767_kelly_stars_HD_275138c5-3e37-4baa-a54f-3b6c1e52eb19_1400x1400.jpg?v=1626476079")
outerknown.photos.attach(io: out_img_url_one, filename: "#{outerknown.name}one.jpg", content_type: 'image/jpeg')
out_img_url_two = URI.open("https://cdn.shopify.com/s/files/1/2445/4975/products/2260011_Gemini_Hoodie_ULG_1_590x712.jpg?v=1638164515")
outerknown.photos.attach(io: out_img_url_two, filename: "#{outerknown.name}one.jpg", content_type: 'image/jpeg')
outerknown.save!

# Jyoti - Fair Works
jyoti = Brand.find_by_name("Jyoti - Fair Works")
jy_img_url_one = URI.open("https://jyoti-fairworks.org/wp-content/uploads/2021/08/Jyoti-Fair-Works-Kollektion-Herbst-Winter-2021-2022-Moodfotos-Industrial-55.jpg")
jyoti.photos.attach(io: jy_img_url_one, filename: "#{jyoti.name}one.jpg", content_type: 'image/jpeg')
jy_img_url_two = URI.open("https://jyoti-fairworks.org/wp-content/uploads/2021/09/Jyoti-Fair-Works-FW-21-36.jpg")
jyoti.photos.attach(io: jy_img_url_two, filename: "#{jyoti.name}one.jpg", content_type: 'image/jpeg')
jyoti.save!

# Remove KnowledgeCotton Apparel
kcp = Brand.find_by_name("KnowledgeCotton Apparel")
kcp.destroy

# Swedish Stockings
swedish = Brand.find_by_name("Swedish Stockings")
swedish.address = "57 Golborne Rd London W10 5NR"
swedish.save!

# Sandqvist
sandqvist = Brand.find_by_name("Sandqvist")
sandqvist.address = "79 Berwick Street London"
sandqvist.save!

puts "Finitoed 🥳🥳🥳"
