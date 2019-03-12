class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show update result gist]

  def show; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage), notice: t('.completed')
    else
      render :show
    end
  end

  def result
    if @test_passage.success?
      @test_passage.update(passed: true)

      @badge = BadgeService.new(@test_passage).find_badges
      if @badge.present?
        current_user.badges.push(@badge)
        flash[:notice] = t('.add_badge')
      end
    end
  end

  def gist
    question = @test_passage.current_question
    result = GistQuestionService.new(question).call
    url = result.html_url

    current_user.gists.create(question_id: question.id, url: url)
    
    redirect_to @test_passage, notice: t('.success', gist_url: url)
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
