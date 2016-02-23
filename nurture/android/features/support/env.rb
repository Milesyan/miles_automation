require 'calabash-android/cucumber'
require 'active_support/all'

require_relative 'app'
require_relative 'pages'
require_relative '../../../www/nurture_android_forum_test'
require_relative 'event_logger.rb'

include NurtureForumAndroid
include GlowLogger
include NurtureHelper

ENV['SCREENSHOT_PATH'] = "./features/screenshots/"
GLOW_EVENTS_URL = "http://titan-appevents.glowing.com"