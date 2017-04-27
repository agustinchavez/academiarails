module Course
  class PostsController < CourseController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    # GET /posts
    def index
      @posts = Post.most_recent
    end

    # GET /posts/1
    def show
    end

  end

end