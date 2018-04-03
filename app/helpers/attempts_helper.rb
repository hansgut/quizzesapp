module AttemptsHelper
  def check_answer(atrue, user_answer)
    atrue = (atrue ? '1' : '0')

    if user_answer == '1'
      return atrue == user_answer ? 'green;' : 'red;'
    else
      return 'black;'
    end
  end
end
