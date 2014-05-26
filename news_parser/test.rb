#encode: utf-8
require 'cgi'
require 'diff'
require 'uri'

str = 'Карательный батальон & Донбасса /(-1 +4) засаду'
str = "\"*&|+<>/-~!():."
right = "%D0%9A%D0%B0%D1%80%D0%B0%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9+%D0%B1%D0%B0%D1%82%D0%B0%D0%BB%D1%8C%D0%BE%D0%BD+%26+%D0%94%D0%BE%D0%BD%D0%B1%D0%B0%D1%81%D1%81%D0%B0+%2F(-1+%2B4)+%D0%B7%D0%B0%D1%81%D0%B0%D0%B4%D1%83"
right = '%22*%26%7C%2B%3C%3E%2F-~!()%3A.'
my = CGI.escape(str)
puts "Right: " + right
puts "   My: " + my

p right.diff(my)
