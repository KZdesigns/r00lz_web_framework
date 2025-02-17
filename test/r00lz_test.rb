require 'test_helper'

class TedController < R00lz::Controller
    def think
        "Whoa, man..."
    end
end

class R00lzTest < Minitest::Test
    def test_new_controller_action
        e = {"PATH_INFO" => "/ted/think", "QUERY_STRING" => ""}
        assert_equal 200, ::R00lz::App.new.call(e)[0]
    end

    def test_auto_require_controllers
        assert Object.const_get("TestController")
    end
end
