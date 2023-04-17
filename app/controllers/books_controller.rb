class BooksController < ApplicationController
  # データの新規作成フォームを表示アクション
  def new
    @book = Book.new
  end
  
  # データを追加（保存）アクション
  def create
    # book = Book.new(book_params)
    # book.save
    # flash[:notice] = "Book was successfully created."
    # redirect_to book_path(book.id)
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  # データを追加（保存）アクション
  def index
    @books = Book.all
  end

  # データの内容（詳細）を表示アクション
  def show
    @book = Book.find(params[:id])
  end

  # データを更新するためのフォームを表示アクション
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    # book = Book.find(params[:id])
    # book.update(book_params)
    # redirect_to book_path(book.id)
    @book = Book.find(params[:id])
    if @book.save
      flash[:notice] = "Book was successfully update."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  def destroy
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
