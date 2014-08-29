def replace_white_space keyword
	keywords = []
	keywords << keyword.gsub(' ', '+')
	keywords << keyword.gsub(' ', '-')
	keywords << keyword.gsub(' ', '_')
	keywords << keyword.gsub(' ', '%20')
	keywords << keyword.gsub(' ', '')

	keywords
end

ARGV.each do |keyword|

	keywords = replace_white_space keyword

	keywords.each do |word| 
		puts word
		puts "/" + word
		puts "//" + word
		puts "=" + word
		puts "q=" + word
		puts "?q=" + word
		puts "search?=" + word
		puts "field-keywords=" + word
		puts "keywords=" + word
		puts "results?search_query=" + word
		puts "?search_query=" + word
		puts "search_query=" + word
		puts "?p=" + word
		puts "p=" + word
		puts "?query=" + word
		puts "query=" + word
		puts "s=" + word
		puts "?s=" + word
		puts word + ".php"
		puts word + ".html"
		puts word + ".shtml"
		puts word + ".asp"
		puts word + ".aspx"
	end
end