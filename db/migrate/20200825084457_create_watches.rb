class CreateWatches < ActiveRecord::Migration[6.0]
  def change
    create_table :watches do |t|
      t.string :description
      t.float :rating
      t.boolean :seen, default: false
      t.date :watched_date
      t.boolean :private, default: false
      t.boolean :favourite, default: false

      t.timestamps
    end
  end
end
