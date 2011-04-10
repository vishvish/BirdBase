require 'rubygems'
require 'bundler'
require 'bundler/setup'
require 'rake/clean'
require 'flashsdk'

version = 0.5

def configure t
  t.library_path << 'lib'
  t.source_path << 'src'
  t.include_sources << 'src'
  t.default_frame_rate = 31
  t.optimize = true
  t.target_player = '10.1'
  t.default_background_color = '0x000000'
  t.default_size = '1152,720'
end

compc "bin/birdbase-#{version}.swc" do |t|
  configure t
  t.debug = true
  t.define_conditional << 'CONFIG::release,true'
  t.define_conditional << 'CONFIG::debug,false'
end


desc "Compile and run the debug swf"
task :swc => "bin/birdbase-#{version}.swc"

desc "Generate documentation at doc/"
asdoc 'doc' do |t|
  t.doc_sources << 'src'
  # t.exclude_classes << 'AddThisShareWrapper.as'
  t.library_path << 'lib'
  t.output = "doc/asdoc"
  t.lenient = "true"
end

task :default => :swc

