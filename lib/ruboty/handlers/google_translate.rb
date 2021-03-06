require 'google/cloud/translate'

module Ruboty
  module Handlers
    class GoogleTranslate < Base
      env :GOOGLE_CLOUD_PROJECT, 'Google Cloud Project ID'
      env :GOOGLE_CLOUD_KEY, 'Google Cloud API Key'

      on /英語で (.*)\z/, name: :in_english, description: 'Translate to English.'
      on /in japanese (.*)\z/i, name: :in_japanese, description: 'Translate to Japanese.'

      def in_english(message)
        message.reply(translate(message.match_data[1], to: 'en'))
      end

      def in_japanese(message)
        message.reply(translate(message.match_data[1], to: 'ja'))
      end

      private

      def translate(text, to:)
        # TODO: Set retries:, timeout: if needed.
        Google::Cloud::Translate.new.translate(text, to: to).text
      rescue => e
        Ruboty.logger.error(e.message)
        text
      end
    end
  end
end
