require "grip"

class BlogIdController < Grip::Controllers::Http
  def index(context : Context) : Context
    context
      .put_status(200)
      .json(
        {
          "id"  => 1,
          "id2" => context
            .fetch_path_params
            .["id"],
        }
      )
      .halt
  end
end
