require "grip"

class BlogDeleteController < Grip::Controllers::Http
  def index(context : Context) : Context
    context
      .put_status(200)
      .json(
        {
          "id"  => 1,
          "id2" => 23,
        }
      )
      .halt
  end
end
