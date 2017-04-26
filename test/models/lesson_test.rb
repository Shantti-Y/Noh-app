require 'test_helper'

class LessonTest < ActiveSupport::TestCase

  def setup
     @lesson = Lesson.new(
                           title:            "演目：　例えば",
                           description:      "能楽の色々な説明がここに入ります。",
                           genre:            "二番目"
                         )
  end

  test "should be valid" do
     assert @lesson.valid?
  end

  test "title should be present" do
     @lesson.title = ""
     assert_not @lesson.valid?
  end

  test "genre should be present" do
     @lesson.genre = ""
     assert_not @lesson.valid?
  end
end
