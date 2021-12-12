require "grip"

class BlogIdController < Grip::Controllers::Http
  def index(context : Context) : Context
    model = BlogModel.new
    post = model.get_post_by_id(context
      .fetch_path_params
      .["id"]
      .to_i32)
    posts = {
      "id"           => post.id,
      "postTitle"    => post.title,
      "postMiniInfo" => post.miniInfo,
      "postBody"     => post.body,
    }
    context
      .put_status(200)
      .put_resp_header("Access-Control-Allow-Origin", "http://localhost:3000")
      .json(posts)
      .halt
  end
end
