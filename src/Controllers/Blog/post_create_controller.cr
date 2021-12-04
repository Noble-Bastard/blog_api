require "grip"

class BlogCreateController  < Grip::Controllers::Http

      def index(context : Context) : Context
        context
          .put_status(200)
          .json(
            {
              "id" => 3,
              "id2" => 2
            }
            )
          .halt
      end

end
