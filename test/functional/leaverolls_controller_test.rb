require 'test_helper'

class LeaverollsControllerTest < ActionController::TestCase
  setup do
    @leaveroll = leaverolls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leaverolls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leaveroll" do
    assert_difference('Leaveroll.count') do
      post :create, leaveroll: { approved: @leaveroll.approved, empno: @leaveroll.empno, lfrom: @leaveroll.lfrom, lto: @leaveroll.lto, ltype: @leaveroll.ltype, notes: @leaveroll.notes, totdays: @leaveroll.totdays }
    end

    assert_redirected_to leaveroll_path(assigns(:leaveroll))
  end

  test "should show leaveroll" do
    get :show, id: @leaveroll
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leaveroll
    assert_response :success
  end

  test "should update leaveroll" do
    put :update, id: @leaveroll, leaveroll: { approved: @leaveroll.approved, empno: @leaveroll.empno, lfrom: @leaveroll.lfrom, lto: @leaveroll.lto, ltype: @leaveroll.ltype, notes: @leaveroll.notes, totdays: @leaveroll.totdays }
    assert_redirected_to leaveroll_path(assigns(:leaveroll))
  end

  test "should destroy leaveroll" do
    assert_difference('Leaveroll.count', -1) do
      delete :destroy, id: @leaveroll
    end

    assert_redirected_to leaverolls_path
  end
end
