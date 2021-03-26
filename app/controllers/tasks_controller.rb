class TasksController < ApplicationController
    before_action :require_user_logged_in 

    def index
        @tasks = current_user.tasks.all
    end

    def show
        correct_user
        @task = Task.find(params[:id])
    end
    
    def new
        @task = current_user.tasks.build
    end
    
    def create
        @task = current_user.tasks.build(task_params)
        if @task.save
            flash[:sucess] = 'Taskが正常に登録されました'
            redirect_to @task
        else
            flash.now[:danger] = 'Taskが登録されませんでした'
            render :new
        end
        
    end
    
    def edit
        correct_user
        @task = Task.find(params[:id])
    end
    
    def update
        correct_user
        @task = Task.find(params[:id])
        if @task.update(task_params)
            flash[:success] = 'Taskは正常に更新されました'
            redirect_to @task
        else
            flash.now[:danger] = 'Taskは更新されませんでした'
            render :edit
        end
    end
    
    def destroy
        correct_user
        @task = Task.find(params[:id])
        @task.destroy
        flash[:success] = 'Taskは正常に削除されました'
        redirect_to tasks_url
    end
    
    private
    
    # Strong Parameter
    def task_params
        params.require(:task).permit(:content,:status)
    end           
    
    # 
    def correct_user
        @p = current_user.tasks.find_by(id: params)
        unless @p
         redirect_to root_url
        end
    end
end