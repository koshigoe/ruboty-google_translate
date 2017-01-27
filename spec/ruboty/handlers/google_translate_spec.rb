require 'spec_helper'
require 'json'

RSpec.describe Ruboty::Handlers::GoogleTranslate do
  subject { robot.receive(body: "#{robot.name} #{command_text} #{original_text}") }

  let(:robot) { Ruboty::Robot.new }

  before do
    allow(ENV).to receive(:[]).and_call_original
    allow(ENV).to receive(:[]).with('GOOGLE_CLOUD_PROJECT').and_return('PRJ')
    allow(ENV).to receive(:[]).with('GOOGLE_CLOUD_KEY').and_return('KEY')
  end

  shared_examples_for 'successful' do
    before do
      stub_request(:post, 'https://translation.googleapis.com/language/translate/v2?key=KEY')
        .with(
          body: { q: [original_text], target: lang }.to_json,
          headers: { 'Google-Cloud-Resource-Prefix' => 'projects/PRJ' }
        ).to_return(
          status: 200,
          body: { data: { translations: [{ translatedText: translated_text }] } }.to_json
        )
    end

    it 'return translated text' do
      expect(robot).to receive(:say).with(hash_including(body: translated_text))
      subject
    end
  end

  shared_examples_for 'timeout' do
    before do
      stub_request(:post, 'https://translation.googleapis.com/language/translate/v2?key=KEY')
        .with(
          body: { q: [original_text], target: lang }.to_json,
          headers: { 'Google-Cloud-Resource-Prefix' => 'projects/PRJ' }
        ).to_timeout
    end

    it 'return original text' do
      expect(robot).to receive(:say).with(hash_including(body: original_text))
      subject
    end
  end

  describe '#in_english' do
    let(:lang) { 'en' }
    let(:command_text) { '英語で' }
    let(:original_text) { 'こんにちは' }

    it_behaves_like 'successful' do
      let(:translated_text) { 'Hello' }
    end

    it_behaves_like 'timeout'
  end

  describe '#in_japanese' do
    let(:lang) { 'ja' }
    let(:command_text) { 'in japanese' }
    let(:original_text) { 'Hello' }
    let(:translated_text) { 'こんにちは' }

    context 'uppercase' do
      let(:command_text) { 'IN JAPANESE' }
      it_behaves_like 'successful'
    end

    context 'lowercase' do
      let(:command_text) { 'in japanese' }
      it_behaves_like 'successful'
    end

    it_behaves_like 'timeout'
  end
end
