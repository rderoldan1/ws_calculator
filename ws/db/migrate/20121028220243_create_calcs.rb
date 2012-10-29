class CreateCalcs < ActiveRecord::Migration
  def change
    create_table :calcs do |t|
      t.string :suma
      t.string :resta

      t.timestamps
    end
  end
end
