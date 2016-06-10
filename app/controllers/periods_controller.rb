class PeriodsController < ApplicationController
  def index
    @periods = current_user.periods.sort{|a,b| a.date_start <=> b.date_start}
  end

  def show
    @period = Period.find(params[:id])
  end

  def new
    @period = Period.new
  end

  def create
    @period = Period.new
    @period.user_id = params[:user_id]
    @period.date_start = Chronic.parse(params[:date_start])
    @period.name = params[:name]

    if @period.save
      redirect_to "/periods", :notice => "Period created successfully."
    else
      render 'new'
    end
  end

  def edit
    @period = Period.find(params[:id])
  end

  def update
    @period = Period.find(params[:id])

    @period.user_id = params[:user_id]
    @period.date_start = Chronic.parse(params[:date_start])
    @period.name = params[:name]

    if @period.save
      redirect_to "/periods", :notice => "Period updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @period = Period.find(params[:id])

    @period.destroy

    redirect_to "/periods", :notice => "Period deleted."
  end
end
