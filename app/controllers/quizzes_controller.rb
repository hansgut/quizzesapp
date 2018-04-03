class QuizzesController < ApplicationController
  def index
    @count = 1
    if params[:search]
      @quizzes = Quiz.search(params[:search].capitalize).order(:title)
    else
      @quizzes = Quiz.order(:title)
    end
  end

  def new
    if current_user.try(:admin?)
      @quiz = Quiz.new
      @quiz.questions.build
      @quiz.questions.each{|q| q.answers.build}
    else
      not_found
    end
  end

  def create
    if current_user.try(:admin?)
      @quiz = Quiz.new(quiz_params)
      @check = Array.new(@quiz.questions.length, false)
      @count = 0
      @quiz.questions.each do |q|
        q.answers.each do |a|
          if a.atrue
            @check[@count] = true
          end
        end
        @count += 1
      end
      if @check.include?(false) then render 'new' and return end
      if @quiz.save
        redirect_to quiz_path(@quiz)
      else
        render 'new'
      end
    else
      not_found
    end
  end

  def edit
    if current_user.try(:admin?)
      @quiz = find_quiz
    else
      not_found
    end
  end

  def update
    if current_user.try(:admin?)
      @quiz = find_quiz
      if @quiz.update(quiz_params)
        redirect_to quiz_path(@quiz)
      else
        render 'edit'
      end
    else
      not_found
    end
  end

  def show
    @quiz = find_quiz
  end

  def destroy
    if current_user.try(:admin?)
      @quiz = find_quiz
      @quiz.destroy
      redirect_to quizzes_path
    end
  end

  private
  def quiz_params
    params.require(:quiz).permit(:title, :_destroy,questions_attributes: [:id, :title, answers_attributes:[:id, :body, :atrue,:_destroy]])
  end

  def find_quiz
    @quiz = Quiz.find(params[:id])
  end

  def not_found
    render file: "#{Rails.root}/public/404", status: :not_found
  end
end
