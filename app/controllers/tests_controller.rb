class TestsController < ApplicationController

  before_action :authenticate_user!

  def index
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])

    if @test.have_questions_and_answers?
      current_user.tests.push(@test)
      #current_user.update(attempt: current_user.attempt += 1)
      redirect_to current_user.test_passage(@test), notice: "#{current_user.attempt}"#t('.begin', title: @test.title)
    else
      redirect_to root_path, alert: 'Нужно создать вопросы и ответы для теста!'
    end
  end
end
