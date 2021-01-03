class AnimalsController < ApplicationController
    def index
        animals = Animal.all 
        render json: animals
    end

    def show
        animal = Animal.find(params[:id])
        render json:animal.to_json(:include => [:sightings])
    end

    def create
        animal = Animal.create(animal_params)
        if animal.valid?
            render json: animal
        else
            render json: animal.erros
        end
    end

    def destroy
        animal = Animal.find(params[:id])
        if animal.destroy
            render json: animal
        else 
            render json: animal.errors
        end
    end

    def update
        animal = Animal.find(params[:id])
        animal.update(animal_params)
        if animal.valid?
            render json:animal
        else
            render json: animal.errors
        end
    end

    def show
        animal = Animal.find(params[:id])
        render json: animal.sightings
    end

class SightingsController < ApplicationController
    def index
        sightings = Sighting.where(start_date: params[:start_date]..params[:end_date])
        render json: sightings
    end
end

# strong parameters 
private

def animal_params
    params.require(:animal).permit(:common_name, :latin_name, :kingdom)
end




end
