require 'rubygems'
require 'bundler'
require 'bundler/setup'
require 'rake/clean'
require 'flashsdk'

version = "0.8.2"

# NOTE
# 
# in the configure method below there is a load_config hook.
# 
# There is a sample birdbase-config-sample.xml provided in the source tree.
#
# Uncomment below to use and optimize. There is further optimization possible - currently our copy of birdbase.swc weighs in at 228K


def configure t
  t.library_path << 'lib'
  t.source_path << 'src'
  t.include_sources << 'src'
  t.optimize = true
  # t.load_config << 'birdbase-config-sample.xml'
  t.load_config << 'birdbase-config.xml'
  t.target_player = '10.2'
end

compc "bin/birdbase-#{version}.swc" do |t|
  configure t
  t.debug = false
  t.define_conditional << 'CONFIG::release,true'
  t.define_conditional << 'CONFIG::debug,false'
  t.pkg_name    = 'flex4'
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

