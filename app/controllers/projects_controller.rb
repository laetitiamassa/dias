class ProjectsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :correct_user, :only => [:edit, :update]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all.order('id DESC')
    @project = current_user.projects.build if current_user
    @user = current_user
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @user = current_user
  end

  def follow
    @project = Project.find(params[:id])
    current_user.follow(@project)
    redirect_to :back, notice: "Merci de soutenir ce projet !"
  end

  def unfollow
    @project = Project.find(params[:id])
    current_user.stop_following(@project)
    redirect_to :back
  end

  # GET /projects/new
  def new
    @project = current_user.projects.build
    @user = current_user
  end

  # GET /projects/1/edit
  def edit
    @user = current_user
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.build(project_params)
    @user = current_user

    respond_to do |format|
      if @project.save
        format.html { redirect_to root_path, notice: 'Felicitations, votre projet est publie !' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @user = current_user
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Votre projet a bien ete mis a jour' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def correct_user
      @project = current_user.projects.find_by(id: params[:id])
      redirect_to projects_path, notice: t("Vous ne pouvez pas modifier cela") if @project.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :description,
                                      :country, :sector,
                                      :budget, :funding, :deadline)
    end

  def markdown(content)
    markdown =Redcarpet::Markdown.new(Redcarpet::Render::XHTML,:hard_wrap=>true,:filter_html=>true,:autolink=>true,:no_intra_emphasis=>true)
    markdown.render(content).html_safe
  end
  
end
