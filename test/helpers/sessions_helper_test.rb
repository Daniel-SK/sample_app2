require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @user = users(:michael)
    remember(@user)
  end

  # current_userの分岐ができているかテスト
  test "current_user returns right user when session is nil" do
    assert_equal @user, current_user
    assert t_logged_in?
  end

  # remember_digestとcookies[:remember_token]を比較するauthenticated?メソッドをテスト
  test "current_user returns nil when remember_digest is wrong" do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end
end
