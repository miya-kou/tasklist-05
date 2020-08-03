class TasksController < ApplicationController
  def index
    if params[:month].nil?
      target_date_time = Time.current
    else
      str_month = params[:month]
      target_date_time = DateTime.parse("#{str_month}01")
    end
    target_range = target_date_time.beginning_of_month..target_date_time.end_of_month
    @task = Task.where(playback: '○').maximum(:meter)
    if @task.nil?
      @task = Task.where(
      playback: '○',
      date: target_date_time.prev_month.beginning_of_month..target_date_time.prev_month.end_of_month
    ).maximum(:meter)
    end
    
    @tasks = Task.where(date: target_range).order('date ASC')
    @task_meter= Task.all
    @this_month = target_date_time.strftime("%Y%m")
    @next_month = target_date_time.next_month.strftime("%Y%m")
    @last_month = target_date_time.prev_month.strftime("%Y%m")
    
    @task_month = Task.where(
      date: target_date_time.prev_month.beginning_of_month..target_date_time.prev_month.end_of_month
    ).maximum(:meter)

    if @task_month.nil?
      @task_month = 0
    end
  end
  
  
  def indexfinish
  end
  
  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = session[:user_id] 
    if @task.save
      flash[:success] = '点検記録が投稿されました'
      redirect_to @task
    else
      flash[:danger] = '点検記録が投稿されません'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = '点検記録が投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = '点検記録が投稿されません'
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    flash[:success] = '点検記録が削除されました'
    redirect_to tasks_path
  end
  
  private

  def task_params
    params.require(:task).permit(:name,:date,:judgmente,:meter,:playback)
  end
end
