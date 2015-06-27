class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :loc_city
      t.string :event_code
      t.integer :visibility
      t.date :date

      t.timestamps null: false
    end
  end
end
