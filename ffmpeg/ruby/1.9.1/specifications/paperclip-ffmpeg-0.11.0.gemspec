# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "paperclip-ffmpeg"
  s.version = "0.11.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Omar Abdel-Wahab"]
  s.date = "2013-05-05"
  s.description = "Process your attachments with FFMPEG"
  s.email = ["owahab@gmail.com"]
  s.homepage = "http://github.com/owahab/paperclip-ffmpeg"
  s.require_paths = ["lib"]
  s.rubyforge_project = "paperclip-ffmpeg"
  s.rubygems_version = "1.8.16"
  s.summary = "Process your attachments with FFMPEG"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<paperclip>, [">= 2.5.2"])
    else
      s.add_dependency(%q<paperclip>, [">= 2.5.2"])
    end
  else
    s.add_dependency(%q<paperclip>, [">= 2.5.2"])
  end
end
