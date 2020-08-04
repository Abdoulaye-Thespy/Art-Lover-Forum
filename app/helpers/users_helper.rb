module UsersHelper
  def add_btn(user)
    ren if user == current_user
  end
end
