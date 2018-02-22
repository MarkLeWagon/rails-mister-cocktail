class DosesController < ApplicationController

  def index
    @doses = Dose.all
  end

  def create
    @dose = Dose.new(doses_params)
    if @dose.save
      redirect_to cocktails_path(@cocktail)
    else
      render :new
    end
  end

  def new
    @dose = Dose.new
  end

  def delete
    @dose = Dose.find(params[:id])
    @dose.delete
    redirect_to cocktails_path(@cocktail)
  end

  private

  def doses_params
    params.require(:dose).permit(:description)
  end

end
