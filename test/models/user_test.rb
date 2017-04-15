require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
     @master = User.new(
                        name:                   "師匠",
                        email:                  "master@yahoo.co.jp",
                        password:               "password",
                        password_confirmation:  "password",
                        master_id:              nil,
                        role:                   1
                       )
     @pupil  = User.new(
                        name:                   "弟子",
                        email:                  "pupil@gmail.com",
                        password:               "password",
                        password_confirmation:  "password",
                        master_id:              users(:master_a).id,
                        role:                   2
                       )
  end

  test "should be valid" do
     assert @master.valid?
     assert @pupil.valid?
  end

  test "name should be present" do
     @master.name = ""
     assert_not @master.valid?
  end

  # TODO nameのlengthバリデーション追加時にテストも併記

  test "email should be present" do
     @master.email = ""
     assert_not @master.valid?
  end

   test "email should be in a proper format" do
      valid_addresses = [
                         "user@example.com",
                         "user@mail.co.jp",
                         "USER@foo.com",
                         "foo_bar+oh@mail.com"
                        ]
      valid_addresses.each do |address|
         @master.email = address
         assert @master.valid?
      end
   end

   # TODO emailのlengthバリデーション追加時にテストも併記

   test "password should be present" do
      @master.password = ""
      @master.password_confirmation = ""
      assert_not @master.valid?
   end

   test "password should match with its confirmation" do
      @master.password = "drowssap"
      assert_not @master.valid?
      @master.password_confirmation = @master.password
      assert @master.valid?
   end

   # TODO passwordのlengthバリデーション追加時にテストも併記

   test "master should not have any master id" do
      @master.master_id = users(:master_a).id
      assert_not @master.valid?
   end

   test "pupil should have a relative master id" do
      @pupil.master_id = nil
      assert_not @pupil.valid?
   end

   test "role should be present" do
      @master.role = ""
      assert_not @master.valid?
   end

   test "role should be 1 or 2 as master or pupil respectively" do
      roles = [0, 3, 4, 5]
      roles.each do |key|
         @master.role = key
         assert_not @master.valid?
      end
   end
end
