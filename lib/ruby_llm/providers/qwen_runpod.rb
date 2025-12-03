# frozen_string_literal: true

module RubyLLM
  module Providers
    # Qwen 4B model on RunPod integration.
    class QwenRunpod < OpenAI
      def api_base
        'https://ohwre6j0tzya00-8889.proxy.runpod.net/v1'
      end

      def headers
        {}
      end

      class << self
        def local?
          false
        end

        def configuration_requirements
          []
        end
      end
    end
  end
end
