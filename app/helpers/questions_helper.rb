module QuestionsHelper

  def question_header
    str = ''
    if params[:action] == 'new'
      str = "Create New '#{@test.title}' Question"
    else
      str = "Edit '#{@question.test.title}' Question"
    end
    str
  end

  def current_year
    Time.now.strftime("%Y")
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
end