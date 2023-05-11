class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new

  end

  def create

    @post = Post.new
    # assign user-entered form data to Post's columns
    @post["author"] = params["post"]["author"]
    @post["image"] = params["post"]["image"]
    @post["body"] = params["post"]["body"]
    @post.save
    redirect_to "/posts"
    # save Post row
    # redirect user
  end
  
end
