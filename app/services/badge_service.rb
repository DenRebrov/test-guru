class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def find_badges
    badges = []
    Badge.all.each do |badge|
      case badge.rule_type
        when 'category'
          badges << badge if all_in_category?("Backend")
        when 'attempt'
          badges << badge if first_attempt?(@test)
        when 'level'
          badges << badge if certain_level?(1)
      end
    end
    badges
  end

  private

  def all_in_category?(category_name)
    Test.categories_by_name(category_name).count == 0 ? false :
        Test.categories_by_name(category_name).count == @user.completeded_tests.categories_by_name(category_name).count
  end
  
  def first_attempt?(test)
    if @user.tests.where(id: test.id).count == 1
      true if @test_passage.passed == true
    end
  end

  def certain_level?(level)
    Test.easy.count == 0 ? false : Test.easy.count == @user.completeded_tests.where(level: level).count
  end
end