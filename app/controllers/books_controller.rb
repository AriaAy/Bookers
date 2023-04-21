class BooksController < ApplicationController
  # データの新規作成フォームを表示するアクション
  # def new
  #   @book = Book.new
  # end

  # データを追加（保存）するアクション
  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  # データを追加（保存）するアクション
  def index
    @books = Book.all
    @book = Book.new
  end

  # データの内容（詳細）を表示するアクション
  def show
    @book = Book.find(params[:id])
  end

  # データを更新するためのフォームを表示するアクション
  def edit
    @book = Book.find(params[:id])
  end

  # データを更新するアクション
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  # データを削除するアクション
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
