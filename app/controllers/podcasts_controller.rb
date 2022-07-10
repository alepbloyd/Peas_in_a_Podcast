class PodcastsController < ApplicationController
  def index
    @podcasts = Podcast.all.order_by_recently_created_first
  end

  def show
    @podcast = Podcast.find(params[:id])
  end

  def episodes
    @podcast = Podcast.find(params[:id])
    if params[:sort] == "alpha"
      @episodes = @podcast.episodes.alphabetical
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
    redirect_to '/podcasts'
  end

  def update
    podcast = Podcast.find(params[:id])
    podcast.update(podcast_params)
    redirect_to "/podcasts/#{params[:id]}"
  end

  def delete
    Podcast.find(params[:id]).destroy
    redirect_to "/podcasts"
  end

  private
  def podcast_params
    params.permit(:name,:in_production,:ad_slot_cost)
  end
end