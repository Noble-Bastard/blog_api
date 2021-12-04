require "grip"

class BlogUpdateController < Grip::Controllers::Http
  def index(context : Context) : Context
    context
      .put_status(200)
      .json(
        {
          "id"  => 1,
          "id2" => 2123,
        }
      )
      .halt
  end
end
