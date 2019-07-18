# PHASE 2
def convert_to_int(str)
  Integer(str)
rescue ArgumentError
  "That's not a valid string!!"
  return nil
end

# PHASE 3
class FruitError < StandardError ; end

FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise FruitError
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
  puts "Feed me a fruit! (Enter the name of a fruit:)"

  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 
  rescue FruitError
    puts "That's not a fruit. If you know the secret, I'll let you try again"
    response = gets.chomp
    retry if response == 'coffee'.downcase
  end
end  

# PHASE 4
class YearsKnownError < StandardError ; end
class NoNameOrFavPastime < StandardError ; end

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    unless name.length > 0 && fav_pastime.length > 0
      raise "#{NoNameOrFavPastime} You're not a good friend if you don't know name or pastime."
    else
      @name = name
      @fav_pastime = fav_pastime
    end

    if yrs_known < 5
      raise "#{YearsKnownError} You're definitely not besties."
    else
      @yrs_known = yrs_known
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


if $Program_Name == __FILE__
  puts best_friend = BestFriend.new("Bob", 1, "Sleeping")
end