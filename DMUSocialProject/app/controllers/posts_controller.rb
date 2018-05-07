class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy,]
  before_action :authenticate_user!, except: [:show]

  def index
    @post = Post.new
  end


    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id # assign the post to the user who created it.
        respond_to do |f|
            if (@post.save)
                f.html { redirect_to explore_path, notice: "Post Created!" }
            else
                f.html { redirect_to "", notice: "Error: Post Not Saved." }
                # render 'new'
            end
        end
    end

    def show
      @post = Post.find(params[:id])
    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
         @post = Post.find(params[:id])
        if @post.update_attributes(post_params)
          redirect_to explore_path, :notice => "Your post has been updated"
        else
          render "edit"
       end
    end

   def destroy
      if current_user == @post.user
       @post = Post.find(params[:id])
      if @post.destroy
      redirect_to :back, :notice => "Your post has been deleted"
    else
    redirect_to explore_path, :notice => "Your post wasn't deleted"
  end
end
end


    private

      def find_post
		      @post = Post.find(params[:id])
	    end

    def post_params # allows certain data to be passed via form.
        params.require(:post).permit(:user_id, :content)

    end

end
