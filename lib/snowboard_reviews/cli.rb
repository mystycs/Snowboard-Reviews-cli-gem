require 'colorize'

class SnowboardReviews::CLI
  def call
    puts 'Welcome to Snowboard Reviews'
    puts 'Please make the following choices below or type exit to exit the program.'
    puts "Please input Male or Female for board selection\n"
    list_boards
  end

  def list_boards
    input = gets.strip.downcase
    if input == 'male'
      male_boards
    elsif input == 'female'
      female_boards
    elsif input == 'exit'
      goodbye
    else
      puts 'Unrecognized Input. Please enter male or female'
      list_boards
    end
  end

  def male_boards
    index_url = 'http://thegoodride.com/ajax.php?sort=0&mens=1'

    boards_array = SnowboardReviews::Scraper.scrape_boards(index_url)
    SnowboardReviews::Boards.create(boards_array)

    SnowboardReviews::Boards.all.each.with_index(1) do |board, i|
      puts "#{i}. #{board.brand} - #{board.model} - $#{board.price}"
    end

    puts 'Please select a Snowboard to review by entering the number associated with it.'

    input = gets.strip.downcase
    if input.to_i > 0
      print_review(input) # notifies url for male or female
    elsif input == 'exit'
      goodbye
    end
  end

  def female_boards
    puts 'Please select a Snowboard to review by entering the number associated with it.'

    index_url = 'http://thegoodride.com/ajax.php?sort=0&womens=1'

    boards_array = SnowboardReviews::Scraper.scrape_boards(index_url)
    SnowboardReviews::Boards.create(boards_array)

    SnowboardReviews::Boards.all.each.with_index(1) do |board, i|
      puts "#{i}. #{board.brand} - #{board.model} - $#{board.price}"
    end

    puts 'Please select a Snowboard to review by entering the number associated with it.'

    input = gets.strip.downcase
    if input.to_i > 0
      print_review(input) # notifies url for male or female
    elsif input == 'exit'
      goodbye
    end
  end

  def print_review(input)
    brand, model, urlhelper, price = nil

    SnowboardReviews::Boards.all.each.with_index(1) do |board, i|
      if input.to_i == i
        brand = board.brand
        model = board.model
        price = board.price
        urlhelper = board.urlhelper
      end
    end

    snowboard_url = "http://thegoodride.com/snowboard-reviews/#{brand}-#{model}-#{urlhelper.tr(' ', '-')}/".downcase!.tr(' ', '-')

    attr = SnowboardReviews::Scraper.scrape_reviews(snowboard_url)

    puts "\nSnowboard: ".colorize(:red) + "#{brand} - #{model} - " + "($#{price})".colorize(:green)
    puts "\nReview URL: ".colorize(:red) + snowboard_url
    puts "\nDescription:".colorize(:red)
    puts attr[:description]
    if !attr[:onthesnowfeel].nil?
      puts "\nOn Snow Feel:".colorize(:red)
      puts attr[:onthesnowfeel]
    end
    if !attr[:powder].nil?
      puts "\nPowder:".colorize(:red)
      puts attr[:powder]
    end
    if !attr[:turninitiationandcarving].nil?
      puts "\nTurn Initiation and Carving:".colorize(:red)
      puts attr[:turninitiationandcarving]
    end
    if !attr[:speed].nil?
      puts "\nSpeed:".colorize(:red)
      puts attr[:speed]
    end
    if !attr[:flex].nil?
      puts "\nFlex:".colorize(:red)
      puts attr[:flex]
    end
    if !attr[:jumps].nil?
      puts "\nJumps:".colorize(:red)
      puts attr[:jumps]
    end
  end

  def goodbye
    puts 'Please check back later for new reviews on Snowboards!'
  end
end
