class Api::V1::BooksController < ApplicationController
  def create
    book = Book.new(book_params)
    if book.save
      render json: {book: book}, status: :created
    else
      render json: {errors: book.errors.full_messages}, status: :unprocessable_error
    end
  end

  def index
    render json: {books: Book.where(author_id:params[:author_id])}
  end

  def index_all
    books = Book.all
    if books
      render json:{books: books}
    else
      render json: {message: 'No book found'}
    end
  end

  def destroy
    book = Book.find(params[:id]).destroy
    render json: {destroy: book}
  end

  private

  def book_params
    params.require(:book).permit(:title, :author_id)
  end
end
