class Reviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :content
      t.integer :rating
      t.integer :user_id
      t.integer :movie_id
    end
  end
end
