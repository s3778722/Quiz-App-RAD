class QuizController < ApplicationController
  def start
    Rails.application.load_seed
    @questions = QuizItem.all
    
    if params.include?(:flexRadioDefault)
      @answers = params[:flexRadioDefault]
      if  @answers == 'answer_a_correct'
        if @questions[session[:times]]['correct_answers']['answer_a_correct'] == 'true'
          session[:marks] += 1
        end
      elsif @answers ==  'answer_b_correct'
        if @questions[session[:times]]['correct_answers']['answer_b_correct'] == 'true'
          session[:marks] += 1
        end
      elsif @answers ==  'answer_c_correct'
        if @questions[session[:times]]['correct_answers']['answer_c_correct'] == 'true'
          session[:marks] += 1
        end
      elsif @answers ==  'answer_d_correct'
        if @questions[session[:times]]['correct_answers']['answer_d_correct'] == 'true'
          session[:marks] += 1
        end
      elsif @answers ==  'answer_e_correct'
        if @questions[session[:times]]['correct_answers']['answer_e_correct'] == 'true'
          session[:marks] += 1
        end
      elsif @answers ==  'answer_f_correct'
        if @questions[session[:times]]['correct_answers']['answer_f_correct'] == 'true'
          session[:marks] += 1
        end
      end
      session[:times] += 1
      if session[:times].to_i == session[:max].to_i
        redirect_to(result_path)
      else
        redirect_to(quiz_get_path, :notice => @answers)
      end
    end
  end  

  def result
    d = DateTime.now.in_time_zone('Melbourne')
    if session[:history].nil? 
      session[:history] ||= [] 
    end
    #need one more space for the latest result
    if session[:history].count >= 6 
      session[:history].shift()
    end
    session[:history] << "At #{d.strftime("%H:%M")}, #{d.strftime("%d/%m/%Y")}, you answered #{session[:marks]}/#{session[:max]} questions correctly"

  end  

  def reload
    categories = Array.new
    count = 0
    if session[:docker] == true
      count += 1
      categories << "docker"
    end
 
    if session[:devops] == true
      count += 1
      categories << "devops"
    end

    if session[:linux] == true
      count += 1
      categories << "linux"
    end

    if session[:sql] == true
      count += 1 
      categories << "sql"
    end


    if count == 1
      url = "https://quizapi.io/api/v1/questions?apiKey=A9ya16s39eH0hdu3BgxigMuxVa4zbjMaVjHxCOyt&limit=10&category=#{categories[0]}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      result = JSON.parse(response)
      result.shuffle!
      File.write('./quiz.json', JSON.pretty_generate(result))
    elsif count == 2
      url = "https://quizapi.io/api/v1/questions?apiKey=A9ya16s39eH0hdu3BgxigMuxVa4zbjMaVjHxCOyt&limit=10&category=#{categories[0]}"
      url2 = "https://quizapi.io/api/v1/questions?apiKey=A9ya16s39eH0hdu3BgxigMuxVa4zbjMaVjHxCOyt&limit=10&category=#{categories[1]}"
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
      url = "https://quizapi.io/api/v1/questions?apiKey=A9ya16s39eH0hdu3BgxigMuxVa4zbjMaVjHxCOyt&limit=10&category=#{categories[0]}"
      url2 = "https://quizapi.io/api/v1/questions?apiKey=A9ya16s39eH0hdu3BgxigMuxVa4zbjMaVjHxCOyt&limit=10&category=#{categories[1]}"
      url3 = "https://quizapi.io/api/v1/questions?apiKey=A9ya16s39eH0hdu3BgxigMuxVa4zbjMaVjHxCOyt&limit=10&category=#{categories[2]}"
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
      url = "https://quizapi.io/api/v1/questions?apiKey=A9ya16s39eH0hdu3BgxigMuxVa4zbjMaVjHxCOyt&limit=10&category=#{categories[0]}"
      url2 = "https://quizapi.io/api/v1/questions?apiKey=A9ya16s39eH0hdu3BgxigMuxVa4zbjMaVjHxCOyt&limit=10&category=#{categories[1]}"
      url3 = "https://quizapi.io/api/v1/questions?apiKey=A9ya16s39eH0hdu3BgxigMuxVa4zbjMaVjHxCOyt&limit=10&category=#{categories[2]}"
      url4 = "https://quizapi.io/api/v1/questions?apiKey=A9ya16s39eH0hdu3BgxigMuxVa4zbjMaVjHxCOyt&limit=10&category=#{categories[3]}"
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
    redirect_to(quiz_get_path)
  end

  def redo
    redirect_to(quiz_get_path)
  end
end