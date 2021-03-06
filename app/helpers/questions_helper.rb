module QuestionsHelper

  def question_header(question)
    if question.new_record?
      "Create New '#{@test.title}' Question"
    else
      "Edit '#{question.test.title}' Question"
    end
  end

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'Test-Guru', "https://github.com/#{author}/#{repo}"
  end
end