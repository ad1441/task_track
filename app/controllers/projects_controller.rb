class ProjectsController < ApplicationController
  def index
    @projects = current_user.projects.all.sort{|a,b| a.period.date_start <=> b.period.date_start}
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new
    @project.description = params[:description]
    @project.name = params[:name]
    @project.period_id = params[:period_id]

    if @project.save
      redirect_to "/periods/" + @project.period_id.to_s, :notice => "Project created successfully."
    else
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    @project.description = params[:description]
    @project.name = params[:name]
    @project.period_id = params[:period_id]

    if @project.save
      redirect_to "/projects", :notice => "Project updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])

    @project.destroy

    redirect_to "/projects", :notice => "Project deleted."
  end
end
