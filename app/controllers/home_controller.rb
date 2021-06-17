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

  def set
    if params.include?(:max)
      @max = params[:max]
      session[:max] = @max
      redirect_to(quiz_get_path, :notice => session[:max])
    end  
  end 
end
