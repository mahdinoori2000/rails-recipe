class RecipeFoodsController < ApplicationController
  def index
    @recipe_foods = RecipeFood.all
  end

  def new
    @recipe_food = RecipeFood.new
  end
  
  def create
    @recipe_food = RecipeFood.new(recipe_food_params)

    if @recipe_food.save
      redirect_to recipes_path, notice: 'Ingredient is successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id)
  end

end
