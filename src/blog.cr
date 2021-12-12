require "grip"
require "./Controllers/Blog/*"

class Application < Grip::Application
  def routes
    scope "/blog" do
      get "/list", BlogListController, as: :index
      get "/read/:id", BlogIdController, as: :index
      get "/create", BlogCreateController, as: :index
      get "/update", BlogUpdateController, as: :index
      get "/delete/:id", BlogDeleteController, as: :index
    end
  end
end

app = Application.new
app.run
