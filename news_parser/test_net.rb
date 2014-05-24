#encoding: utf-8
require 'cgi'
require 'uri'
require 'unirest'


str = 'Карательный батальон & Донбасса /(-1 +4) засаду'

puts CGI.escape str
puts URI.encode str

# queries = ['Карательный батальон & Донбасса /(-1 +4) засаду']

# escaped = CGI.escape(queries[0])

# url = "http://yandex.ru/yandsearch"
# params = "text=#{escaped}&numdoc=50&from_date_full=12.04.2014&to_date_full=23.05.2014&from_day=12&from_month=4&from_year=2014&to_day=23&to_month=5&to_year=2014&how=tm"
# headers = {
#     'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
# 	'Accept-Encoding' => 'gzip,deflate,sdch',
# 	'Accept-Language' => 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4',
# 	'Connection' => 'keep-alive',
# 	'Cookie' => 'z=s:l:0xe5320bc:1400567283587; yandexuid=1495064431400308029; yandex_gid=213; fuid01=53798e4e6ad21659.CmdC5VPlTnqyjt9ruFXJagkW586-bFEjjBleohe98IN9gZGYhaS7FeesPK-YLCXuQdrf1qTiUBmZFydLwD-vUeVhP47T-1jgXX7qEFUq8QJMyEdY2n7AGDo0YapfGjNz; Session_id=3:1400738480.5.0.1400738480000:tnF1Pg:83.0|221067681.0.2|110599.870405.K9UvhCYsvnl-Pcx-PjRjntrdka0; L=UHAXUEJTdQNZW0dhAgdbR3l/cW9VCn59Ay8aWTQkUiUZB1ckWAE5P1x9TEExKxxVAyYUDWZhVG47NFUqLyI3VQ==.1400738480.10460.234908.5d77ecae1cdc66daa071ee414c697fd1; yandex_login=kmi9.ya; my=YzYBAScCAAEA; spravka=dD0xNDAwODI3MDUwO2k9NjIuMTE3LjExMy4xODI7dT0xNDAwODI3MDUwMzk3OTE0MjU4O2g9NTQzZDViMzc3ZjQwM2ZkNDFlYTUwYzUyZDUxZWNkNGM=; yabs-frequency=/4/8W000D7lVbC00000/hSznS0mPWShFSN086KS3DB1m01b7spEmS00P9yGKht006MUrpt5m_1YdziznSFmOlCCoi73y66V7Ch1m_1Xd/; yp=1717055713.sp.nd:50:prs:0:family:2#1403067196.ygu.1#4294967295.pns.0#1716098480.udn.a21pOS55YQ==#1400918041.nps.5086102541:close; ys=bar.chrome.1.4.686#wprid.1400834630162852-1163018577344879115631974-3-018',
# 	'Host' => 'yandex.ru',
# 	'Referer' => 'http://www.yandex.ru/',
# 	'User-Agent' => 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.137 Safari/537.36'
# }

# responce = Unirest.get(url, headers: headers, parameters: params)

# puts responce.body
=begin

http = Net::HTTP.new(uri.host, uri.port)
puts http.methods
exit
puts uri.path
headers = {
    'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
	'Accept-Encoding' => 'gzip,deflate,sdch',
	'Accept-Language' => 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4',
	'Connection' => 'keep-alive',
	'Cookie' => 'z=s:l:0xe5320bc:1400567283587; yandexuid=1495064431400308029; yandex_gid=213; fuid01=53798e4e6ad21659.CmdC5VPlTnqyjt9ruFXJagkW586-bFEjjBleohe98IN9gZGYhaS7FeesPK-YLCXuQdrf1qTiUBmZFydLwD-vUeVhP47T-1jgXX7qEFUq8QJMyEdY2n7AGDo0YapfGjNz; Session_id=3:1400738480.5.0.1400738480000:tnF1Pg:83.0|221067681.0.2|110599.870405.K9UvhCYsvnl-Pcx-PjRjntrdka0; L=UHAXUEJTdQNZW0dhAgdbR3l/cW9VCn59Ay8aWTQkUiUZB1ckWAE5P1x9TEExKxxVAyYUDWZhVG47NFUqLyI3VQ==.1400738480.10460.234908.5d77ecae1cdc66daa071ee414c697fd1; yandex_login=kmi9.ya; my=YzYBAScCAAEA; spravka=dD0xNDAwODI3MDUwO2k9NjIuMTE3LjExMy4xODI7dT0xNDAwODI3MDUwMzk3OTE0MjU4O2g9NTQzZDViMzc3ZjQwM2ZkNDFlYTUwYzUyZDUxZWNkNGM=; yabs-frequency=/4/8W000D7lVbC00000/hSznS0mPWShFSN086KS3DB1m01b7spEmS00P9yGKht006MUrpt5m_1YdziznSFmOlCCoi73y66V7Ch1m_1Xd/; yp=1717055713.sp.nd:50:prs:0:family:2#1403067196.ygu.1#4294967295.pns.0#1716098480.udn.a21pOS55YQ==#1400918041.nps.5086102541:close; ys=bar.chrome.1.4.686#wprid.1400834630162852-1163018577344879115631974-3-018',
	'Host' => 'yandex.ru',
	'Referer' => 'http://www.yandex.ru/',
	'User-Agent' => 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.137 Safari/537.36'
}
path = uri.path.empty? ? "/" : uri.path
# lr=213&msid=22878.12280.1400834621.16483&text=2345
#test to ensure that the request will be valid - first get the head
code = http.head(path, headers).code.to_i
if (code >= 200 && code < 300) then

    #the data is available...
    http.get(uri, headers) do |chunk|
        #provided the data is good, print it...
        print chunk unless chunk =~ />416.+Range/
    end
end
# Net::HTTP::get("yandex.ru", "/yandsearch?text=#{escaped}&numdoc=50&from_date_full=12.04.2014&to_date_full=23.05.2014&from_day=12&from_month=4&from_year=2014&to_day=23&to_month=5&to_year=2014&how=tm")
=end






