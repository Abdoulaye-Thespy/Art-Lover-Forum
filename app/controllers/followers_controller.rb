class FollowersController < ApplicationController
		def new
	@follower = current_user.active_relationships.new(followed_id: params[:user_id])
 
      if @follower.save
         redirect_to users_path, notice: 'Following.' 
      end

    end

	 # POST /tweeets
  # POST /tweeets.json
  def create
  end
end
