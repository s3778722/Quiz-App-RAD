class QuizItemsController < ApplicationController
  before_action :set_quiz_item, only: %i[ show edit update destroy ]

  # GET /quiz_items or /quiz_items.json
  def index
    @quiz_items = QuizItem.all
  end

  # GET /quiz_items/1 or /quiz_items/1.json
  def show
  end

  # GET /quiz_items/new
  def new
    @quiz_item = QuizItem.new
  end

  # GET /quiz_items/1/edit
  def edit
  end

  # POST /quiz_items or /quiz_items.json
  def create
    @quiz_item = QuizItem.new(quiz_item_params)

    respond_to do |format|
      if @quiz_item.save
        format.html { redirect_to @quiz_item, notice: "Quiz item was successfully created." }
        format.json { render :show, status: :created, location: @quiz_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quiz_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quiz_items/1 or /quiz_items/1.json
  def update
    respond_to do |format|
      if @quiz_item.update(quiz_item_params)
        format.html { redirect_to @quiz_item, notice: "Quiz item was successfully updated." }
        format.json { render :show, status: :ok, location: @quiz_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quiz_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_items/1 or /quiz_items/1.json
  def destroy
    @quiz_item.destroy
    respond_to do |format|
      format.html { redirect_to quiz_items_url, notice: "Quiz item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_item
      @quiz_item = QuizItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quiz_item_params
      params.require(:quiz_item).permit(:qid, :question, :description, :answers, :multiple_correct_answers, :correct_answers, :explanation, :tip, :tags, :category, :difficulty)
    end
end
