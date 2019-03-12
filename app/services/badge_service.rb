class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def find_badges
    badges = []
    Badge.all.each {|badge| send("#{badge.rule_type}_award", badges, badge)}
    badges
  end

  private

  def category_award(badges, badge)
    badges << badge if all_in_category?("Backend")
  end

  def attempt_award(badges, badge)
    badges << badge if first_attempt?(@test)
  end

  def level_award(badges, badge)
    badges << badge if certain_level?(1)
  end

  def all_in_category?(category_name)
    Test.categories_by_name(category_name).count == 0 ? false :
        Test.categories_by_name(category_name).count == @user.completeded_tests.categories_by_name(category_name).count
  end
  
  def first_attempt?(test)
    @user.tests.where(id: test.id).count == 1 && @test_passage.passed == true
  end

  def certain_level?(level)
    Test.where(level: level).count == 0 ? false :
        Test.where(level: level).count == @user.completeded_tests.where(level: level).count
  end
end