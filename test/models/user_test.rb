require "test_helper"

class UserTest < ActiveSupport::TestCase
  # ユーザー作成のテスト
  test "should create user with valid attributes" do
    user = User.new(
      username: "testuser",
      email: "test@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
    assert user.valid?
  end

  # バリデーションのテスト
  test "should not create user without username" do
    user = User.new(
      email: "test@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
    assert_not user.valid?
    assert_includes user.errors[:username], "can't be blank"
  end

  test "should not create user with duplicate email" do
    User.create!(
      username: "firstuser",
      email: "duplicate@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
    
    user = User.new(
      username: "seconduser",
      email: "duplicate@example.com",
      password: "password456",
      password_confirmation: "password456"
    )
    
    assert_not user.valid?
    assert_includes user.errors[:email], "has already been taken"
  end

  test "should not create user with duplicate username" do
    User.create!(
      username: "duplicate_name",
      email: "first@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
    
    user = User.new(
      username: "duplicate_name",
      email: "second@example.com",
      password: "password456",
      password_confirmation: "password456"
    )
    
    assert_not user.valid?
    assert_includes user.errors[:username], "has already been taken"
  end
end