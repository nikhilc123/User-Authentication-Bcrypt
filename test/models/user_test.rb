require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should have a name" do
    a = User.new
    a.name = "Nikhil"
    #assert a.name == "Nikhil"
    assert_equal "Nikhil", a.name
  end

  test "should have email" do
    a = User.new email: "nikhil@example.com"
    assert_equal "nikhil@example.com", a.email
  end

  test "should NOT store plain password to the database" do
    User.create! email:"nikhil@example.com", password: "password"
    #a = User.last because when you create new user that points to the last

    a = User.last
    assert_equal "nikhil@example.com", a.email
    assert_nil a.password
  end

  test "#valid_password? should work" do
    a = User.create! email: "nikhil@example.com", password: "example"
    assert_equal false, a.authenticate("wrong")
    assert_equal true, a.authenticate("example")
    #assert_equal a,  a.authenticate("example")
    #assert_equal a,  a.authenticate("")
    assert_equal false, a.authenticate(nil)
    assert_equal false, a.authenticate(123)
  end
end
