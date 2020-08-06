class FollowersController < ApplicationController
  def new

    @follower = current_user.active_relationships.new(followed_id: params[:user_id])
  if @follower.save 
  	redirect_to users_path, notice: 'Following.' 
  else
  	redirect_to users_path, notice: 'cannot follow this user'
  end
end
   def create; end
end
