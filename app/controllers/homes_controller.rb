class HomesController < ApplicationController
  def index
    @last_theory = Theory.last
    @last_practice = Practice.last
    @last_quiz = Quiz.last
    @last_determination = Determination.last
    @message = Micromessage.new
    @messages = Micromessage.all
  end
end
