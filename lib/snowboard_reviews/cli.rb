class SnowboardReviews::CLI

  def call
    puts "Welcome to Snowboard Reviews"
    list_boards
  end

  def list_boards
    puts "Please input Male or Female for board selection"
    input = gets.strip.downcase
    if input == "male"
      male_boards
    elsif input == "female"
      female_boards
    else
      list_boards
    end
  end

  def male_boards
    puts "Please select a Snowboard to review by entering the number associated with it."
    puts "1. - Academy Rythem"
    puts "2. - Academy Team"
    input = gets.strip.downcase
    if input == "1"
      puts "More info on 1"
    elsif input == "2"
      puts "More info on 2"
    end
  end

  def female_boards
    puts "Please select a Snowboard to review by entering the number associated with it."
    puts "1. - Hogwartz Rythem"
    puts "2. - Hogwartz Team"
    input = gets.strip.downcase
    if input == "1"
      puts "More info on 1"
    elsif input == "2"
      puts "More info on 2"
    end
  end
  
  def goodbye
    puts "Please check back later for new reviews on Snowboards!"
  end

end