require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get books_path
    assert_response :success
    assert_match(/Library/, response.body)
  end

  test "should get new" do
    get books_new_path
    assert_response :success
    assert_match(/Title/, response.body)
  end

  test "can add new book" do
    post books_path params: { book: { name: "Ender's Game", description: "My fave book!", isbn_number: "9039410" } }
    assert_response :redirect
    assert_equal "Ender's Game", Book.last.name
  end

  test "can view specific book" do
    enders_game = Book.create!(name: "Ender's Game", description: "My fave")
    get book_path(enders_game.id)
    assert_match(/You picked.../, response.body)
  end

end
