class CreateWatches < ActiveRecord::Migration[6.0]
  def change
    create_table :watches do |t|
      t.string :description
      t.float :rating
      t.boolean :seen
      t.date :watched_date
      t.boolean :private
      t.boolean :favourite

      t.timestamps
    end
  end
end
