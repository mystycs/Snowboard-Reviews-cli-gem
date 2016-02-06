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

  def self.scrape_reviews#(snowboard_url)
    #<a href="http://<%= $(location).attr('host') %>/snowboard-reviews/<%= ($.trim(this[0])+" "+$.trim(this[1])+" "+$.trim(this[2])).replace(/[.]/g," ").replace(/\s/g,'-').toLowerCase() %>">

#         index_url = 'http://thegoodride.com/snowboard-reviews/'
#         html = Nokogiri::HTML(open(index_url))
#         boards = {}
#         html.css(".student-card").each do |board_model|
#           cdname = board_model.css("h4").text
#           boards[name] = {
#           boards = {
#           :name => html.css("h4").text,
#           #binding.pry
#           :price => board_model.css("p").text
#            }
#         end
#         boards

  end

end