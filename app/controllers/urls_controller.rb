class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)

    duplicated_url = Url.find_by(original_url: @url.original_url)

    if duplicated_url.nil?
      if @url.save
        redirect_to @url
      else
        render 'new'
      end
    else
      redirect_to duplicated_url
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
