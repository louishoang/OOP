require 'pry'

word_bank = File.read("words.txt")

hidden_word = word_bank.split(", ").sample.downcase

class Game
  attr_accessor :spaces, :chances_remaining, :input, :occurence

  def initialize(hidden_word, chances_remaining)
    @hidden_word = hidden_word
    @chances_remaining = chances_remaining
    @spaces =  "_" * hidden_word.size
    @chosen_array = []
  end

  def welcome
    puts "WELCOME TO HANGMAN!\n\n"
  end

  def game_engine

    while @chances_remaining != 0
      chosen_letter
      print "Chances remaining: #{@chances_remaining}.\n\n"
      show_board
      prompt
      check_guess
      # if whole word check and exit
      # if letter check for letter , minus chances if wrong
    end
    puts "\n++++++++++++++++++++++++++++\n"
    puts "You are out of chances. Better luck next time."
    puts "HIDDEN WORD IS: #{@hidden_word}."
    puts "++++++++++++++++++++++++++++\n"
    gone
  end

  def prompt
    print "Guess a single letter (a-z) or the entire word: "
    @input = gets.chomp.downcase
    puts
  end

  def show_board
    print "Word: "
    print @spaces
    puts "\t\t#{@hidden_word.size} character(s)"
  end

  def check_guess
    if @input.size > 1
      # call method to check for whole word
      # win if guess right
      # lose if guess wrong
      guess_hidden
    else
      err
      # call method to check for letter
      # minus chances if wrong
      guess_letter
      all_letter_guessed
    end
  end

  def guess_hidden
    if @input == @hidden_word
      puts "\n++++++++++++++++++++++++++++\n"
      puts "Congratulations, you've guessed the word!"
      puts "++++++++++++++++++++++++++++\n"
      gone
    else
      puts "\n++++++++++++++++++++++++++++\n"
      puts "You guessed it wrong, better luck next times!"
      puts "++++++++++++++++++++++++++++\n"
      gone
    end
    exit 0
  end

  def guess_letter
    ## if letter is include in hidden_word then reveal it
    #in spaces
    ## else minus chance -1
    if @hidden_word.include?(@input)

      puts "Found #{occurence} occurrence(s) of the character '#{@input}'.\n\n"
      # There is .. occurence
      reveal
    else
      puts "Sorry, no #{@input}'s found.\n\n"
      @chances_remaining -= 1
    end
  end

  def all_letter_guessed
    if @spaces == @hidden_word
      puts "\n++++++++++++++++++++++++++++\n"
      puts "Congratulations. You got it!\n"
      puts "#{@hidden_word}"
      puts "++++++++++++++++++++++++++++\n"
      gone
      exit 1
    end
  end

  def reveal
    for i in (0..@hidden_word.size - 1)
      if @hidden_word[i] == @input
        @spaces[i] = @input
      end
    end
  end

  def occurence
    times = 0
    arr_of_letter = @hidden_word.split("")
    arr_of_letter.each do |letter|
      if letter == @input
        times += 1
      end
    end
    @occurence = times
  end

  def chosen_letter
    @chosen_array << @input
    puts "Chosen letter: #{(@chosen_array).join(",")}"
  end

  def err
    while @chosen_array.include?(@input)
      puts "\n++++++++++++++++++++++++++++\n"
      puts "Letter is used. Try a different one."
      puts "++++++++++++++++++++++++++++\n"
      prompt
    end
  end

  def gone
    puts "-----+--"
    puts "|    |"
    puts "|    O"
    puts "|  -[ ]-"
    puts "|   / !"
    puts "|"
    puts "========="
    puts "You are hanged no matter what :-) "
  end
end

hang = Game.new(hidden_word, 8)
hang.welcome
hang.game_engine
