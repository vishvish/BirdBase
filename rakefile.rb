require 'rubygems'
require 'bundler'
require 'bundler/setup'
require 'rake/clean'
require 'flashsdk'

version = "0.5.1"

def configure t
  t.library_path << 'lib'
  t.source_path << 'src'
  t.include_sources << 'src'
  t.optimize = true
  t.target_player = '10.0'
end

compc "bin/birdbase-#{version}.swc" do |t|
  configure t
  t.debug = false
  t.define_conditional << 'CONFIG::release,true'
  t.define_conditional << 'CONFIG::debug,false'
end


desc "Compile and run the debug swc"
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

