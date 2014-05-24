#d3.ru

puts "========================"
puts "DIRTY:"

url = 'http://d3.ru/popular'

doc = Nokogiri::HTML(open(url))

arr = doc.css('.post  div.dt h3 a').map{|i| i.attr('href')}

key = "rca.1.1.20140325T124443Z.4617706c8eb8ca49.f55bbec26c11f882a82500daa69448a3e80dfef9"
contents = []
arr.each do |url|
	yandex_rich_url = "http://rca.yandex.com/?key=#{key}&url=#{url}&content=full"
	puts yandex_rich_url
	doc = open(yandex_rich_url).readlines.join
	contents << JSON.parse(doc)["content"]
	puts contents.last
	puts "---------------------------------------"
end