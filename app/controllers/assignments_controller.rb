class AssignmentsController < ApplicationController
  def index
    @assignments = current_user.assignments
    @assignment = Assignment.new
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new
    @assignment.doc_link = params[:doc_link]
    @assignment.complete_status = 0
    @assignment.date_due = Chronic.parse(params[:date_due])
    @assignment.date_start = Chronic.parse(params[:date_start])
    @assignment.description = params[:description]
    @assignment.name = params[:name]
    @assignment.project_id = params[:project_id]

    if @assignment.save
      redirect_to "/projects/" + @assignment.project_id.to_s, :notice => "Assignment created successfully."
    else
      render 'new'
    end
  end

  def edit
    @assignment = Assignment.find(params[:id])
  end

  def update
    @assignment = Assignment.find(params[:id])

    @assignment.doc_link = params[:doc_link]
    @assignment.date_due = Chronic.parse(params[:date_due])
    @assignment.date_start = Chronic.parse(params[:date_start])
    @assignment.description = params[:description]
    @assignment.name = params[:name]
    @assignment.project_id = params[:project_id]

    if @assignment.save
      redirect_to "/assignments/", :notice => "Assignment updated successfully."
    else
      render 'edit'
    end
  end

  def update_complete
    @assignment = Assignment.find(params[:id])
    if @assignment.complete_status == 1
      @assignment.complete_status = 0
    else
      @assignment.complete_status = 1
    end
    @assignment.save

    if @assignment.save
      redirect_to :back, :notice => "Assignment complete!"
    else
      redirect_to :back
    end

  end

  def destroy
    @assignment = Assignment.find(params[:id])

    @assignment.destroy

    redirect_to :back, :notice => "Assignment deleted."
  end
end
