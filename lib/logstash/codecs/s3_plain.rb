# encoding: utf-8
require "logstash/codecs/base"
require "logstash/util/charset"

# The "s3_plain" codec is used for backward compatibility with previous version of the S3 Output
#
class LogStash::Codecs::S3Plain < LogStash::Codecs::Base
  config_name "s3_plain"

  SOURCE_FIELD = "source".freeze
  TAGS_FIELD = "tags".freeze
  MESSAGE_FIELD = "message".freeze

  def decode(data)
    raise RuntimeError.new("This codec is only used for backward compatibility with the previous S3 output.")
  end

  def encode(event)
    message = "Date: #{event.get(LogStash::Event::TIMESTAMP)}\n"
    message << "Source: #{event.get(SOURCE_FIELD)}\n"
    message << "Tags: #{Array(event.get(TAGS_FIELD)).join(', ')}\n"
    message << "Fields: #{event.to_hash.inspect}\n"
    message << "Message: #{event.get(MESSAGE_FIELD)}"

    @on_event.call(message)
  end
end
