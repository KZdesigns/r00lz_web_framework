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

    def test_render
        env = {}
        
        controller = R00lz::Controller.new(env)

        view_dir = "app/views"
        FileUtils.mkdir_p(view_dir)

        view_path = "#{view_dir}/sample.html.erb"
        File.write(view_path, "Hello, <%= @thing %>")

        controller.instance_variable_set(:@thing, "World")

        result = controller.render(:sample)

        assert_equal "Hello, World", result

        File.delete(view_path)
    end
end
