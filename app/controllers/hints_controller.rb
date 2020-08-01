class HintsController < ApplicationController
	def new
		fail
	end

	 # POST /tweeets
  # POST /tweeets.json
  def create
    @hint = current_user.hints.build(hint_params)
    
    respond_to do |format|
      if @hint.save
        format.html { redirect_to users_path, notice: 'Hint was successfully created.' }
        format.json { render :show, status: :created, location: @tweeet }
      else
        format.html { render :new }
        format.json { render json: @tweeet.errors, status: :unprocessable_entity }
      end
    end
  end



	private

    def hint_params
      params.require(:hint).permit(:text)
    end
end
