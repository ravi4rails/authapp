class StudentTypesController < ApplicationController
  before_action :set_student_type, only: [:show, :edit, :update, :destroy]

  # GET /student_types
  # GET /student_types.json
  def index
    @student_types = StudentType.all
  end

  # GET /student_types/1
  # GET /student_types/1.json
  def show
  end

  # GET /student_types/new
  def new
    @student_type = StudentType.new
  end

  # GET /student_types/1/edit
  def edit
  end

  # POST /student_types
  # POST /student_types.json
  def create
    @student_type = StudentType.new(student_type_params)

    respond_to do |format|
      if @student_type.save
        format.html { redirect_to @student_type, notice: 'Student type was successfully created.' }
        format.json { render :show, status: :created, location: @student_type }
      else
        format.html { render :new }
        format.json { render json: @student_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_types/1
  # PATCH/PUT /student_types/1.json
  def update
    respond_to do |format|
      if @student_type.update(student_type_params)
        format.html { redirect_to @student_type, notice: 'Student type was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_type }
      else
        format.html { render :edit }
        format.json { render json: @student_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_types/1
  # DELETE /student_types/1.json
  def destroy
    @student_type.destroy
    respond_to do |format|
      format.html { redirect_to student_types_url, notice: 'Student type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_type
      @student_type = StudentType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_type_params
      params.require(:student_type).permit(:name, :student_category_id)
    end
end
