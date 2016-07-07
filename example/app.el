(require 'elnode)

(defun handler (httpcon)
  "Demonstration function"
  (elnode-http-start httpcon
                     200
                     '("Content-type" . "text/html"))
  (elnode-http-return httpcon
                      (concat
                       "\
<html>
  <body>
    <h1>Hello, Emacs!! at " (format-time-string "%Y/%m/%d %H:%M:%S") "</h1>
  </body>
</html>")))

(elnode-start
    'handler
    :port (string-to-number (or (getenv "PORT") "8080"))
    :host "0.0.0.0")

(while t (accept-process-output nil 1))
