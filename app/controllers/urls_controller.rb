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

  private

    def url_params
      params.require(:url).permit(:original_url)
    end
end
