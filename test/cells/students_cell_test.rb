require 'test_helper'

class StudentsCellTest < Cell::TestCase
  test "record" do
    invoke :record
    assert_select "p"
  end
  

end
