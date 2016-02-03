class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  # We can use this constraint to route requests based on the version specified in the request’s accept header.
  def matches?(req)
    @default || req.headers['Accept'].include?("application/vnd.marketplace.v#{@version}")

    # request
    #       .headers
    #       .fetch(:accept)
    #       .include?("version=#{version}")
  end
end