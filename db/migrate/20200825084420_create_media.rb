class CreateMedia < ActiveRecord::Migration[6.0]
  def change
    create_table :media do |t|
      t.string :title
      t.integer :runtime
      t.string :genres
      t.text :description
      t.string :language
      t.float :rating
      t.string :media_type
      t.string :imdb_id
      t.integer :total_seasons
      t.integer :tmdb_id
      t.string :origin_country
      t.string :poster
      t.date :first_air_date
      t.date :last_air_date

      t.timestamps
    end
  end
end
