class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @project = @user.projects
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to :back
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
    redirect_to :back
  end


  def edit
  	@user = current_user
    @contribution_frequencies = User.contribution_frequencies
    @genders = User.genders
  end

  def update
  	@user = User.find(params[:id])
    @contribution_frequencies = User.contribution_frequencies
    @genders = User.genders
    if @user.update(user_params)
      redirect_to @user, notice: "Votre profil a bien ete mis a jour"
    else
      render action: "edit", notice: "Oups, veuillez reessayer"
    end
  end

  def user_params
    params.require(:user).permit(:email, :name, :first_name, :last_name, :birth_date, :birth_place,
                                  :pays, :address,
    															:prefix, :phone, :skype,
															    :membership, :skills,
															    :contribution, :contribution_frequency, :total_contribution,
                                  :director, :avatar, :gender)
  end

end
