class AssignmentTasksController < ApplicationController
  before_action :set_assignment_task, only: [:show, :edit, :update, :destroy]

  # GET /assignment_tasks
  # GET /assignment_tasks.json
  def index
    @assignment_tasks = AssignmentTask.all
  end

  # GET /assignment_tasks/1
  # GET /assignment_tasks/1.json
  def show
  end

  # GET /assignment_tasks/new
  def new
    @assignment_task = AssignmentTask.new
  end

  # GET /assignment_tasks/1/edit
  def edit
  end

  # POST /assignment_tasks
  # POST /assignment_tasks.json
  def create
    @assignment_task = AssignmentTask.new(assignment_task_params)

    respond_to do |format|
      if @assignment_task.save
        format.html { redirect_to @assignment_task, notice: 'Assignment task was successfully created.' }
        format.json { render :show, status: :created, location: @assignment_task }
      else
        format.html { render :new }
        format.json { render json: @assignment_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignment_tasks/1
  # PATCH/PUT /assignment_tasks/1.json
  def update
    respond_to do |format|
      if @assignment_task.update(assignment_task_params)
        format.html { redirect_to @assignment_task, notice: 'Assignment task was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment_task }
      else
        format.html { render :edit }
        format.json { render json: @assignment_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignment_tasks/1
  # DELETE /assignment_tasks/1.json
  def destroy
    @assignment_task.destroy
    respond_to do |format|
      format.html { redirect_to assignment_tasks_url, notice: 'Assignment task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment_task
      @assignment_task = AssignmentTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_task_params
      params.require(:assignment_task).permit(:title, :description, :assignment_id)
    end
end
