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

#   def self.scrape_reviews(snowboard_url)

#         html = Nokogiri::HTML(open(snowboard_url))

#     boards = {}

#         #html.css(".student-card").each do |board_model|
#           #cdname = board_model.css("h4").text
#           #boards[name] = {
#       boards[:onthesnowfeel] = html.css(".reviewfold p").text
#           #  :price => board_model.css("p").text
#           # })
#        # end
#     boards

#  end

end