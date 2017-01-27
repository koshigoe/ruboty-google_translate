module Ruboty
  module Handlers
    class GoogleTranslate < Base
      env :GOOGLE_CLOUD_PROJECT, 'Google Cloud Project ID'
      env :GOOGLE_CLOUD_KEY, 'Google Cloud API Key'
    end
  end
end
