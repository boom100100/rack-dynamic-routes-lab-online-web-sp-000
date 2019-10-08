class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    puts @@items

    if req.path.match(/items/)

      match_value = @@items.select {|item|
        item.name = req.path.split("/items/").last
      }.uniq

      if match_value != nil
        puts match_value.length
        #resp.write "#{match_value.price}"
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end


    resp.finish
  end
end
