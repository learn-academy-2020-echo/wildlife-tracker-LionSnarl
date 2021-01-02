# wildlife-tracker-LionSnarl
wildlife-tracker-LionSnarl created by GitHub Classroom
# README
This README would normally document whatever steps are necessary to get the
application up and running.
Things you may want to cover:
* Ruby version
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
* ...

1. Story: As the consumer of the API I can create an animal and save it in the database. An animal has the following information: common name, latin name, kingdom (mammal, insect, etc.).

rails generate model Animal common_name:string latin_name:string, kingdom:string
rails db:migrate 

2. Story: As the consumer of the API I can list all the animals in a database.
    Hint: Make a few animals using Rails Console

Let's start with dog!
Animal.create common_name:'Dog', latin_name:'Canis familiaris', 
ingdom:'Animalia'
Animal.create common_name:'Cat', latin_name:'Felis catus', kingd
m:'Animalia'
Animal.create common_name:'Python', latin_name:'Pythonidae', kin
dom:'Animalia'

3. Story: As the consumer of the API I can update an animal in the database.

{
        "animal":{
             "common_name": "Python",
             "latin_name": "Pythonidae",
             "kingdom": "Animalia"
        }
}

4. Story: As the consumer of the API I can destroy a animal in the database.

Delete localhost:3000/animals/4 

5. Story: As the consumer of the API I can create a sighting of an animal with date (use the datetime datatype), latitude and longitude.
    Hint: An animal has_many sightings. (rails g resource Sighting animal_id:integer ...)


rails generate resource Sighting animal_id:integer date:datetime latitude:string longitude:string

michael = Animal.first

Sighting.create animal_id:interger date:datetime latitude:string longitude:string

lea.sightings.create date:'2020-08-28', latitude:'Mexico', longitude:'Tropic of Cancer'

6. Story: As the consumer of the API I can update an animal sighting in the database.

PATCH localhost:3000/sightings/1

{
        "sighting":{
        "date": "2020-07-29",
        "latitude": "Brazil",
        "longitude": "Tropic of Capricorn"
        }

}

7. Story: As the consumer of the API I can destroy an animal sighting in the database.

deleted ID2 

8. Story: As the consumer of the API, when I view a specific animal, I can also see a list sightings of that animal.

def show
    animal = Animal.find(params[:id])
    render json: animal.sightings

end

9. Story: As the consumer of the API, I can run a report to list all sightings during a given time period.
    Hint: Your controller can look something like this:
    class SightingsController < ApplicationController
     def index
        sightings = Sighting.where(start_date: params[:start_date]..params[:end_date])
        render json: sightings
        end
    end
    Remember to add the start_date and end_date to what is permitted in your strong parameters method.

    Added strong params!
