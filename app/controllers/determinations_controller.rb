class DeterminationsController < ApplicationController
  def index
    @count = 1
    if params[:search]
      @determinations = Determination.search(params[:search]).order(:title)
    else
      @determinations = Determination.order(:title)
    end
  end

  def new
    if current_user.try(:admin?)
      @determination = Determination.new
    else
      not_found
    end
  end

  def create
    if current_user.try(:admin?)
      @determination = Determination.new(determination_params)
      if @determination.save
        redirect_to determinations_path
      else
        render 'new'
      end
    else
      not_found
    end
  end

  def edit
    if current_user.try(:admin?)
      @determination = find_determination
    else
      not_found
    end
  end

  def update
    if current_user.try(:admin?)
      @determination = find_determination
      if @determination.update(determination_params)
        redirect_to determinations_path
      else
        render 'edit'
      end
    else
      not_found
    end
  end

  def show
    @determination = find_determination
  end

  def destroy
    if current_user.try(:admin?)
      @determination = find_determination
      @determination.destroy
      redirect_to determinations_path
    end
  end

  private
  def determination_params
    params.require(:determination).permit(:title, :body)
  end

  def find_determination
    @determination = Determination.find(params[:id])
  end

  def not_found
    render file: "#{Rails.root}/public/404", status: :not_found
  end
end
