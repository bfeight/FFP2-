class VisualsController < ApplicationController
  before_action :set_visual, only: [:show, :edit, :udpate, :destroy]
  before_action :set_user, only: [:create, :new]
  before_action :auth_user, only: [:edit, :update, :destroy]

  # before_action :download_remote_picture, :if => :picture_url_provided?,
  # validates_presence_of :picture_remote_url, :if => :picture_url_provided?,
  # :message => 'is invalid or inaccessible'
  #


  def index
    @visuals = Visual.all

  end

  def show
  end

  def new
    @visual = current_user.visuals.build
  end

  def edit
  end

  def create
    @visual = Visual.new(visual_params)
    @visual.user_id = @user.id
    if @visual.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @visual = Visual.find(params[:id])
    if @visual.update(visual_params)
      redirect_to visuals_path
    else
      render 'edit'
    end
  end

  def destroy
    @visual = Visual.find(params[:id])
    if @visual.destroy
      redirect_to visuals_path
    else
      render 'edit'
    end
  end

  private

    def set_visual
      @visual = Visual.find(params[:id])
    end

    def visual_params
      params.require(:visual).permit(:title, :description, :picture, :giphy_url)
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def auth_user
      @visual = Visual.find(params[:id])
      unless current_user.id == @visual.user_id
      redirect_to visuals_path
      end
    end

    # def picture_url_provided?
    #   !self.image_url.blank?
    # end
    #
    # def download_remote_picture
    #   io = open(URI.parse(image_url))
    #   self.original_filename = io.base_uri.path.split('/').last
    #   self.picture = io
    #   self.picture_remote_url = image_url
    #   rescue # catch url errors with validations instead of exceptions (Errno::ENOENT, OpenURI::HTTPError, etc...)
    # end
end
