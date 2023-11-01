class ChangeDefaultPublicToFalseInRecipes < ActiveRecord::Migration[6.0]
  def change
    change_column :recipes, :public, :boolean, default: false
  end
end