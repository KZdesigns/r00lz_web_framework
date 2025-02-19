require 'test_helper'

class TedController < R00lz::Controller
    def think
        "Whoa, man..."
    end

    def think_more
        noun = params['noun']
        "I was just thinking about #{noun}"
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

    def test_params
        e = {"PATH_INFO" => "/ted/think_more", "QUERY_STRING"=>"noun=code", "REQUEST_METHOD"=>"GET",  "rack.input"=>"#"}
        response = ::R00lz::App.new.call(e)
        assert_equal 200, response[0]
        assert_equal "I was just thinking about code", response[2][0]
    end

    def test_file_model
        fn = "test/data.json"
        File.write(fn, '{"test": "data"}')
        fm = FileModel.new(fn)
        assert_equal "data", fm['test']
        File.delete(fn)
    end
end
