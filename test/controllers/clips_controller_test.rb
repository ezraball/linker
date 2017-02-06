require 'test_helper'

class ClipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clip = clips(:one)
  end

  test "should get index" do
    get clips_url
    assert_response :success
  end

  test "should get new" do
    get new_clip_url
    assert_response :success
  end

  test "should create clip" do
    assert_difference('Clip.count') do
      post clips_url, params: { clip: { commentary: @clip.commentary, description: @clip.description, fetch_date: @clip.fetch_date, fetch_response: @clip.fetch_response, link: @clip.link, link_date: @clip.link_date, pub_date: @clip.pub_date, quote: @clip.quote, source_name: @clip.source_name, source_url: @clip.source_url, title: @clip.title } }
    end

    assert_redirected_to clip_url(Clip.last)
  end

  test "should show clip" do
    get clip_url(@clip)
    assert_response :success
  end

  test "should get edit" do
    get edit_clip_url(@clip)
    assert_response :success
  end

  test "should update clip" do
    patch clip_url(@clip), params: { clip: { commentary: @clip.commentary, description: @clip.description, fetch_date: @clip.fetch_date, fetch_response: @clip.fetch_response, link: @clip.link, link_date: @clip.link_date, pub_date: @clip.pub_date, quote: @clip.quote, source_name: @clip.source_name, source_url: @clip.source_url, title: @clip.title } }
    assert_redirected_to clip_url(@clip)
  end

  test "should destroy clip" do
    assert_difference('Clip.count', -1) do
      delete clip_url(@clip)
    end

    assert_redirected_to clips_url
  end
end
