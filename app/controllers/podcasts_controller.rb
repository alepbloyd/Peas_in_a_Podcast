class PodcastsController < ApplicationController
  def index
    @podcasts = Podcast.all.order(created_at: :desc)
  end

  def show
    @podcast = Podcast.find(params[:id])
  end

  def episodes
    @podcast = Podcast.find(params[:id])
    @episodes = @podcast.episodes
  end
end