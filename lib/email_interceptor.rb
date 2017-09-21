class EmailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject}"
    message.to = [ 'contact@so-guide.com' ]
  end
end
