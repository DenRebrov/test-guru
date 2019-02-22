class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  # GET /tests/id/questions
  def index
    render plain: @test.questions.inspect
  end

  # GET /questions/id
  def show
    render plain: @question.body
  end

  # GET /tests/id/questions/new
  def new
  end

  # POST /tests/id/questions
  def create
    render plain: "Создан вопрос '#{params[:question][:body]}'"

    #question = Question.create(question_params)
    #render plain: question.inspect
  end

  def destroy
    @question.destroy

    render plain: 'Вы удалили вопрос'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
