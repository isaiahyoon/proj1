class PokemonsController < ApplicationController
  
  def capture
    @pokemon = Pokemon.find(params[:id])
    @pokemon.trainer = current_trainer
    @pokemon.save
    redirect_to root_path
  end

  def damage
    @pokemon = Pokemon.find(params[:id])
    @pokemon.health -= 10
    if @pokemon.health <= 0
        @pokemon.destroy
    else
        @pokemon.save
    end
    redirect_to current_trainer
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.level = 1
    @pokemon.health = 100
    @pokemon.trainer = current_trainer
    if @pokemon.save
        redirect_to current_trainer
    else
        redirect_to new_path
        flash[:error] = @pokemon.errors.full_messages.to_sentence
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name)
  end
  
end
