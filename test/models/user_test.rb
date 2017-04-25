require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
     @master = User.new(
                        name:                   "師匠",
                        email:                  "master@yahoo.co.jp",
                        password:               "password",
                        password_confirmation:  "password",
                        master_id:              nil,
                        role:                   1,
                        style:                  "金剛流"
                       )
     @pupil  = User.new(
                        name:                   "弟子",
                        email:                  "pupil@gmail.com",
                        password:               "password",
                        password_confirmation:  "password",
                        master_id:              users(:master_a).id,
                        role:                   2,
                        style:                  "金剛流"
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

   test "password should have more than 4 chars" do
      @master.password = @master.password_confirmation = "p" * 4
      assert @master.valid?
      @master.password = @master.password_confirmation = "p" * 3
      assert_not @master.valid?
   end

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
      roles = { maste: 0, aster: 3, upil: 4, pupi: 5 }
      assert_raises ArgumentError do
         roles.each do |key|
            @master.role = key
         end
      end
   end

   test "style should be present" do
      @master.style = ""
      assert_not @master.valid?
   end
end
