require 'my_test_helper'
require 'benchmark'
require 'sdg_utils/meta_utils'

module SDGUtils

  class ShadowMethods1Test < Test::Unit::TestCase
    include SDGUtils::ShadowMethods

    def test
      shadow_methods_while(:a => 42) do
        assert_equal 42, a
      end
    end
  end

  class ShadowMethods2Test < Test::Unit::TestCase
    include SDGUtils::ShadowMethods

    def b() 32 end

    def test1
      assert_equal 32, b
      shadow_methods_while(:a => 42) do
        assert_equal 42, a
        assert_equal 32, b
      end
      assert_equal 32, b
    end

    def test2
      assert_equal 32, b
      shadow_methods_while(:a => 42, :b => 43) do
        assert_equal 42, a
        assert_equal 43, b
      end
      assert_equal 32, b
    end
  end

  class ShadowMethods3Test < Test::Unit::TestCase
    include SDGUtils::ShadowMethods

    def b() 32 end

    def test1
      assert_equal 32, b
      self.define_singleton_method :b, lambda{22}
      assert_equal 22, b
      shadow_methods_while(:a => 42, :b => 43) do
        assert_equal 42, a
        assert_equal 43, b
      end
      assert_equal 22, b
    end
  end

end
