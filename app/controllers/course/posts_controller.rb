module Course
  class PostsController < CourseController
    before_action :authenticate_user!
    # GET /posts
    # GET /posts.json
    def index
      @posts = storage.list_for(params[:page], params[:tag])
    end

    # GET /posts/1
    # GET /posts/1.json
    def show
      @post = storage.friendly.find(params[:id])
    end

    private

    def storage
      Post.published
    end

  end

end
