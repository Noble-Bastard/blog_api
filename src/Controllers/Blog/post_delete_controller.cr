require "grip"

class BlogDeleteController < Grip::Controllers::Http
  def index(context : Context) : Context
    model = BlogModel.new
    model.delete_post_by_id(context
      .fetch_path_params
      .["id"]
      .to_i32)
    context
      .put_status(200)
      .json({"status": "ok"})
      .put_resp_header("Access-Control-Allow-Origin", "http://assabyn.xyz")
      .halt
  end
end
