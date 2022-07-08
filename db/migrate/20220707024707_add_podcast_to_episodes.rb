class AddPodcastToEpisodes < ActiveRecord::Migration[5.2]
  def change
    add_reference :episodes, :podcast, foreign_key: true
  end
end
