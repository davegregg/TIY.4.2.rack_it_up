class LipsumGenerator
  attr_accessor :env, :path

  def initialize(env)
    @env = env
    @path = @env['PATH_INFO']
    @given_num = @env['REQUEST_PATH'].match(/(\d*)\z/)[1].to_i
    @num = [1, @given_num, 100].sort[1] #min/max limiting @num
  end

  def response
    [ '200',
      {'Content-Type' => 'text/html'},
      case path.downcase
      when /\A\/lipsums/, /\A\/options/
        [HTML.header +
         '<div style="margin: 2em;">
            <h4>Options:</h4>
            <ul>
              <li><a href="lorem">Lorem Ipsum</a></li>
              <li><a href="hipster">Hipster Ipsum</a></li>
              <li><a href="bacon">Bacon Ipsum</a></li>
              <li><a href="dizzle">Dizzle Ipsum</a></li>
              <li><a href="healthcare">Healthcare Ipsum</a></li>
            </ul>
          </div>' +
         HTML.footer]
      when /\A\/bacon/
        [BaconIpsum.(@num)]
      when /\A\/hipster/
        [HipsterIpsum.(@num)]
      when /\A\/dizzle/
        [DizzleIpsum.(@num)]
      when /\A\/healthcare/
        [HealthcareIpsum.(@num)]
      else
        [Lorem.(@num)]
      end
    ]
  end

  def self.call(env)
    new(env).response
  end

end
