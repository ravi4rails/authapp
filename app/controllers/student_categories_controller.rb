class StudentCategoriesController < ApplicationController
  before_action :set_student_category, only: [:show, :edit, :update, :destroy]

  # GET /student_categories
  # GET /student_categories.json
  def index
    @student_categories = StudentCategory.all
  end

  # GET /student_categories/1
  # GET /student_categories/1.json
  def show
  end

  # GET /student_categories/new
  def new
    @student_category = StudentCategory.new
  end

  # GET /student_categories/1/edit
  def edit
  end

  # POST /student_categories
  # POST /student_categories.json
  def create
    @student_category = StudentCategory.new(student_category_params)

    respond_to do |format|
      if @student_category.save
        format.html { redirect_to @student_category, notice: 'Student category was successfully created.' }
        format.json { render :show, status: :created, location: @student_category }
      else
        format.html { render :new }
        format.json { render json: @student_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_categories/1
  # PATCH/PUT /student_categories/1.json
  def update
    respond_to do |format|
      if @student_category.update(student_category_params)
        format.html { redirect_to @student_category, notice: 'Student category was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_category }
      else
        format.html { render :edit }
        format.json { render json: @student_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_categories/1
  # DELETE /student_categories/1.json
  def destroy
    @student_category.destroy
    respond_to do |format|
      format.html { redirect_to student_categories_url, notice: 'Student category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_category
      @student_category = StudentCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_category_params
      params.require(:student_category).permit(:name)
    end
end
