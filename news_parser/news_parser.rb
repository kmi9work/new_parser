#encoding: utf-8
require 'cgi'
require 'open-uri'
require 'uri'
# require "selenium-webdriver"
require "#{File.dirname(__FILE__)}/smi.rb"

def open_url url, err_text = ""
	i = 0
	doc = nil
	while (i += 1 ) <= 2
		begin
			doc = open(url)
			break
		rescue Exception => e
			k = rand(10) + 5
			$stderr.puts "#{url} was not open. Sleep(#{k}). #{i}"
			$stderr.puts err_text
			# ОБРАБОТАТЬ ПРАВИЛЬНО ОШИБКИ
			sleep(k)
		end
	end
	return nil if i == 10
	return doc
end


@@key = "rca.1.1.20140325T124443Z.4617706c8eb8ca49.f55bbec26c11f882a82500daa69448a3e80dfef9"
# ria_smi = Smi.new("РИА Новости", 'http://ria.ru/lenta/', 
# 	'div.lenta div div.lenta_container div.lenta_list.rubric_content_tab div.list div div.list_item_content div.list_item_text h3 a', 
# 	'http://ria.ru')
# ria_smi.download!

# http://help.yandex.ru/search/query-language/crib-sheet.xml
queries = ['Карательный батальон & Донбасса /(-1 +4) засаду']

escaped = CGI.escape(queries[0])
unless (escaped == "%D0%9A%D0%B0%D1%80%D0%B0%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9+%D0%B1%D0%B0%D1%82%D0%B0%D0%BB%D1%8C%D0%BE%D0%BD+%26+%D0%94%D0%BE%D0%BD%D0%B1%D0%B0%D1%81%D1%81%D0%B0+%2F(-1+%2B4)+%D0%B7%D0%B0%D1%81%D0%B0%D0%B4%D1%83")
	puts escaped
	puts "%D0%9A%D0%B0%D1%80%D0%B0%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9+%D0%B1%D0%B0%D1%82%D0%B0%D0%BB%D1%8C%D0%BE%D0%BD+%26+%D0%94%D0%BE%D0%BD%D0%B1%D0%B0%D1%81%D1%81%D0%B0+%2F(-1+%2B4)+%D0%B7%D0%B0%D1%81%D0%B0%D0%B4%D1%83"
	# exit
end
# &how=tm -- По дате.
# @url = "http://yandex.ru/yandsearch?text=#{escaped}&numdoc=50&from_date_full=12.04.2014&to_date_full=23.05.2014&from_day=12&from_month=4&from_year=2014&to_day=23&to_month=5&to_year=2014&how=tm"
apikey = "03.221067681:17248ebd10d4013eab1585f73ddbec5f"
groupby = "attr%3Dd.mode%3Ddeep.groups-on-page%3D100.docs-in-group%3D3"
          
sortby = "tm.order%3Ddescending" 
@url = "http://xmlsearch.yandex.ru/xmlsearch?user=kmi9-ya&key=#{apikey}&query=#{escaped}&sortby=#{sortby}&filter=none&maxpassages=1&groupby=#{groupby}&l10n=ru"

puts @url
gets
f = File.open "qqq.txt", "w+"
# browser = Selenium::WebDriver.for :chrome
# browser.get "http://yandex.ru"
# browser.find_element(name: "text").send_keys(queries[0])
# browser.find_element(class: "b-form-button__input", type: "submit").click
# browser.get @url


# doc = Nokogiri::HTML(ff.readlines.join)
doc = Nokogiri::HTML(open(@url))

links = doc.css('yandexsearch response results group doc url').map{|i| i.content}
titles = doc.css('yandexsearch response results group doc title').map{|i| i.content}

f.puts doc
f.puts "+++++++++++++++++++++++++++++++++++"
# links = doc.css('div.b-body-items a.b-serp-item__title-link').map{|i| i.attr('href')}
puts links
exit

@contents = {}

links.each do |link|
	puts "Processing..." + link
	unless @contents.has_key?(link)
		yandex_rich_url = "http://rca.yandex.com/?key=#{@@key}&url=#{URI.escape(link)}&content=full"
		doc = open_url(yandex_rich_url, "Yandex: #{link}")
		if (doc)
			doc = doc.readlines.join	
			rich_ret = JSON.parse(doc)
			@contents[link] = [rich_ret["title"] ? CGI.unescapeHTML(rich_ret["title"]) : "", rich_ret["content"] ? CGI.unescapeHTML(rich_ret["content"]) : ""]
		end
	end
end

f.puts queries[0]
f.puts @url 
f.puts "-"*queries[0].size
str = ""
@contents.each do |key, value|
	str += key + "\n"
	str += value[0] + "\n"
	str += "\n"
	str += value[1] + "\n"
	str += "-"*key.size + "\n"
end
str += "=============================" + "\n"
f.puts str




