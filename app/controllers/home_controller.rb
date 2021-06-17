require 'net/http'
require 'json'

class HomeController < ApplicationController
  def index
    session[:marks] = 0
    session[:times] = 0
  end

  def set
    if request.post?
      @max = params[:max]
      session[:max] = @max
      if params.include?(:docker)
        session[:combination] = 1
        url = 'https://quizapi.io/api/v1/questions?apiKey=A9ya16s39eH0hdu3BgxigMuxVa4zbjMaVjHxCOyt&limit=20&category=docker'
        uri = URI(url)
        response = Net::HTTP.get(uri)
        result = JSON.parse(response)
        File.write('./quiz.json', JSON.pretty_generate(result))
      elsif params.include?(:devops)
        session[:combination] = 2
        url = 'https://quizapi.io/api/v1/questions?apiKey=A9ya16s39eH0hdu3BgxigMuxVa4zbjMaVjHxCOyt&limit=20&category=devops'
        uri = URI(url)
        response = Net::HTTP.get(uri)
        result = JSON.parse(response)
        File.write('./quiz.json', JSON.pretty_generate(result))
      elsif params.include?(:linux)
        session[:combination] = 3
        url = 'https://quizapi.io/api/v1/questions?apiKey=A9ya16s39eH0hdu3BgxigMuxVa4zbjMaVjHxCOyt&limit=20&category=linux'
        uri = URI(url)
        response = Net::HTTP.get(uri)
        result = JSON.parse(response)
        File.write('./quiz.json', JSON.pretty_generate(result))
      elsif params.include?(:sql)
        session[:combination] = 4
        url = 'https://quizapi.io/api/v1/questions?apiKey=A9ya16s39eH0hdu3BgxigMuxVa4zbjMaVjHxCOyt&limit=20&category=sql'
        uri = URI(url)
        response = Net::HTTP.get(uri)
        result = JSON.parse(response)
        File.write('./quiz.json', JSON.pretty_generate(result))
      end
      redirect_to(quiz_get_path, :notice => session[:max])
    end  
  end 
end