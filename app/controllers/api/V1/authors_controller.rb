class Api::V1::AuthorsController < ApplicationController
  def create
    author = Author.new(author_params)

    if author.save
      render json: {author: author}, status: :created
    else
      render json: {errors: author.errors.full_messages}, status: :unprocessable_error
    end
  end

  # TODO: ameliorate the pagination
  def index
    authors = Author.all
    render json:{authors: authors}
  end
  # TODO: ameliorate
  def show
    # author = Author.find(params[:id])
    author = Author.find_by(id: params[:id])
    if author
      render json:{author: author}
    else
      render json: {message: 'No author found for this id'}, status: 400
    end
  end

  def destroy
    author = Author.find(params[:id]).destroy
    render json: {destroy: author}
  end

  private

  def author_params
    params.require(:author).permit(:name, :age)
  end
end
