require 'bundler'
Bundler.require

#require son dans morpion/lib/..
$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/board'
require 'app/board_case'
require 'app/player'
require 'app/game'
require 'app/application'
require 'views/show'
require 'views/done'


Application.new.perform
binding pry
 