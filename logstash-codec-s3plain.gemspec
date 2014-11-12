Gem::Specification.new do |s|

  s.name            = 'logstash-codec-s3plain'
  s.version         = '0.1.0'
  s.licenses        = ['Apache License (2.0)']
  s.summary         = "This codec may be used to encode (via outputs) S3plain text format, this make the S3 outputs backward comptabile with Logstash 1.4.2"
  s.description     = "This codec may be used to encode (via outputs) S3plain text format, this make the S3 outputs backward comptabile with Logstash 1.4.2"
  s.authors         = ["Elasticsearch"]
  s.email           = 'richard.pijnenburg@elasticsearch.com'
  s.homepage        = "http://logstash.net/"
  s.require_paths = ["lib"]

  # Files
  s.files = `git ls-files`.split($\)

  # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "group" => "codec" }

  # Gem dependencies
  s.add_runtime_dependency 'logstash', '>= 1.4.0', '< 2.0.0'

end

