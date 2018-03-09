require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper

   def self.scrape_index_page(index_url)
    html = open(index_url)
    list = Nokogiri::HTML(html)

  # Student Names
    student_names = list.css(".student-name")
    names_array = []
    student_names.each do |item|
      names_array << item.text
    end
    names_array

  # Student Locations 
    locations = list.css(".student-location")
    location_array = []
    locations.each do |item|
      location_array << item.text
    end
    location_array

    # HTML Pages
    webpages = list.css(".student-card a[href]")
    webpage_array = []
    webpages.select do |item|
      webpage_array << item['href']
    end
    webpage_array

    master_array = []
    hash = {}
    x = 0
    names_array.each do |name|
      master_array << {:name => name, :location => location_array[x], :profile_url => webpage_array[x]}
      x = x + 1
    end
    master_array
  end
end