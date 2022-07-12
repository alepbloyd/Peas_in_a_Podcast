class AddEpisodesCountToPodcasts < ActiveRecord::Migration[5.2]
  def change
    add_column :podcasts, :episodes_count, :integer, default: 0
  end
end
