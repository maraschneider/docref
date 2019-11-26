class RemoveShortCoordinatesFromClinics < ActiveRecord::Migration[5.2]
  def change
    remove_column :clinics, :lat, :float
    remove_column :clinics, :lng, :float
  end
end
