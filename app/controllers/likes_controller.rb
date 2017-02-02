class LikesController < ApplicationController
  before_action :set_like, only: [:show, :update, :destroy]
  before_action :set_image, only: [:index, :followers, :create]

  def index
    @likes = @image.get_likes.paginate(paginate_options)
  end

  def show; end

  def create
    @liker = User.find(params[:like][:by])
    liked = @image.liked_by(@liker)

    # Have to find.  Does not return obj
    @like = Like.find_by(votable_id: @image.id, voter_id: @liker.id)

    if liked
      loc = user_image_like_url(@liker.id, @image.id, @like.id)
      render :show, status: :created, location: loc
    else
      render json: @like, status: :unprocessable_entity
    end
  end

  def update
    if @like.update(like_params)
      render :show, status: :ok, location: @like
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @like.destroy
  end

  private

  def set_like
    @like = Like.find(params[:id])
  end

  def set_image
    @image = Image.find(params[:image_id])
  end

  def like_params
    params.fetch(:like, {}).permit(:by)
  end
end
