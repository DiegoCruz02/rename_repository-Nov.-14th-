Rails.application.routes.draw do
  #literally one line made all seven routes for us

  #this is if you want to specify which routes you want
  #resources :pets, only: [:create, :update] 
  # Routes for the Pet resource:
resources :pets
  # CREATE
  #we can use /pets 2 times because the routes are still different (post is used here and get is used elswhere)
  #these are the main differences if they were borh get it would break!
  # post("/pets", { :controller => "pets", :action => "create" })
          
  # # READ
  # # by convention, we only use /pets throughout and we also use :id becuase they are all similar throughout!
  # get("/pets", { :controller => "pets", :action => "index" })
  
  # get("/pets/new", { :controller => "pets", :action => "new" })

  # get("/pets/:id", { :controller => "pets", :action => "show" })
  
  # get("/pets/:id/edit", { :controller => "pets", :action => "edit" })

  # # UPDATE
  
  # patch("/pets/:id", { :controller => "pets", :action => "update" })
  
  # # DELETE
  # delete("/pets/:id", { :controller => "pets", :action => "destroy" })

  #------------------------------

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
