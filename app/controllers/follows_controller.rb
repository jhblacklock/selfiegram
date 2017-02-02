class FollowsController < ApplicationController
  before_action :set_user, only: [:index, :followers, :create, :feed]
  before_action :set_follow, only: [:show, :update, :destroy]

  def index
    @collection = @user.following_users.paginate(paginate_options)
  end

  def followers
    @collection = @user.followers
    render :index
  end

  def feed
    ids = @user.following_users.collect(&:id)
    @images = Image.where(user_id: ids).paginate(paginate_options)
  end

  def create
    @follower = User.find(params[:follow][:by])
    @follow = @follower.follow(@user)

    if @follow.save
      @object = @follower

      render :show, status: :created, location: user_follows_url(@user.id)
    else
      render json: @follow.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @follow.destroy
  end

  private

  def set_follow
    @follow = Follow.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def follow_params
    params.fetch(:follow, {}).permit(:by)
  end
end
