# frozen_string_literal: true

module RubyLLM
  module Providers
    # BrainPage Gemma models integration.
    class BrainpageGemma < OpenAI
      def api_base
        @config.brainpage_gemma_api_base || 'https://ohwre6j0tzya00-8888.proxy.runpod.net/v1'
      end

      def headers
        {
          'Authorization' => "Bearer #{@config.brainpage_gemma_api_key}"
        }.compact
      end

      # Override to use the original_model name from metadata
      def render_payload(messages, tools:, temperature:, model:, stream: false, schema: nil) # rubocop:disable Metrics/ParameterLists
        payload = super
        # Use the original model name (e.g., "google/gemma-3-1b-it") if available
        original_model = model.metadata['original_model'] || model.metadata[:original_model]
        payload[:model] = original_model if original_model
        payload
      end

      class << self
        def local?
          false
        end

        def configuration_requirements
          %i[brainpage_gemma_api_key]
        end
      end
    end
  end
end
