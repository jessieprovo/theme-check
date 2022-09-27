# frozen_string_literal: true

require 'test_helper'

module ThemeCheck
  module ShopifyLiquid
    class DocumentationTest < Minitest::Test
      def test_filter_doc
        ScopeIndex.stubs(:filters).returns([filter_entry])

        actual_doc = Documentation.filter_doc('size')
        expected_doc = "### size\n" \
          "Returns the size of a string or array.\n" \
          "---\n" \
          'You can use the "size" filter with dot notation.'

        assert_equal(expected_doc, actual_doc)
      end

      def test_tag_doc
        ScopeIndex.stubs(:tags).returns([tag_entry])

        actual_doc = Documentation.tag_doc('tablerow')
        expected_doc = "### tablerow\n" \
          'The "tablerow" tag must be wrapped in HTML "table" tags.' \

        assert_equal(expected_doc, actual_doc)
      end

      def test_object_doc
        ScopeIndex.stubs(:objects).returns([object_entry])

        actual_doc = Documentation.object_doc('product')
        expected_doc = "### product\n" \
          'A product in the store.'

        assert_equal(expected_doc, actual_doc)
      end

      def test_object_property_doc
        ScopeIndex.stubs(:objects).returns([object_entry])

        actual_doc = Documentation.object_property_doc('product', 'available')
        expected_doc = "### available\n" \
          'Returns "true" if at least one of the variants of the product is available.'

        assert_equal(expected_doc, actual_doc)
      end

      private

      def filter_entry
        ScopeIndex::FilterEntry.new(
          'name' => 'size',
          'summary' => 'Returns the size of a string or array.',
          'description' => 'You can use the "size" filter with dot notation.'
        )
      end

      def object_entry
        ScopeIndex::ObjectEntry.new(
          'name' => 'product',
          'summary' => 'A product in the store.',
          'properties' => [
            {
              'summary' => 'Returns "true" if at least one of the variants of the product is available.',
              'name' => 'available',
              'return_type' => [{ 'type' => 'string' }],
            },
          ],
        )
      end

      def tag_entry
        ScopeIndex::TagEntry.new(
          'name' => 'tablerow',
          'summary' => 'The "tablerow" tag must be wrapped in HTML "table" tags.'
        )
      end
    end
  end
end
