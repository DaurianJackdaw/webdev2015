# Homework 3 of Web Development Class 
# at The Affiliated High School of Peking University
# by Yuci Zhou

# For the Prompt:
# fetch 10 random Wikipedia Page and analyze their words frequency
# then print the first 100 most-frequent words
# and their frequency


require "net/http"
require "nokogiri"

# Fetch target URL
def redirect(url)
	return Net::HTTP.get_response(URI.parse(url))["location"]
end

def open(url)
	host = url[/(?<=http:\/\/)[^\/]+/]
	path = url.sub("http://", "").sub(host, "")
	return Nokogiri::HTML(Net::HTTP.get(host, path))
end

def page_process(contents)
	contents.css("script, style").each {|node| node.remove}
	words = contents.text.split("\s")
	words.each do |word|
		word.sub!(/\W+$/, "")
	end
	words.delete_if {|empty| empty == ""}
end

# Input
random_url = "http://en.wikipedia.org/wiki/Special:Random/"
page_count = 10
webpage = []

for count in 1..page_count
	target_url = redirect(random_url)
	webpage.concat(page_process(open(target_url)))
end


h = Hash.new(0)
webpage.each do |word|
	h[word] += 1
end
p h.to_a.sort{|a, b| b[1] <=> a[1]}.slice(0,100).to_h
