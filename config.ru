require 'sinatra'
require 'rubygems'
require 'bundler'
require 'require_all'
run ShoppingMicroserviceController

Bundler.require

run ShoppingMicroserviceController
