class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_day, :end_day, :all_day))
    if @schedule.save
      flash[:notice] = "スケジュールを登録しました。"
      redirect_to :schedules
    else
      flash[:notice] = "スケジュールを登録できませんでした。"
      render :new
    end
  end
  
  def show
    @schedule = Schedule.find(params[:id])
  end
  
  def edit
    @schedule = Schedule.find(params[:id])
  end
  
  def update
    @schedule = Schedule.find(params[:id])
    if @schedule = Schedule.update(params.require(:schedule).permit(:title, :start_day, :end_day, :all_day))
      flash[:notice] = "スケジュールを編集しました。"
      redirect_to :schedules
    else
      render :edit_schedule
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "スケジュールを削除しました。"
    redirect_to :schedules
  end
end
