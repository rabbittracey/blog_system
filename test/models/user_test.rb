require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user=User.new(name: "Example User", email: "user@example.com",password: "foobar",
    password_confirmation: "foobar")

  end
  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name=" "
    assert_not @user.valid?
  end
  test "email should be present" do
    @user.email=" "
    assert_not @user.valid?
  end
  test "email should not be too long" do
    @user.email="a"*224+"@gmail.com"
    assert_not @user.valid?

  end

  test "email validation should reject invalid address " do
    invalid_address= %w[user.example,com user_at_foo@.org user.name@example. foo@bar_bar.com foo@bar+bar.com]
    invalid_address.each do |t|
      @user.email=t
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"

    end
  end
  test "email should be unique" do
    duplicate_user=@user.dup
    duplicate_user.email=@user.email.upcase
    @user.save
    assert_not duplicate_user.valid?

  end
  test "email has minimum length " do
    @user.password=@user.password_confirmation="a"*5
    @user.save
    assert_not @user.valid?
  end
end
