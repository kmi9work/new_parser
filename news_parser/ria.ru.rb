#ria.ru

url = 'http://ria.ru/lenta/'

doc = Nokogiri::HTML(open(url))
# 1. Скачиваем страницу.
# doc.css('div.lenta_list.rubric_content_tab .list .list_item').map{|i| p i.css('.list_item_title a').attr('href').value}

arr = doc.css('div.lenta div div.lenta_container div.lenta_list.rubric_content_tab div.list div div.list_item_content div.list_item_text h3 a')
.map{|i| "http://ria.ru" + i.attr('href')}

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