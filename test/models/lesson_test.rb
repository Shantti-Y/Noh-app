require 'test_helper'

class LessonTest < ActiveSupport::TestCase

  def setup
     @lesson = Lesson.new(
                           title:            "例えば",
                           description:      "能楽の色々な説明がここに入ります。",
                           genre:            "二番目物",
                           location:         "京都のどこか",
                           characters:       {
                                             "人物A" => "当演目のシテ方",
                                             "人物B" => "当演目のワキ方"
                                             }
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

  test "location should be present" do
     @lesson.location = ""
     assert_not @lesson.valid?
  end

  test "characters should be refered in hash" do
     assert_equal @lesson.characters["人物A"], "当演目のシテ方"
     @lesson.characters["人物B"] = "ワキ方からシテ方へ"
     @lesson.save
     assert_equal @lesson.reload.characters["人物B"], "ワキ方からシテ方へ"
  end
end
