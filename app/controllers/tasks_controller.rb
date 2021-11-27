class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    task = Task.new({
      title: params[:task][:title],
      description: params[:task][:description]
      }) # Create new hash that holds values of param title and desc
    task.save # I have no idea, I know it says save, but in terms of underlying mechanics, I'm in the dark
    redirect_to '/tasks' # redirect back to our /tasks directory
  end

  def update
    task = Task.find(params[:id])
    task.update({
      title: params[:task][:title],
      description: params[:task][:description]
      })

    task.save
    redirect_to "/tasks/#{task.id}"
  end

  def destroy
    Task.destroy(params[:id])
    redirect_to '/tasks'
  end
end
