module V1
  class BookCopiesController < ApplicationController
    before_action :set_book_copy, only: [:show, :destroy, :update]

    def index
      book_copies = BookCopy.preload(:book, :user, book: [:author]).paginate(page: params[:page])
      render json: book_copies, meta: pagination(book_copies), adapter: :json
    end

    def show
      render json: @book_copy, adapter: :json
    end

    def create
      book_copy = BookCopy.new(book_copy_params)
      if book_copy.save
        render json: book_copy, adapter: :json, status: 201
      else
        render json: { error: book_copy.errors }, status: 422
      end
    end

    def update
      if @book_copy.update(book_copy_params)
        render json: @book_copy, adapter: :json, status: 200
      else
        render json: { error: @book_copy.errors }, status: 422
      end
    end

    def destroy
      @book_copy.destroy
      head 204
    end

    private

    def set_book_copy
      @book_copy = BookCopy.find(params[:id])
    end

    def book_copy_params
      params.require(:book_copy).permit(:first_name, :last_name)
    end
  end
end
