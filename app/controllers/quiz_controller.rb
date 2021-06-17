class QuizController < ApplicationController
  def start
    #Rails.application.load_seed
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
      if session[:times] == 4
        redirect_to(result_path)
      else
        redirect_to(quiz_get_path, :notice => @answers)
      end
    end
  end  

  def result
  end  
end
