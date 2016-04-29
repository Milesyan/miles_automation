# Requiring this file will import Calabash and the Calabash predefined Steps.
require 'calabash-cucumber/cucumber'
require 'minitest/autorun'
require 'active_support/all'
require_relative '../../../www/public/noah_ios_forum_test'
require_relative 'app'
require_relative 'pages'

include NoahForumIOS
include Baby
include Minitest::Assertions

class MinitestWorld
  extend Minitest::Assertions
  attr_accessor :assertions
  def initialize
    self.assertions = 0
  end
end

World do
  MinitestWorld.new
end

ENV['SCREENSHOT_PATH'] = "./features/screenshots/"
ENV["APP_BUNDLE_PATH"] = "/Users/Miles/repos/noah/iOS/Noah_fix_api.app"
ENV["DEVICE_TARGET"] = "068BE9E1-CE89-439B-8654-50785707D0CA"