class EpisodesController < ApplicationController
  def index
    @episodes = Episode.all.only_display_explicit
  end

  def show
    @episode = Episode.find(params[:id])
    # require 'pry'; binding.pry 
  end

  def new
    @podcast = Podcast.find(params[:id])
  end

  def edit
    @episode = Episode.find(params[:id])
  end

  def update
    episode = Episode.find(params[:id])
    episode.update(episode_params)
    redirect_to "/episodes/#{params[:id]}"
  end

  def create
    @episode = Episode.create(episode_params)

    redirect_to "/podcasts/#{@episode.podcast_id}/episodes"
  end

  def delete
    Episode.find(params[:id]).destroy
    redirect_to "/episodes"
  end
  

  private
  def episode_params
    params.permit(:title, :length_in_seconds, :marked_explicit,:podcast_id, :minimum_length)
  end
end