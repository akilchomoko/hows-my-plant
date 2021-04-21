class CreateData < ActiveRecord::Migration[6.0]
  def change
    create_table :data do |t|
      t.string :value
      t.string :data_type
      t.references :device, null: false, foreign_key: true
      t.references :plant, null: false, foreign_key: true
      t.timestamp :data_created

      t.timestamps
    end
  end
end
