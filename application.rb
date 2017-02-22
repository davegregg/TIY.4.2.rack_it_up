class LipsumGenerator
  attr_accessor :env, :path

  def initialize(env)
    @env = env
    @path = @env['PATH_INFO']
    given_num = @env['REQUEST_PATH'].match(/(\d*)\z/)[1].to_i
    @paragraph_num = [1, given_num, 100].sort[1]
  end # => :initialize

  def respond
    case path.downcase
    when '/', /\A\/options/, /\A\/lipsums/
      response('options')
    when /\A\/lorem/, /\A\/ipsum/
      response(Lorem)
    when /\A\/bacon/
      response(BaconIpsum)
    when /\A\/hipster/
      response(HipsterIpsum)
    when /\A\/dizzle/
      response(DizzleIpsum)
    when /\A\/healthcare/
      response(HealthcareIpsum)
    when /\A\/current_time/, /\A\/time/
      response('current_time')
    else
      response('invalid')
    end
  end # => :respond

  def response(option)
    header = { 'Content-Type' => 'text/html' }
    go_ahead = ['200', header]
    if option.is_a? Class
      go_ahead << [option.call(@paragraph_num)]
    else
      case option
      when 'options'
        go_ahead << [Page.options]
      when 'current_time'
        go_ahead << [Page.time]
      when 'invalid'
        ['404', header, [Page.error404]]
      end
    end
  end # => :response

  def self.call(env)
    new(env).respond
  end # => :call

end # => :call
