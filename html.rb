class HTML

  def self.header
    '<!doctype html>
    <html lang="en">
      <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="normalize.min.css">
        <link rel="stylesheet" href="main.css">
      </head>
      <body>'
  end

  def self.footer
    '</body>
    </html>'
  end

end
