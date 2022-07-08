class EpisodesController < ApplicationController
  def index
    @episodes = Episode.all
  end

  def show
    @episode = Episode.find(params[:id])
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

  private
  def episode_params
    params.permit(:title, :length_in_seconds, :marked_explicit,:podcast_id)
  end
end