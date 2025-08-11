module ListTestHelper
  def test_list(list)
    list.append(5)
    list.append(7)
    list.append(9)

    assert_equal 9, list.get(2)
    assert_equal 7, list.remove_at(1)
    assert_equal 2, list.length

    list.append(11)
    assert_equal 9, list.remove_at(1)
    assert_nil list.remove(9)
    assert_equal 5, list.remove_at(0)
    assert_equal 11, list.remove_at(0)
    assert_equal 0, list.length

    list.prepend(5)
    list.prepend(7)
    list.prepend(9)

    assert_equal 5, list.get(2)
    assert_equal 9, list.get(0)
    assert_equal 9, list.remove(9)
    assert_equal 2, list.length
    assert_equal 7, list.get(0)
  end
end