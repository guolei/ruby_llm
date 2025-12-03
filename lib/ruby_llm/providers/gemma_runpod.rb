# frozen_string_literal: true

module RubyLLM
  module Providers
    # Gemma 3 1B model on RunPod integration.
    class GemmaRunpod < OpenAI
      def api_base
        'https://ohwre6j0tzya00-8888.proxy.runpod.net/v1'
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
