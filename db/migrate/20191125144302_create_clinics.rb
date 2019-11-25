class CreateClinics < ActiveRecord::Migration[5.2]
  def change
    create_table :clinics do |t|
      t.string :name
      t.string :consultation_times
      t.string :website
      t.string :phone_number
      t.string :email
      t.string :clinic_picture
      t.text :description
      t.string :address
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
