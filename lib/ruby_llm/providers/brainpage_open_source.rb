# frozen_string_literal: true

module RubyLLM
  module Providers
    # BrainPage Open Source models integration (Qwen, Gemma, etc).
    class BrainpageOpenSource < OpenAI
      def api_base
        @config.brainpage_api_base || 'https://ohwre6j0tzya00-8889.proxy.runpod.net/v1'
      end

      def headers
        {
          'Authorization' => "Bearer #{@config.brainpage_api_key}"
        }.compact
      end

      class << self
        def local?
          false
        end

        def configuration_requirements
          %i[brainpage_api_key]
        end
      end
    end
  end
end
