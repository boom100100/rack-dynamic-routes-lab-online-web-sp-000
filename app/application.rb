class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    #puts @@items

    if req.path.match(/items/)

      match_value = @@items.select {|item|
        item.name = req.path.split("/items/").last
      }.uniq

      if match_value.length != 0
        resp.write match_value[0].price
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
