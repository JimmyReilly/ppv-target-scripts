# each input keyword should be in quotes on a new line
# cat input.txt | xargs ruby keyword_format2.rb >> output.txt

def replace_white_space keyword
	keywords = []
	keywords << keyword.gsub(' ', '+')
	keywords << keyword.gsub(' ', '-')

	keywords
end

ARGV.each do |keyword|

	keywords = replace_white_space keyword

	keywords.each do |word| 
		puts word
		#puts "/" + word
		#puts "q=" + word
		#puts "?q=" + word
	end
end