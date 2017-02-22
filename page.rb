class Page < HTML

  def self.options
    HTML.header +
      '<div style="margin: 2em;">
         <h4>Options:</h4>
         <ul>
           <li><a href="lorem">Lorem Ipsum</a></li>
           <li><a href="hipster">Hipster Ipsum</a></li>
           <li><a href="bacon">Bacon Ipsum</a></li>
           <li><a href="dizzle">Dizzle Ipsum</a></li>
           <li><a href="healthcare">Healthcare Ipsum</a></li>
           <li><a href="current_time">Current Time</a></li>
         </ul>
       </div>' +
    HTML.footer
  end

  def self.time
    HTML.header +
      '<p>The time is now: ' +
      Time.now.strftime('%a, %e %b %Y %H:%M:%S %z') +
      '</p>' +
    HTML.footer
  end

  def self.error404
    HTML.header +
      '<h1>404 error</h1>' +
      '<p>We\'re sorry. We couldn\'t that.</p>' +
    HTML.footer
  end

end
