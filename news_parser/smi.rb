#encoding: utf-8
require 'nokogiri'
require 'open-uri'
require 'uri'
require 'json'
require 'cgi'

#smi.rb

class Smi
	# attr_accessible :title, :url, :css_string, :new_url_prefix, :contents
	@@key = "rca.1.1.20140325T124443Z.4617706c8eb8ca49.f55bbec26c11f882a82500daa69448a3e80dfef9"
	def initialize (title, url, css_string, new_url_prefix = "")
		@title = title
		@url = url
		@css_string = css_string
		@new_url_prefix = new_url_prefix
		@contents = {}
	end
	def download!
		doc = Nokogiri::HTML(open_url(@url))
		
		links = doc.css(@css_string).map{|i| @new_url_prefix + i.attr('href')}
		
		links.each do |link|
			unless @contents.has_key?(link)
				yandex_rich_url = "http://rca.yandex.com/?key=#{@@key}&url=#{link}&content=full"
				puts yandex_rich_url
				doc = open_url(yandex_rich_url, "Yandex: #{link}").readlines.join	
				rich_ret = JSON.parse(doc)
				@contents[link] = [CGI.unescapeHTML(rich_ret["title"]), CGI.unescapeHTML(rich_ret["content"])]
			end
		end
	end
	def to_s
		str = @title + "\n"
		str += @url + "\n"
		str += "-"*@title.size + "\n"
		@contents.each do |key, value|
			str += key + "\n"
			str += value[0] + "\n"
			str += "\n"
			str += value[1] + "\n"
			str += "-"*key.size + "\n"
		end
		str += "=============================" + "\n"
		return str
	end

	def update! 
		doc = open_url(@url)
		links = doc.css(@css_string).map{|i| @new_url_prefix + i.attr('href')}
		fl = false
		links.each do |link|
			unless @contents.has_key?(link)
				yandex_rich_url = "http://rca.yandex.com/?key=#{@@key}&url=#{link}&content=full"
				puts yandex_rich_url
				doc = open_url(yandex_rich_url, "Yandex: #{link}").readlines.join	
				rich_ret = JSON.parse(doc)
				@contents[link] = [rich_ret["title"], rich_ret["content"]]
			else
				fl = true
				break
			end
		end
		unless (fl)
			#GO TO PAGES
		end
	end
	def save
	end
	# Example: Regnum1
	# prefix = "http://regnum.ru"
	# template = "/hotnews/?page%1"
	# first = 1
	# last = 675
	# step = 1
	# Можно проходить по всем страницам и закачивать только то, что ещё не скачано. КАЖДЫЙ РАЗ?!
	def add_pages_numeral_url (prefix, template, first, last, step)

	end

private
	def open_url url, err_text = ""
		i = 0
		doc = nil
		while i += 1
			begin
				doc = open(url)
				break
			rescue Exception => e
				$stderr.puts "#{url} was not open. Sleep(10). #{i}"
				$stderr.puts err_text
				# ОБРАБОТАТЬ ПРАВИЛЬНО ОШИБКИ
				sleep(10)
				next	
			end
		end
		return doc
	end


end