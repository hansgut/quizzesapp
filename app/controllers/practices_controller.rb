class PracticesController < ApplicationController
  def index
    @count = 1
    if params[:search]
      @practices = Practice.search(params[:search].capitalize).order(:title)
    else
      @practices = Practice.order(:title)
    end
  end

  def new
    if current_user.try(:admin?)
      @practice = Practice.new
    else
      not_found
    end
  end

  def create
    if current_user.try(:admin?)
      @practice = Practice.new(practice_params)
      @practice.title.capitalize!
      if @practice.save
        redirect_to practice_path(@practice)
      else
        render 'new'
      end
    else
      not_found
    end
  end

  def edit
    if current_user.try(:admin?)
      @practice = find_practice
    else
      not_found
    end
  end

  def update
    if current_user.try(:admin?)
      @practice = find_practice
      if @practice.update(practice_params)
        redirect_to practice_path(@practice)
      else
        render 'edit'
      end
    else
      not_found
    end
  end

  def show
    @practice = find_practice
  end

  def destroy
    if current_user.try(:admin?)
      @practice = find_practice
      @practice.destroy
      redirect_to practices_path
    end
  end

  private
  def practice_params
    params.require(:practice).permit(:title, :body)
  end

  def find_practice
    @practice = Practice.find(params[:id])
  end

  def not_found
    render file: "#{Rails.root}/public/404", status: :not_found
  end
end
