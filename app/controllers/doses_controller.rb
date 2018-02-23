class DosesController < ApplicationController

  def index
    @doses = Dose.all
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(doses_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to(@cocktail)
    else
      render :new
    end
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.delete
    redirect_to cocktails_path
  end

  private

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
