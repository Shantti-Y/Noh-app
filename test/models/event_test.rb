require 'test_helper'

class EventTest < ActiveSupport::TestCase

  def setup
     @lesson = lessons(:benkei)
     @event = Event.new(
                        event_date:  Date.today,
                        title:      "本日の講演会",
                        lesson_id:   @lesson.id,
                        location:    {"渋谷公会堂" => "https://www.city.shibuya.tokyo.jp/est/kokaido/" }
                       )
  end

  test "should be valid" do
     assert @event.valid?
  end

  test "event id should be increased automatically in a common title" do
     @event.save
     assert_equal @event.event_id, 1
  end

  test "event date should be present" do
     @event.event_date = ""
     assert_not @event.valid?
  end

  test "title should be present" do
     @event.title = ""
     assert_not @event.valid?
  end

  test "lesson id should be present" do
     @event.lesson_id = ""
     assert_not @event.valid?
  end

  test "event should be deleted when relative lesson destroyed" do
     @event.save
     @lesson.destroy
     assert_equal 0, @lesson.events.count
  end

  test "location should be present" do
     @event.location.delete("渋谷公会堂")
     assert_not @event.valid?
  end

  test "location should be refered in hash" do
     assert_equal @event.location["渋谷公会堂"], "https://www.city.shibuya.tokyo.jp/est/kokaido/"
  end

end
