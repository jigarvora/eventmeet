module CurrentUser
  extend ActiveSupport::Concern

  private

    def set_user 
      @user = User.find(current_user.id)
    end
end