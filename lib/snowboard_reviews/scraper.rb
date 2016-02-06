require 'open-uri'
require 'nokogiri'
require 'json'

require_relative './boards.rb'

class SnowboardReviews::Scraper

  def self.scrape_boards(index_url)
    data = JSON.parse(open(index_url).read)
    boards = []

    data.each do |board|
      boards.push({
        :brand => board[0],
        :model => board[1],
        :urlhelper => board[2],
        :price => board[3],
        :id => board[4]
        })
    end

    boards
  end

  def self.scrape_reviews(snowboard_url)
    html = Nokogiri::HTML(open(snowboard_url))

    boards = {}
    boards[:description] = html.css(".reviewfold p").first.text.strip
    boards[:onthesnowfeel] = html.css(".reviewfold p").find { |e| e.text =~ /On Snow Feel/ }.text.gsub("On Snow Feel: ", "")
    boards[:powder] = html.css(".reviewfold p").find { |e| e.text =~ /Powder/ }.text.gsub("Powder: ", "")
    boards[:turninitiationandcarving] = html.css(".reviewfold p").find { |e| e.text =~ /Turn Initiation and Carving/ }.text.gsub("Turn Initiation and Carving: ", "")
    boards[:speed] = html.css(".reviewfold p").find { |e| e.text =~ /Speed/ }.text.gsub("Speed: ", "")
    boards[:flex] = html.css(".reviewfold p").find { |e| e.text =~ /Flex/ }.text.gsub("Flex: ", "")
    boards[:jumps] = html.css(".reviewfold p").find { |e| e.text =~ /Jumps/ }.text.gsub("Jumps: ", "")

    boards
 end

end