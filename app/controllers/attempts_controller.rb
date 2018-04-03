class AttemptsController < ApplicationController
  def new
    if params[:quiz]
      @q_c = 0
      @a_c = 0
      @quiz = find_quiz(params[:quiz])
    else
      not_found
    end
  end

  def create
    quiz = Quiz.find(params[:quiz_id])
    @attempt = Attempt.new(quiz_id: quiz.id, user_id: current_user.id, answers: get_users_answers(quiz, params))
    if @attempt.save
      redirect_to attempt_path(@attempt)
    else
      redirect_to :back
    end
  end

  def show
    @attempt = Attempt.find(params[:id])
    @quiz = Quiz.find(@attempt.quiz_id)
  end

  private
  def get_users_answers(quiz, params)
    a_c = 0
    q_c = 0
    user_answers = []
    questions = quiz.questions.length
    questions.times do
      answers = quiz.questions[q_c].answers.length
      user_answers << []
      answers.times do
        user_answers[q_c][a_c] = params["#{q_c}_#{a_c}".to_sym]
        a_c += 1
      end
      a_c = 0
      q_c += 1
    end
    user_answers
  end

  def get_right_answers(quiz)
    count = 0
    q_c = 0
    a_c = 0
    answers = []
    quiz.questions.each do |q|
      answers << []
      q.answers.each do |a|
        answers[count]<< (a.atrue ? 1 : 0)
      end
      count += 1
    end
    answers
  end
  def not_found
    render file: "#{Rails.root}/public/404", status: :not_found
  end

  def find_quiz(id)
    @quiz = Quiz.find(id)
  end
end
