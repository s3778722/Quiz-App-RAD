require 'net/http'
require 'json'

class HomeController < ApplicationController
  def index
    session[:marks] = 0
    session[:times] = 0
    url = 'https://quizapi.io/api/v1/questions?apiKey=A9ya16s39eH0hdu3BgxigMuxVa4zbjMaVjHxCOyt&limit=10'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    result = JSON.parse(response)
    File.write('./quiz.json', JSON.pretty_generate(result))
  end
end
