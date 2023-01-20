class BooksController < ApplicationController

  def index #投稿一覧と新規投稿
   @books = Book.all
   @book = Book.new
  end
  
  def create #保存機能（投稿が成功したら投稿したidの詳細ページへ、失敗したら投稿フォームにエラーを出す）
   @book = Book.new(book_params)
   if @book.save
    redirect_to book_path(@book.id)
   else
    render :index
   end
  end

  def show #詳細ページ
   @book = Book.find(params[:id])
  end

  def edit #編集ページ
   @book = Book.find(params[:id])
  end
  
  def update
   @book = Book.find(params[:id])
   if @book.update(book_params)
    redirect_to book_path(book.id)
   else
    render :index
   end
  end

  
  def destroy
   @book = Book.find(params[:id])
   @book.destroy
   redirect_to'/books'
  end

private
 def book_params
   params.require(:book).permit(:title,:body)
 end

end