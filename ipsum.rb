class Ipsum

  def self.call(num = 1)
    paragraphs = eval("FFaker::#{self.name}.paragraphs(#{num})")
    paragraphs = paragraphs.collect{ |p| "<p>#{p}</p>" }.join
    return "#{HTML.header}" +
           "#{paragraphs}"  +
           "#{HTML.footer}"
  end

end

class Lorem < Ipsum; end
class BaconIpsum < Ipsum; end
class DizzleIpsum < Ipsum; end
class HealthcareIpsum < Ipsum; end
class HipsterIpsum < Ipsum; end
