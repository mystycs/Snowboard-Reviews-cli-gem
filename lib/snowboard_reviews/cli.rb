class SnowboardReviews::CLI

  def call
    puts "Welcome to Snowboard Reviews"
    puts "Please make the following choices below or type exit to exit the program."
    list_boards
  end

  def list_boards
    puts "Please input Male or Female for board selection"
    input = gets.strip.downcase
    if input == "male"
      male_boards
    elsif input == "female"
      female_boards
    elsif input == "exit"
      goodbye
    else
      list_boards
    end
  end

  def male_boards
    puts "Please select a Snowboard to review by entering the number associated with it."

    index_url = 'http://thegoodride.com/ajax.php?sort=0&mens=1'

    boards_array = SnowboardReviews::Scraper.scrape_boards(index_url)
    SnowboardReviews::Boards.create(boards_array)

    SnowboardReviews::Boards.all.each.with_index(1) do |board, i|
      puts "#{i}. #{board.brand} - #{board.model} - $#{board.price}"
    end

    input = gets.strip.downcase
    if input.to_i > 0
      print_review(input) #notifies url for male or female
    elsif input == "exit"
      goodbye
    else
      male_boards
    end
  end



  def female_boards
    puts "Please select a Snowboard to review by entering the number associated with it."

    index_url = 'http://thegoodride.com/ajax.php?sort=0&womens=1'

    boards_array = SnowboardReviews::Scraper.scrape_boards(index_url)
    SnowboardReviews::Boards.create(boards_array)

    SnowboardReviews::Boards.all.each.with_index(1) do |board, i|
      puts "#{i}. #{board.brand} - #{board.model} - $#{board.price}"
    end

    input = gets.strip.downcase
    if input.to_i > 0
      print_review(input) #notifies url for male or female
    elsif input == "exit"
      goodbye
    else
      male_boards
    end
  end

  def print_review(input)

    brand, model, urlhelper = nil

      SnowboardReviews::Boards.all.each.with_index(1) do |board, i|
      if input.to_i == i
        brand = board.brand
        model = board.model
        urlhelper = board.urlhelper
      end
    end

    snowboard_url = "http://thegoodride.com/snowboard-reviews/#{brand}-#{model}-#{urlhelper.gsub(' ','-')}/"
    snowboard_url = snowboard_url.downcase!.gsub(' ','-') #some words in the json have spaces after brand
  
  puts snowboard_url

     #SnowboardReviews::Boards.all.each do |board|
#        attr = SnowboardReviews::Scraper.scrape_reviews(snowboard_url)
#       SnowboardReviews::Boards.add_board_attributes(attr)
   # end



  end


  def goodbye
    puts "Please check back later for new reviews on Snowboards!"
  end

end