class TheoriesController < ApplicationController
  def index
    @count = 1
    if params[:search]
      @theories = Theory.search(params[:search].capitalize).order(:title)
    else
      @theories = Theory.order(:title)
    end
  end

  def new
    if current_user.try(:admin?)
      @theory = Theory.new
    else
      not_found
    end
  end

  def create
    if current_user.try(:admin?)
      @theory = Theory.new(theory_params)
      @theory.title.capitalize!
      if @theory.save
        redirect_to theory_path(@theory)
      else
        render 'new'
      end
    else
      not_found
    end
  end

  def edit
    if current_user.try(:admin?)
      @theory = find_theory
    else
      not_found
    end
  end

  def update
    if current_user.try(:admin?)
      @theory = find_theory
      if @theory.update(theory_params)
        redirect_to theory_path(@theory)
      else
        render 'edit'
      end
    else
      not_found
    end
  end

  def show
    @theory = find_theory
  end

  def destroy
    if current_user.try(:admin?)
      @theory = find_theory
      @theory.destroy
      redirect_to theories_path
    end
  end

  private
  def theory_params
    params.require(:theory).permit(:title, :body)
  end

  def find_theory
    @theory = Theory.find(params[:id])
  end

  def not_found
    render file: "#{Rails.root}/public/404", status: :not_found
  end
end
