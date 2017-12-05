require 'test_helper'

class SubscriberTest < ActiveSupport::TestCase
  def setup
    @subscriber = Subscriber.new(first_name: "Jenny", last_name: "Tutone", phone_number: "+12098675309", password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @subscriber.valid?
  end

  test "first name should be present" do
    @subscriber.first_name = "   "
    assert_not @subscriber.valid?
  end

  test "last name should be present" do
    @subscriber.last_name = "   "
    assert_not @subscriber.valid?
  end

  test "phone number should be present" do
    @subscriber.phone_number = "  "
    assert_not @subscriber.valid?
  end

  test "first name should not be too long" do
    @subscriber.first_name = "a" * 51
    assert_not @subscriber.valid?
  end

  test "last name should not be too long" do
    @subscriber.last_name = "a" * 51
    assert_not @subscriber.valid?
  end

  test "phone number should not be too long" do
    @subscriber.phone_number = "1" * 13
    assert_not @subscriber.valid?
  end

  test "phone number validation should accept valid phone numbers" do
    valid_numbers = %w[+12098675309 +00000000000 +11111111111 +22222222222 +12095555555]
    valid_numbers.each do |valid_number|
      @subscriber.phone_number = valid_number
      assert @subscriber.valid?, "#{valid_number.inspect} should be valid"
    end
  end

  test "phone number validation should reject invalid numbers" do
    invalid_numbers = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_numbers.each do |invalid_number|
      @subscriber.phone_number = invalid_number
      assert_not @subscriber.valid?, "#{invalid_number.inspect} should be invalid"
    end
  end

  test "phone numbers should be unique" do
    duplicate_subscriber = @subscriber.dup
    duplicate_subscriber.phone_number = @subscriber.phone_number
    @subscriber.save
    assert_not duplicate_subscriber.valid?
  end

  test "password should be present (nonblank)" do
    @subscriber.password = @subscriber.password_confirmation = " " * 6
    assert_not @subscriber.valid?
  end

  test "password should have a minimum length" do
    @subscriber.password = @subscriber.password_confirmation = "a" * 5
    assert_not @subscriber.valid?
  end
end
