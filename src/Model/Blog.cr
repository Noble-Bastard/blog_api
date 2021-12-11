require "totem"

struct Post
  property id : Int32 = 0
  property title : String = "undefind"
  property miniInfo : String = "undefind"
  property body : String = "undefind"
end

class BlogModel
  def get_post_list
  end

  def create_post(post : Post)
    totem = Totem.new
    totem.set_defaults({
      "id"           => post.id,
      "postTitle"    => post.title,
      "postMiniInfo" => post.miniInfo,
      "postBody"     => post.body,
    })

    begin
      totem.store_file!("./config/#{post.id}.yaml", force: true)
    rescue e
      puts "Fatal error config file: #{e.message}"
    end
  end

  def get_post_by_id(id : Int32)
    totem = Totem.from_file "./config/#{id}.yaml"
    post = Post.new
    post.id = id
    post.title = totem.get("postTitle").as_s
    post.miniInfo = totem.get("postMiniInfo").as_s
    post.body = totem.get("postBody").as_s
    return post
  end

  def delete_post_by_id(id : Int32)
    begin
      File.delete("./config/#{id}.yaml")
    rescue e
      puts "Fatal error config file: #{e.message}"
    end
  end
end