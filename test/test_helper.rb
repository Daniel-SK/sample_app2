ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include ApplicationHelper

  # テストユーザーがログイン中の場合にtrueを返す
  def t_logged_in?
    !session[:user_id].nil?
  end

  # テストユーザーとしてログインする
  def t_log_in(user)
    session[:user_id] = user.id
  end
end

class ActionDispatch::IntegrationTest

  # テストユーザーとしてログインする
  def t_log_in(user, password: 'password', remember_me: '1')
    post login_path, params: { session: { email: user.email,
                                          password: password,
                                          remember_me: remember_me } }
  end
end
