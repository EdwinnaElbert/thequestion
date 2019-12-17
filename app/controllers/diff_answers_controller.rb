class DiffAnswersController < ApplicationController

  # GET /diff_answers/1
  # GET /diff_answers/1.json
  def show
    @diff_answer = DiffAnswer.find(params[:id])
    render json: { data: @diff_answer.text }
  end
end
