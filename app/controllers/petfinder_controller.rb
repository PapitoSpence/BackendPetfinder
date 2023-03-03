class PetController < Sinatra::Base

    set :views, './app/views'


    get '/hello' do
        "Welcome to my first controller"
    end

    post '/pets/create' do
        data = JSON.parse (request.body.read)
        #rescue block
        begin
        #approach 1 (individual columns)
        # title = data ["title"]
        # description =data["description"]
        # todo = Todo.create(title: title, description: description, createdAt: today)
        # todo.to_json

        #approach 2 (hash of columns)
        today = Time.now
        data["createdAt"] = today
        pet = Pet.create(data)
        [201, pet.to_json]


            
        rescue => exception
            [422, {
                error: exception.message
            }.to_json]
        end
    end

    get '/pets' do

        pets = Pet.all
        [200, pets.to_json]

    end
    get "/users" do
        users = User.all
        users.to_json
      end
  
      post "/login" do
        user = User.find_by(email: params[:email], password: params[:password])
        user.to_json
      end
  
  
    get '/view/pets' do
        @pets = Pet.all
        erb :pets

    end

    put 'pets/update/:id' do
        #rescue bloc
        begin
        data = JSON.parse (request.body.read)
        pet_id = params['id'].to_i
        pet = Pet.find(pet_id)
        pet.update(data)
        {message: "Pet updated successfully"}.to_json 
        rescue => e
            {
                error: e.message
            }.to_json
        end

    end

    delete '/pets/destroy/:id' do
        begin
            pet_id = params['id'].to_i
            pet = Pet.find(pet_id)
            pet.destroy
            rescue => e
                {error: e.message}.to_json

            end

    end
    # get "/" do
   
    #     pet = Pet.all
    #     pet.to_json
      
    #     end
    
    #     get "/users" do
    #       users = User.all
    #       users.to_json
    #     end
    
    #     post '/login' do 
    #         user = User.find_by(
    #           email: params[:email],
    #           password: params[:password]
    #         )
    #         user.to_json
    #       end
    
    #     post "/new_pet" do
    #       pet = Pet.create(
    #         name: params[:name], description: params[:description], breeds: params[:breeds],
    #         photos: params[:photos], status: params[:status], contact: params[:contact]
    #       )
    #     end
    
    #       get "/pets/:status" do
    #         pets = Pet.find_by(params[:status]) 
    #         pets.to_json
            
    #       end
           
           
    #        get "/pets/:breeds" do
    #         pets = Pet.find_by(params[:breeds]) 
    #         pets.to_json
          
            
    #       end
    
    #       get "/pets/:name" do
    #         pets = Pet.find_by(params[:name]) 
    #         pets.to_json
          
    #       end

          patch "/pets/:id" do
            pet = Pet.find_params(params[:id]0)
            pets.update(
                name: params[:name], description: params[:description], breeds: params[:breeds],
            photos: params[:photos], status: params[:status], contact: params[:contact]

            )
            pets.to_json
          end

    #       delete "/pets/:id" do
    #         pets = Pet.find(params[:id])
    #         pets.destroy
    #         pets.to_json
    #       end
        

end