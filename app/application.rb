class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    puts @@items
=begin
    if req.path.match(/items/)

      @@items.include?(req.path.split("/items/").last)
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
=end

    resp.finish
  end
end
