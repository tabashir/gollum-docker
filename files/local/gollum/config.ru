__DIR__ = File.expand_path(File.dirname(__FILE__))
$: << __DIR__
require 'rubygems'
require 'yaml'
require 'app'
App.set(:gollum_path, __DIR__ + "/wikidata2")
App.set(:authorized_users, YAML.load_file(File.expand_path('users.yml', __DIR__)))
App.set(:wiki_options, {})
run App
