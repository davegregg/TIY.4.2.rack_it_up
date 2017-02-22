class HTML

  def self.header
    '<!doctype html>
    <html lang="en">
      <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="style/normalize.min.css">
        <link rel="stylesheet" href="style/main.css">
      </head>
      <body>'
  end

  def self.footer
    '</body>
    </html>'
  end

end
