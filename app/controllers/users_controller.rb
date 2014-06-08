class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  	@user = current_user
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: "Votre profil a bien ete mis a jour"
    else
      render action: "edit", notice: "Oups, veuillez reessayer"
    end
  end

  def user_params
    params.require(:user).permit(:email, :name, :first_name, :last_name, :birth_date, :birth_place,
    															:phone, :skype,
															    :membership, :skills,
															    :contribution, :contribution_frequency, :total_contribution)
  end

end
