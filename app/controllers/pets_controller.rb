class PetsController < ApplicationController
  #LOOK AT THIS THIS EXPALINS A LOT!!!
  # we are using the before action and we made a method that is performed at the very begining for all of the methods in the array
  # use this if needed!!!!
  before_action :set_pet, only: [:show, :edit, :destroy, :update]

  def set_pet
    the_id = params.fetch("id")

    @pet = Pet.find(the_id)

    #these are all the old ways of going to our Models and find the id!!!!
    # the_id = params.fetch("id")

    # # The next two are identical

    # @pet = Pet.where(id: the_id).first # might return nil
    
    # @pet = Pet.find_by(id: the_id) # might return nil
    
    # # The next two are identical

    # @pet = Pet.find_by!(id: the_id) # will never return nil
    # # @user = User.find_by!(username: params.fetch("username"))
    
    # @pet = Pet.find(the_id)) # will never return nil
  end

  def index
    matching_pets = Pet.all

    @list_of_pets = matching_pets.order({ :created_at => :desc })
#Yea we dont even need to add html.erb anymore becuase ruby reads it for us borther!
    # render({ :template => "pets/index" })

#this is what gives us a chance to render create our own .json!!!
    respond_to do |format|
      format.html do
        render("pets/index.html.erb")
      end

      format.json do
        render json: @list_of_pets 
      end
    end
  end

  def show
#we are doing .where(0) on pet, but it is shorter and now we get a better error developing becuase the code will stop here rather than somewhere else.
# because we were looking for the id, we didnt even need to include :id in our data table

#we dont even endd to incude this line of code it knows where to go
    # @pet = Pet.find(params.fetch("id"))

#and yes we can render without has rockets now, less code more to memorize there brother!!! And yes we dont even need show have pets/show or the template there
#shiiiiiiiit we don't even need to say that we need to render this it automatically assume it for us
    # render "show"
  end

  def new
    #duh ofc we need Pet.new thats the point!!!
    @pet = Pet.new
    
  end

  def create
    pet_params = params.require(:pet).permit(:age, :name, :species_id)
    
    @pet = Pet.new(pet_params)

    if @pet.valid?
      @pet.save

      redirect_to("/pets", { :notice => "Pet created successfully." })
    else
      render("new")
    end
  end

  def update
   pet_params = params.require(:pet).permit(:name,:age, :species_id)

   #use .update to save and push the new information into our terminal okay!!! Mess with it a little more if it ever feels foggy
   @pet.update(pet_params)

    if @pet.valid?
      @pet.save
      redirect_to("/pets/#{@pet.id}", { :notice => "Pet updated successfully."} )
    else
      redirect_to("edit")
    end
  end

  def edit
    #seems like show and edit don't even need anything in them for rendering ... figure out why brother
    # @pet = Pet.find(params.fetch("id"))
  end

  def destroy
    # just think about why this is unnecessary you can figure it out kid!
    # @pet = Pet.find(params.fetch("id"))

    @pet.destroy

    redirect_to("/pets", { :notice => "Pet deleted successfully."} )
  end
end
