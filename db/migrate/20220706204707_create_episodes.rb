class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.string :title
      t.integer :length_in_seconds
      t.boolean :marked_explicit

      t.timestamps
    end
  end
end
