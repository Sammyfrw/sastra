class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  def new
    @profile = current_user.build_profile
  end

  def create
    profile = current_user.build_profile(profile_params)
    if profile.save
      redirect_to [current_user, profile]
    else
      render :new
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    profile = current_user.profile
    if profile.update(profile_params)
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
end
