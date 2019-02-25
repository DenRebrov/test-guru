module TestPassagesHelper

  def success?(test_passage)
    test_passage.correct_questions * 100 / test_passage.test.correct_answers_count >= TestPassage::SUCCESS_RATE
  end
end
