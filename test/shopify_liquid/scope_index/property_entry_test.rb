# frozen_string_literal: true

require 'test_helper'

module ThemeCheck
  module ShopifyLiquid
    class ScopeIndex
      class PropertyEntryTest < Minitest::Test
        def setup
          @entry = PropertyEntry.new(hash)
        end

        def test_return_type
          assert_equal('string', @entry.return_type)
        end

        private

        def hash
          {
            'deprecated' => false,
            'deprecation_reason' => '',
            'description' => '',
            'examples' => [],
            'return_type' => [{ 'type' => 'string', 'name' => '', 'description' => '', 'array_value' => '' }],
            'summary' => 'Returns "User-agent".',
            'name' => 'directive',
          }
        end
      end
    end
  end
end
