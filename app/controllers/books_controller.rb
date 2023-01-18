class BooksController < ApplicationController

  def index #投稿一覧と新規投稿
   @books = Book.all
   @book = Book.new
  end
  
  def create #保存機能（投稿が成功したら投稿したidの詳細ページへ、失敗したら投稿フォームにエラーを出す）
   book = Book.new(book_params)
   book.save
   redirect_to '/books/:id'
  end

  def show #詳細ページ
  end

  def edit #編集ページ
  end

private
 def book_params
   params.require(:book).permit(:title,:body)
 end

end
