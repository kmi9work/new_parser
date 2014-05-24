#echo.msk.ru
puts "========================"
puts "echo.msk.ru:"

url = 'http://www.echo.msk.ru/news/'

doc = Nokogiri::HTML(open(url))

arr = doc.css('#mainWrap div.block1 dl.frame.newsList.newsInside dd ul li a.name').map{|i| "http://www.echo.msk.ru" + i.attr('href')}

key = "rca.1.1.20140325T124443Z.4617706c8eb8ca49.f55bbec26c11f882a82500daa69448a3e80dfef9"
contents = []
arr.each do |url|
	yandex_rich_url = "http://rca.yandex.com/?key=#{key}&url=#{url}&content=full"
	puts yandex_rich_url
	doc = open(yandex_rich_url).readlines.join
	rich_ret = JSON.parse(doc)
	contents << rich_ret["content"]
	puts rich_ret["title"]
	puts
	puts contents.last
	puts "---------------------------------------"
end