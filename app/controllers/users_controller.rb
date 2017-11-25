class UsersController < ApplicationController
  def new
  end

  def downgrade
  end

  def perform_downgrade
    if downgrade_current_user
      make_wikis_public
      flash[:notice] = "Your account has been downgraded, #{current_user.email}!"
      redirect_to wikis_path(current_user) # or wherever
    end
  end

  private
    def downgrade_current_user
      current_user.update_attribute(:role, 'standard')
      current_user.save!
    end

    def make_wikis_public
      current_user.wikis.update_all(private: false)
    end

end
