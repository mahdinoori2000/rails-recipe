class FoodsController < ApplicationController
  before_action :authenticate_user!

  # GET /foods
  def index
    @foods = Food.where(user_id: current_user.id).order(created_at: :asc)
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  def shopping_list
    @foods = Food.where(user_id: current_user.id)
    @ingredients = RecipeFood.joins(:recipe).where(recipes: { user_id: current_user.id })
  end

  # POST foods/create
  def create
    @food = Food.new(food_params)

    if @food.save
      redirect_to foods_path, notice: 'Food was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE foods/delete/:id
  def destroy
    @food = Food.find(params[:id])
    @food.destroy!
    redirect_to foods_path, notice: 'Food was successfully destroyed.'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity, :user_id)
  end
end
