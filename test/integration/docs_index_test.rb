require 'test_helper'

class DocsIndexTestTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:omar)
  end
  
  test "should block index when not logged in " do
    get docs_path
    assert_not flash.empty?
    assert_redirected_to login_path
  end
  
  test "should block file upload when not logged in" do
    get new_doc_path
    assert_not flash.empty?
    assert_redirected_to login_path
  end
  
#  test 'file upload present' do
#    log_in_as @user
#    get new_doc_path
#    assert_select 'input[type=file]'
#   
#    picture = fixture_file_upload('test/fixtures/rails.png', 'image/png')
#    
#    get new_doc_path, doc: { title: "rails image", asset: picture }
#    assert assigns(:doc).asset?
#  end
  
end
