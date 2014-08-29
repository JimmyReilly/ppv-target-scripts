require 'mechanize'

def remove_paramters link
	link = link.split('?')[0] if link.include? "?"
	link
end

def get_domain site
	site = remove_protocol site
	site = remove_paramters site
	site = site.split('/')[0]
	site
end

def remove_protocol link
	link = link.split('//')[1] if link.include? "//"
	link
end

def remove_www link
	link = link.split('ww.')[1] if link.include? "www"
	link
end

query_url = "http://bing.com/search?q=" + ARGV[0].gsub(' ', '+')

mech = Mechanize.new
page = mech.get(query_url)
urls = []

page.search("li.b_algo h2 a").each do |list_item|
	urls << list_item['href']
end 

while page.link_with(:class => "sb_pagN")
	page = page.link_with(:class => "sb_pagN").click

	page.search("li.b_algo h2 a").each do |list_item|
		urls << list_item['href']
	end
end

urls.map! do |link|
	link = remove_protocol link
	link = remove_www link
end

urls << urls.map { |url| get_domain url }.flatten if ARGV[1] == "1"

urls.uniq!

urls.each { |url| puts url }