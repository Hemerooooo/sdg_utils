module SDGUtils
  module Testing

    module Assertions
      def assert_arry_equal(arry1, arry2, msg="")
        mymsg = "Arrays arry1=#{arry1} and arry2=#{arry2} are not equal"
        mymsg = "#{msg}\n#{mymsg}" unless mymsg.empty?
        if arry1.nil?
          assert_nil arry2, mymsg + ": arry1 is nil arry2 is not."
          return
        end
        if arry2.nil?
          assert_nil arry1, mymsg + ": arry2 is nil arry1 is not."
          return
        end
        assert_equal arry1.size, arry2.size, mymsg + ": sizes differ."
        arry1.each_with_index do |e, idx|
          assert_equal e, arry2[idx], mymsg + ": element differ at position #{idx}"
        end
      end

      def assert_set_equal(set1, set2, msg="")
        mymsg = "Sets set1=#{set1} and set2=#{set2} are not equal"
        mymsg = "#{msg}\n#{mymsg}" unless mymsg.empty?
        if set1.nil?
          assert_nil set2, mymsg + ": set1 is nil set2 is not."
          return
        end
        if set2.nil?
          assert_nil set1, mymsg + ": set2 is nil set1 is not."
          return
        end
        assert_equal set1.size, set2.size, mymsg + ": sizes differ."
        set1.each do |e|
          assert set2.member?(e), mymsg + ": element #{e} from set1 not present in set2."
        end
      end

      def assert_equal_ignore_whitespace(str1, str2, msg="")
        sstr1 = str1.strip.gsub(/\s+/, " ")
        sstr2 = str2.strip.gsub(/\s+/, " ")
        assert_equal sstr1, sstr2, msg
      end

      def assert_matches(expected, actual, msg="")
        case expected
        when Regexp
          assert actual =~ expected, msg + diff(expected, actual)
        else
          assert_equal expected, actual, msg
        end
      end

      private

      def diff(actual, expected)
        "\nactual: #{actual.inspect}\nexpected: #{expected.inspect}"
      end

    end

  end
end
