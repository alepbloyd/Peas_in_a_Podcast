class PodcastsController < ApplicationController
  def index
    if params[:sort] == "episode_count"
      @podcasts = Podcast.all.order_by_episode_count
    elsif params[:exact_match_search] != nil
      @podcasts = Podcast.exact_match_search(params[:exact_match_search])
    elsif params[:partial_match_search] != nil
      @podcasts = Podcast.partial_match_search(params[:partial_match_search])
    else
      @podcasts = Podcast.all.order_by_recently_created_first
    end
  end

  def show
    @podcast = Podcast.find(params[:id])
  end

  def episodes
    @podcast = Podcast.find(params[:id])
    if params[:sort] == "alpha"
      @episodes = @podcast.episodes.alphabetical
    elsif params[:minimum_length] != nil
      @episodes = @podcast.episodes.above_set_length(params[:minimum_length])
    else
      @episodes = @podcast.episodes
    end
  end

  def new
  end

  def edit
    @podcast = Podcast.find(params[:id])
  end

  def create
    Podcast.create(podcast_params)
    redirect_to '/podcasts', notice: "Podcast created!"
  end

  def update
    podcast = Podcast.find(params[:id])
    podcast.update(podcast_params)
    redirect_to "/podcasts/#{params[:id]}", notice: "Podcast updated!"
  end

  def delete
    Podcast.find(params[:id]).destroy
    redirect_to "/podcasts", notice: "Podcast deleted!"
  end

  private
  def podcast_params
    params.permit(:name,:in_production,:ad_slot_cost)
  end
end