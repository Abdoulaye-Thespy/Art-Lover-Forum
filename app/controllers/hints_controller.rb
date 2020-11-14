class HintsController < ApplicationController
  def new; end

  def create
    @hint = current_user.hints.build(hint_params)

    respond_to do |format|
      if @hint.save
        format.html { redirect_to users_path, notice: 'Hint was successfully created.' }
      else
        format.html { redirect_to users_path, notice: 'Hint was not created.' }
      end
    end
  end

  private

  def hint_params
    params.require(:hint).permit(:text)
  end
end
