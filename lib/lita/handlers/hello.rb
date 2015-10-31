module Lita
  module Handlers
    class Hello < Handler
      # insert handler code here
      route(/^(hi|hello|howdy|hey)\s+(.+)/, :say_hello, command: true, help: 'help me')

      def say_hello(response)
        return if response.user.name.empty?
        reply_name = response.user.metadata['mention_name'].nil? ?
                    "#{response.user.name}" :
                    "#{response.user.metadata['mention_name']}"
        response.reply "Hello, #{reply_name}!"
      end

      Lita.register_handler(self)
    end
  end
end
