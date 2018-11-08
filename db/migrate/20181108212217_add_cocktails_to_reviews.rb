class AddCocktailsToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :cocktail_id, :integer
  end
end
