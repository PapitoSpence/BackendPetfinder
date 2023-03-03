class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :breeds, null: false
      t.string :contact, null: false
      t.string :photos, null: false
      t.integer :status, null: false, default: 0

    end

  end
end
