class Pet < ActiveRecord::Base
    #enum :status, [:CREATED, :ONGOING, :COMPLETED, :CANCELLED]
    belongs_to :user
    
end