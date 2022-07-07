class CreatePodcasts < ActiveRecord::Migration[5.2]
  def change
    create_table :podcasts do |t|
      t.string :name
      t.boolean :in_production
      t.float :ad_slot_cost

      t.timestamps
    end
  end
end
