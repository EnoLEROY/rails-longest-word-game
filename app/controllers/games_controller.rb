require 'open-uri'

class GamesController < ApplicationController
  def new
    @message = 'je suis dans games#new'

    letters = ('A'..'Z').to_a
    @random_letters = []
    10.times do
      @random_letters << letters.sample
    end

  end

  def score
    @message = 'je suis dans games#score'

    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    dictionary = JSON.parse(URI.open(url).read)

    is_an_english_word = dictionary["found"]
    @new_array = included_in?(params[:random_letters].split(' '), params[:word])
    raise
  end

  def included_in?(array, word)
    letters = word.upcase.split('')
    array.each_with_index do |letter, i|
      letters.include?(letter) ? '' : letter
    end
    
  end
end
