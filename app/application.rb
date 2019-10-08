class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    puts @@items

    if req.path.match(/items/)

      @@items.select {|item|
      item.name = req.path.split("/items/").last
    }
      if @@items.include?(item.name)
        resp.write "#{item.price}"
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
