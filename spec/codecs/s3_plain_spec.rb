# encoding: utf-8
require "logstash/devutils/rspec/spec_helper"
require "logstash/event"
require "logstash/codecs/s3_plain"

describe LogStash::Codecs::S3Plain do
  subject { LogStash::Codecs::S3Plain.new }

  describe "#encode" do
    it 'should accept a nil list for the tags' do
      subject.on_event do |data|
        expect(data).to match(/\nTags:\s\n/)
      end

      subject.encode(LogStash::Event.new)
    end

    it 'should accept a list of tags' do
      event = LogStash::Event.new({"tags" => ["elasticsearch", "logstash", "kibana"] })

      subject.on_event do |data|
        expect(data).to match(/\nTags:\selasticsearch,\slogstash,\skibana\n/)
      end

      subject.encode(event)
    end
   end
end
