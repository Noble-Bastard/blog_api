require "grip"
require "../../Model/blog_model"

class BlogListController < Grip::Controllers::Http
  def index(context : Context) : Context
    model = BlogModel.new
    posts = Array(Hash(String, Int32 | String)).new
    model.get_post_list do |post|
    posts.push({
      "id"           => post.id,
      "postTitle"    => post.title,
      "postMiniInfo" => post.miniInfo,
      "postBody"     => post.body
      })
    end
    context
      .put_status(200)
      .put_resp_header("Access-Control-Allow-Origin", "http://localhost:3000")
      .json(posts )
      .halt
  end
end
