require 'test_helper'

class LessonLogTest < ActiveSupport::TestCase

   def setup
      @pupil = users(:pupil_a)
      @lesson = lessons(:benkei)
      @log = LessonLog.new(
                           user_id:       @pupil.id,
                           lesson_id:     @lesson.id,
                           points:        25,
                           lesson_date:   Time.now
                          )
   end

   test "should be valid" do
      assert @log.valid?
   end

   test "user_id should be present" do
      @log.user_id = ""
      assert_not @log.valid?
   end

   test "lesson_id should be present" do
      @log.lesson_id = ""
      assert_not @log.valid?
   end

   test "points should be between 0 and 50" do
      acceptable_nums = [0, 50]
      acceptable_nums.each do |num|
         @log.points = num
         assert @log.valid?
      end

      unacceptable_nums = [-1, 51, 100]
      unacceptable_nums.each do |num|
         @log.points = num
         assert_not @log.valid?
      end
   end

   test "lesson_date should be present" do
      @log.lesson_date = ""
      assert_not @log.valid?
   end

   test "log should be deleted when relative user destroyed" do
      @log.save
      @pupil.destroy
      assert_equal 0, @pupil.lesson_logs.count
   end

   test "log should be deleted when relative lesson destroyed" do
      @log.save
      @lesson.destroy
      assert_equal 0, @lesson.lesson_logs.count
   end

end
