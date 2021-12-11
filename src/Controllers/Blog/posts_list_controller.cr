require "grip"
require "../../Model/blog_model"

class BlogListController < Grip::Controllers::Http
  def index(context : Context) : Context
    model = BlogModel.new
    posts = Array(Hash(String, Int32 | String)).new
    model.get_post_list { |x| posts.push({
      "id"           => post.id,
      "postTitle"    => post.title,
      "postMiniInfo" => post.miniInfo,
      "postBody"     => post.body
      })}
    context
      .put_status(200)
      .json(posts)
      .halt
  end
end
