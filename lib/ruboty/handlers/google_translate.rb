require 'google/cloud/translate'

module Ruboty
  module Handlers
    class GoogleTranslate < Base
      env :GOOGLE_CLOUD_PROJECT, 'Google Cloud Project ID'
      env :GOOGLE_CLOUD_KEY, 'Google Cloud API Key'

      on /英語で (.*)\z/, name: :in_english, description: 'Translate to English.'

      def in_english(message)
        message.reply(translate(message.match_data[1], to: 'en'))
      end

      private

      def translate(text, to:)
        # TODO: Set retries:, timeout: if needed.
        Google::Cloud::Translate.new.translate(text, to: to).text
      rescue
        # TODO: error logging
        text
      end
    end
  end
end
