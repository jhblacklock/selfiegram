class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :update, :destroy]
  before_action :set_user, only: [:show, :update, :destroy, :index, :create]

  def index
    @images = @user.images.paginate(paginate_options)
  end

  def popular
    @images = Image.popular
  end

  def show; end

  def create
    @image = @user.images.new(image_params)

    if @image.save
      render :show, status: :created, location: user_image_url(@user, @image)
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  def update
    if @image.update(image_params)
      render :show, status: :ok, location: user_image_url(@user, @image)
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @image.destroy
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def image_params
    params.require(:image).permit(:url, :caption, :user_id)
  end
end
