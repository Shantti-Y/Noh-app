require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
     @master = users(:master_a)
     @log = lesson_logs(:log_a)
     @comment = Comment.new(
                            user_id:            @master.id,
                            lesson_log_id:      @log.id,
                            comment:            "調子はどう？"
                           )
  end

  test "should be valid" do
     assert @comment.valid?
  end

  test "user_id should be present" do
     @comment.user_id = ""
     assert_not   @comment.valid?
  end

  test "lesson_log_id should be present" do
     @comment.lesson_log_id = ""
     assert_not   @comment.valid?
  end

  test "comment(content) should be present" do
     @comment.comment = ""
     assert_not   @comment.valid?
  end

  test "comment should be deleted when relative user destroyed" do
     @comment.save
     @master.destroy
     assert_equal 0, @master.comments.count
  end

  test "comment should be deleted when relative lesson log destroyed" do
     @comment.save
     @log.destroy
     assert_equal 0, @log.comments.count
  end
end
