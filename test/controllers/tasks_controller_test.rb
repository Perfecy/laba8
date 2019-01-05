require 'test_helper'
class TasksControllerTest < ActionDispatch::IntegrationTest

  test 'should get input' do
    get tasks_input_url
    assert_response :success
  end

  test 'should get answer' do
    get tasks_answer_url params: { n: '1 2 3 3 4 5 6 7 8 1 2 3 3 3 3 34 35 72 96 15 35 46 73' }
    assert_response :success
  end



  test  '1_posl' do
    get tasks_answer_url params: { n: '1 2 3 3 4 5 6 7 8 1 2 3 3 3 3 34 35 72 96 15 35 46 73'}
    assert_equal assigns[:posled], [[3,4,5,6,7,8], [3,34,35,72,96], [15,35,46,73], [1,2,3], [1,2,3]]
  end

  test '2_col' do
    get tasks_answer_url params: { n: '110 100 90 80 70 60 50 40 30 20 10 9 8 7 6 5 4 3 2 1' }
    assert_equal assigns[:posled], []
  end

end
