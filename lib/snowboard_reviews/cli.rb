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
      print_review(index_url) #notifies url for male or female
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

    SnowboardReviews::Boards.all.each do |board|
      attr = SnowboardReviews::Scraper.scrape_reviews(index_url)
      board.add_board_attributes(attr)
    end

  end


  def goodbye
    puts "Please check back later for new reviews on Snowboards!"
  end

end