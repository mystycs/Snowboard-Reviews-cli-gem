require 'open-uri'
require 'nokogiri'
require 'json'

require_relative './boards.rb'

class SnowboardReviews::Scraper
  def self.scrape_boards(index_url)
    data = JSON.parse(open(index_url).read)
    boards = []

    data.each do |board|
      boards.push(brand: board[0],
                  model: board[1],
                  urlhelper: board[2],
                  price: board[3],
                  id: board[4])
    end

    boards
  end

  def self.scrape_reviews(snowboard_url)
    html = Nokogiri::HTML(open(snowboard_url))

    boards = {}
    boards[:description] = html.css('.reviewfold p').first.text.strip
    if html.css('.reviewfold p').find { |e| e.text =~ /On Snow Feel/ }
      boards[:onthesnowfeel] = html.css('.reviewfold p').find { |e| e.text =~ /On Snow Feel/ }.text.gsub('On Snow Feel:', '')
    else
       boards[:onthesnowfeel] = []
    end
    if html.css('.reviewfold p').find { |e| e.text =~ /Powder/ }
      boards[:powder] = html.css('.reviewfold p').find { |e| e.text =~ /Powder/ }.text.gsub('Powder:', '')
    else
      boards[:powder] = []
    end
    if html.css('.reviewfold p').find { |e| e.text =~ /Turn Initiation and Carving/ }
      boards[:turninitiationandcarving] = html.css('.reviewfold p').find { |e| e.text =~ /Turn Initiation and Carving/ }.text.gsub('Turn Initiation and Carving:', '')
    else
      boards[:turninitiationandcarving] = []
    end
    if html.css('.reviewfold p').find { |e| e.text =~ /Speed/ }
      boards[:speed] = html.css('.reviewfold p').find { |e| e.text =~ /Speed/ }.text.gsub('Speed:', '')
    else
      boards[:speed] = []
    end
    if html.css('.reviewfold p').find { |e| e.text =~ /Flex/ }
      boards[:flex] = html.css('.reviewfold p').find { |e| e.text =~ /Flex/ }.text.gsub('Flex:', '')
    else
      boards[:flex] = []
    end
    if html.css('.reviewfold p').find { |e| e.text =~ /Jumps/ }
      boards[:jumps] = html.css('.reviewfold p').find { |e| e.text =~ /Jumps/ }.text.gsub('Jumps:', '')
    else
      boards[:jumps] = []
    end

    boards
 end
end
