class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /diff_answers/1.json
  def show
    render json: { data: @answer.text }
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @answer.save
        format.html { redirect_to question_path(@answer.question) }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    AcceptCorrectionService.new(@answer, params.dig(:answer, :correction_id), params.dig(:answer, :text)).call
    respond_to do |format|
      format.html { redirect_to question_path(@answer.question) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:text, :question_id, :correction_id)
    end
end
