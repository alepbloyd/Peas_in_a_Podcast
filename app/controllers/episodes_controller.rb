class EpisodesController < ApplicationController
  def index
    if params[:exact_match_search] != nil
      @episodes = Episode.exact_match_search(params[:exact_match_search])
    else
      @episodes = Episode.all.only_display_explicit
    end
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
    redirect_to "/episodes/#{params[:id]}", notice: "Episode updated!"
  end

  def create
    @episode = Episode.create(episode_params)

    redirect_to "/podcasts/#{@episode.podcast_id}/episodes", notice: "Episode created!"
  end

  def delete
    Episode.find(params[:id]).destroy
    redirect_to "/episodes", notice: "Episode deleted!"
  end
  

  private
  def episode_params
    params.permit(:title, :length_in_seconds, :marked_explicit,:podcast_id, :minimum_length)
  end
end