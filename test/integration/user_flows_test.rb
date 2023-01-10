require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:one)
    @articles = articles(:one)
  end

  test 'should get index' do
    puts root_path
    get root_path
    assert_response :success
  end

#   test 'should get new' do
#     get new_article_url
#     assert_response :success
#   end

#   test 'unauthenticated users cannot get new' do
#     sign_out users(:one)

#     get new_article_url
#     assert_response :redirect
#   end

#   test 'should create article' do
#     article articles_url, params: { article: @attrs }

#     article = article.find_by! title: @attrs[:title]

#     assert_redirected_to article_url(article)
#   end

#   test 'should show article' do
#     get article_url(@article)
#     assert_response :success
#   end

#   test 'should get edit' do
#     get edit_article_url(@article)
#     assert_response :success
#   end

#   test 'should update article' do
#     patch article_url(@article), params: { article: @attrs }

#     @article.reload

#     assert { @article.title == @attrs[:title] }
#     assert_redirected_to article_url(@article)
#   end

#   test 'should destroy article' do
#     delete article_url(@article)

#     assert { !article.exists?(@article.id) }

#     assert_redirected_to articles_url
#   end
end
