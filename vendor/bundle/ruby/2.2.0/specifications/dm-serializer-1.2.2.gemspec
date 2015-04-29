# -*- encoding: utf-8 -*-
# stub: dm-serializer 1.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "dm-serializer"
  s.version = "1.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Guy van den Berg", "Dan Kubb"]
  s.date = "2012-08-02"
  s.description = "DataMapper plugin for serializing Resources and Collections"
  s.email = ["dan.kubb@gmail.com"]
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = ["LICENSE", "README.rdoc"]
  s.homepage = "http://datamapper.org"
  s.rubygems_version = "2.4.6"
  s.summary = "DataMapper plugin for serializing Resources and Collections"

  s.installed_by_version = "2.4.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<fastercsv>, ["~> 1.5"])
      s.add_runtime_dependency(%q<multi_json>, ["~> 1.0"])
      s.add_runtime_dependency(%q<json>, ["~> 1.6"])
      s.add_runtime_dependency(%q<json_pure>, ["~> 1.6"])
      s.add_runtime_dependency(%q<dm-core>, ["~> 1.2.0"])
      s.add_development_dependency(%q<rake>, ["~> 0.9"])
      s.add_development_dependency(%q<rspec>, ["~> 1.3"])
    else
      s.add_dependency(%q<fastercsv>, ["~> 1.5"])
      s.add_dependency(%q<multi_json>, ["~> 1.0"])
      s.add_dependency(%q<json>, ["~> 1.6"])
      s.add_dependency(%q<json_pure>, ["~> 1.6"])
      s.add_dependency(%q<dm-core>, ["~> 1.2.0"])
      s.add_dependency(%q<rake>, ["~> 0.9"])
      s.add_dependency(%q<rspec>, ["~> 1.3"])
    end
  else
    s.add_dependency(%q<fastercsv>, ["~> 1.5"])
    s.add_dependency(%q<multi_json>, ["~> 1.0"])
    s.add_dependency(%q<json>, ["~> 1.6"])
    s.add_dependency(%q<json_pure>, ["~> 1.6"])
    s.add_dependency(%q<dm-core>, ["~> 1.2.0"])
    s.add_dependency(%q<rake>, ["~> 0.9"])
    s.add_dependency(%q<rspec>, ["~> 1.3"])
  end
end