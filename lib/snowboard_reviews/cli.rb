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
    @boards = SnowboardReviews::Boards.male
    @boards.each.with_index(1) do |board, i|
      puts "#{i}. #{board.name} - #{board.price}"
    end

    input = gets.strip.downcase
    if input.to_i > 0
      puts @boards[input.to_i-1]
    elsif input == "exit"
      goodbye
    else
      male_boards
    end
  end

  def female_boards
    puts "Please select a Snowboard to review by entering the number associated with it."
    @boards = SnowboardReviews::Boards.female
    @boards.each.with_index(1) do |board, i|
      puts "#{i}. #{board.name} - #{board.price}"
    end

    input = gets.strip.downcase
    if input.to_i > 0
      puts @boards[input.to_i-1]
    elsif input == "exit"
      goodbye
    else
      female_boards
    end
  end


  def goodbye
    puts "Please check back later for new reviews on Snowboards!"
  end

end