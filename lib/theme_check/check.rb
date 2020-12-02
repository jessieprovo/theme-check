# frozen_string_literal: true
require_relative "parsing_helpers"

module ThemeCheck
  class Check
    attr_accessor :theme
    attr_accessor :offenses

    SEVERITIES = [
      :error,
      :suggestion,
      :style,
    ]

    class << self
      def all
        @all ||= []
      end

      def severity(severity = nil)
        if severity
          unless SEVERITIES.include?(severity)
            raise ArgumentError, "unknown severity. Use: #{SEVERITIES.join(', ')}"
          end
          @severity = severity
        end
        @severity
      end

      def doc(doc = nil)
        @doc = doc if doc
        @doc
      end
    end

    def severity
      self.class.severity
    end

    def doc
      self.class.doc
    end

    def code
      self.class.name
        .sub(/ThemeCheck::/, '')
        .gsub(/(\w)([A-Z])/) { "#{$1}-#{$2}" }
        .downcase
    end

    def ignore!
      @ignored = true
    end

    def unignore!
      @ignored = false
    end

    def ignored?
      defined?(@ignored) && @ignored
    end
  end
end
