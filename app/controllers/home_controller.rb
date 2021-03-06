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
      count = 0
      categories = Array.new()
      difficulty = nil

      session[:docker] = false
      session[:devops] = false
      session[:linux] = false
      session[:sql] = false
      session[:difficulty] = false

      if params.include?(:docker)
        count += 1
        categories << "docker"
        session[:docker] = true
      end
      if params.include?(:devops)
        count += 1
        categories << "devops"
        session[:devops] = true
      end
      if params.include?(:linux)
        count += 1
        categories << "linux"
        session[:linux] = true
      end
      if params.include?(:sql)
        count += 1 
        categories << "sql"
        session[:sql] = true
      end
      if params.include?(:flexRadioDefault)
        difficulty = params[:flexRadioDefault]
        session[:difficulty] = difficulty
      end

      if count == 1
        url = "https://quizapi.io/api/v1/questions?apiKey=A9ya16s39eH0hdu3BgxigMuxVa4zbjMaVjHxCOyt&limit=10&category=#{categories[0]}&difficulty=#{difficulty}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        result = JSON.parse(response)
        result.shuffle!
        File.write('./quiz.json', JSON.pretty_generate(result))
      elsif count == 2
        url = "https://quizapi.io/api/v1/questions?apiKey=A9ya16s39eH0hdu3BgxigMuxVa4zbjMaVjHxCOyt&limit=10&category=#{categories[0]}&difficulty=#{difficulty}"
        url2 = "https://quizapi.io/api/v1/questions?apiKey=A9ya16s39eH0hdu3BgxigMuxVa4zbjMaVjHxCOyt&limit=10&category=#{categories[1]}&difficulty=#{difficulty}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        uri2 = URI(url2)
        response2 = Net::HTTP.get(uri2)
        result = JSON.parse(response)
        result2 = JSON.parse(response2)
        result.concat(result2)
        result.shuffle!
        File.write('./quiz.json', JSON.pretty_generate(result))
      elsif count == 3
        url = "https://quizapi.io/api/v1/questions?apiKey=A9ya16s39eH0hdu3BgxigMuxVa4zbjMaVjHxCOyt&limit=10&category=#{categories[0]}&difficulty=#{difficulty}"
        url2 = "https://quizapi.io/api/v1/questions?apiKey=A9ya16s39eH0hdu3BgxigMuxVa4zbjMaVjHxCOyt&limit=10&category=#{categories[1]}&difficulty=#{difficulty}"
        url3 = "https://quizapi.io/api/v1/questions?apiKey=A9ya16s39eH0hdu3BgxigMuxVa4zbjMaVjHxCOyt&limit=10&category=#{categories[2]}&difficulty=#{difficulty}"
        uri = URI(url)
        uri2 = URI(url2)
        uri3 = URI(url3)
        response = Net::HTTP.get(uri)
        response2 = Net::HTTP.get(uri2)
        response3 = Net::HTTP.get(uri3)
        result = JSON.parse(response)
        result2 = JSON.parse(response2)
        result3 = JSON.parse(response3)
        result.concat(result2)
        result.concat(result3)
        result.shuffle!
        File.write('./quiz.json', JSON.pretty_generate(result))
      elsif count == 4
        url = "https://quizapi.io/api/v1/questions?apiKey=A9ya16s39eH0hdu3BgxigMuxVa4zbjMaVjHxCOyt&limit=10&category=#{categories[0]}&difficulty=#{difficulty}"
        url2 = "https://quizapi.io/api/v1/questions?apiKey=A9ya16s39eH0hdu3BgxigMuxVa4zbjMaVjHxCOyt&limit=10&category=#{categories[1]}&difficulty=#{difficulty}"
        url3 = "https://quizapi.io/api/v1/questions?apiKey=A9ya16s39eH0hdu3BgxigMuxVa4zbjMaVjHxCOyt&limit=10&category=#{categories[2]}&difficulty=#{difficulty}"
        url4 = "https://quizapi.io/api/v1/questions?apiKey=A9ya16s39eH0hdu3BgxigMuxVa4zbjMaVjHxCOyt&limit=10&category=#{categories[3]}&difficulty=#{difficulty}"
        uri = URI(url)
        uri2 = URI(url2)
        uri3 = URI(url3)
        uri4 = URI(url4)
        response = Net::HTTP.get(uri)
        response2 = Net::HTTP.get(uri2)
        response3 = Net::HTTP.get(uri3)
        response4 = Net::HTTP.get(uri4)
        result = JSON.parse(response)
        result2 = JSON.parse(response2)
        result3 = JSON.parse(response3)
        result4 = JSON.parse(response4)
        result.concat(result2)
        result.concat(result3)
        result.concat(result4)
        result.shuffle!
        File.write('./quiz.json', JSON.pretty_generate(result))
      end
      redirect_to(quiz_get_path, :notice => session[:max])
    end  
  end 
end