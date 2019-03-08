class TestPassage < ApplicationRecord
  SUCCESS_RATE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: [:create, :update]

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  def success?
    if test.correct_answers_count == 0
      false
    else
      correct_questions * 100 / test.correct_answers_count >= SUCCESS_RATE
    end
  end

  def total_questions
    test.questions.size
  end

  def question_number
    test.questions.index(current_question) + 1
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort if answer_ids != nil
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_validation_set_first_question
    self.current_question = next_question
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.nil? ? 0 : current_question.id).first
  end
end
