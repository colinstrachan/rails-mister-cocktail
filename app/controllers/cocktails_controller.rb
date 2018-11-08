class CocktailsController < ApplicationController
  before_action :get_cocktail, only: [ :show, :edit, :update, :destroy ]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @review = Review.new
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    return redirect_to cocktail_path(@cocktail) if @cocktail.save
    render :new
  end

  def edit
  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to cocktails_path
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :dose_id, :ingredient_id)
  end

  def get_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
