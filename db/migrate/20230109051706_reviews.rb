class Reviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.integer :movie_id
      t.integer :critic_id
    end
  end
end
