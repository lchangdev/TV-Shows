class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def create
    @character = Character.new(character_params)

    @character.television_show_id = params[:television_show_id]

    if @character.save
      flash[:notice] = "Success"
      redirect_to television_show_path(@character.television_show_id)
    else
      flash[:notice] = "There was an error"

      redirect_to television_show_path(@character.television_show_id)
    end
  end

  def show
    @character = Character.find(params[:id])
  end

  def destroy
    @character = Character.find(params[:id])

    if @character.destroy
      flash[:notice] = "Deleted"
      redirect_to characters_path
    else
      flash[:notice] = "Error"
      render :new
    end
  end

  private

  def character_params
    params.require(:character).permit(:name, :actor, :description)
  end

end
