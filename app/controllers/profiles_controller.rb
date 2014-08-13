class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  def edit
    @profile = current_user.profile
  end

  def update
    profile = current_user.profile
    if profile.update(profile_params)
      profile.account = set_up_account(profile.account_type)
      profile.save
      redirect_to [current_user, profile]
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :name,
      :pen_name,
      :account_type,
      :age,
      :gender,
      :birthday,
      :country,
      :address,
      :city,
      :state,
      :zipcode,
      :website,
      :avatar
    )
  end

  def set_up_account(account_type)
    account_class = account_type.constantize
    account_class.create
  end
end
