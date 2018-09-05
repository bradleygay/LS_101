require 'open-uri'

def read_book(url_str)
  text = open(url_str).read
  arr = text.split(/\.|\?|\!/)
  arr.map! { |sentence| sentence.split.length }
  arr.max
end
