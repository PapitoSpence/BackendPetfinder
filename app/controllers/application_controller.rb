class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'
    
    # Add your routes here
    get "/" do
   
    pet = Pet.all
    pet.to_json
  
    end

    get "/users" do
      users = User.all
      users.to_json
    end

    post "/login" do
      user = User.find_by(email: params[:email], password: params[:password])
      user.to_json
    end

    post "/new_pet" do
      pet = Pet.create(
        name: params[:name], description: params[:description], breeds: params[:breeds],
        photos: params[:photos], status: params[:status], contact: params[:contact]
      )
    end

      get "/pets/:status" do
        pets = Pet.find_by(params[:status]) 
        pets.to_json
        
      end
       
       
       get "/pets/:breeds" do
        pets = Pet.find_by(params[:breeds]) 
        pets.to_json
      
        
      end

      get "/pets/:name" do
        pets = Pet.find_by(params[:name]) 
        pets.to_json
      
      end
        
    
        
    end