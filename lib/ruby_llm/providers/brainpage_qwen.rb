# frozen_string_literal: true

module RubyLLM
  module Providers
    # BrainPage Qwen models integration.
    class BrainpageQwen < OpenAI
      def api_base
        @config.brainpage_qwen_api_base || 'https://ohwre6j0tzya00-8889.proxy.runpod.net/v1'
      end

      def headers
        {
          'Authorization' => "Bearer #{@config.brainpage_qwen_api_key}"
        }.compact
      end

      # Override to use the original_model name from metadata
      def render_payload(messages, tools:, temperature:, model:, stream: false, schema: nil) # rubocop:disable Metrics/ParameterLists
        payload = super
        # Use the original model name (e.g., "Qwen/Qwen3-4B-Instruct-2507") if available
        original_model = model.metadata['original_model'] || model.metadata[:original_model]
        payload[:model] = original_model if original_model
        payload
      end

      class << self
        def local?
          false
        end

        def configuration_requirements
          %i[brainpage_qwen_api_key]
        end
      end
    end
  end
end
