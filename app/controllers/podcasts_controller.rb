class PodcastsController < ApplicationController
  def index
    @podcasts = Podcast.all.order_by_recently_created_first
  end

  def show
    @podcast = Podcast.find(params[:id])
  end

  def episodes
    @podcast = Podcast.find(params[:id])
    @episodes = @podcast.episodes
  end
end