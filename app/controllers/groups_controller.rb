class GroupsController < ApplicationController
  helper_method :group
  helper_method :user

  def index
  end

  def create
    user  = User.create!
    group = Group.create!(
      url: params[:url],
      owner_id: user.id
    )

    cookies.signed[:user_id] = user.id

    redirect_to "/groups/#{group.id}"
  end

  def show
    @group = Group.find(params[:id])
  end

private

  def group
    @group ||= Group.find(params[:id])
  end

  def user
    @user ||= User.find(session[:user_id])
  end
end
