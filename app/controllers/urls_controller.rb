class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      redirect_to @url
    else
      render 'new'
    end
  end

  def show
    @url = Url.find(params[:id])
  end

  def go_to_original_url
    @url = Url.find_by(short_url: params[:short_url])
    redirect_to @url.original_url
  end

  private

    def url_params
      params.require(:url).permit(:original_url)
    end
end
