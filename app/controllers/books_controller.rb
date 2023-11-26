class BooksController < ApplicationController
    
    def index
        @books = Book.all 
        @books = [] if @books.nil?  # Ensure @books is not nil
    end

    def new
        @book = Book.new
       
      end
    
      def create
        @book = Book.new(book_params)
        Rails.logger.debug "Book object before save: #{@book.inspect}"
        if @book.save
          redirect_to books_path, notice: 'Book was successfully created.'
        else
          render :new
        end
      end

      def destroy
        @book = Book.find(params[:id])
        @book.destroy
    
        redirect_to books_path, notice: "Book was successfully deleted."
      end

      def send_test_email
        email = params[:email] # Get the email address from the form
      
        if email.present? && TestMailer.test_email(email).deliver_now
          flash[:success] = "Test email sent successfully!"
        else
          flash[:error] = "Failed to send test email. Please enter a valid email address."
        end
      
        redirect_to books_path
      end
    
      # ...
    
      private
    
      def book_params
        params.require(:book).permit(:title, :author, :description, :datePublished) 
      end
    end
