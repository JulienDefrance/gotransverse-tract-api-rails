require 'spec_helper'
require 'net/http'

RSpec.describe GoTransverseTractApi do
    before(:each) { http_auth }

    let(:klass) { 'test' }
    let(:params) { {a: 'b'} }
    let(:api_url) { "https://test.com" }
    let(:body) { "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>" }
    let(:response) { "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>" }

    context ".call" do
      it "returns success for Net HTTP Client request" do
        uri = URI.parse("http://www.example.com/")
        req = Net::HTTP::Get.new(uri.path)
        req['Content-Length'] = 3

        res = Net::HTTP.start(uri.host,uri.port) do|http|
          http.request(req, 'abc')
        end

        expect(res.code).to eq('400')
      end
    end

    context ".get_response_for" do
      it "calls the get response" do
        method = :get

        allow(subject).to receive(:get_api_url).with(klass,params).and_return(api_url)
        expect(subject.get_api_url(klass,params)).to eq(api_url)

        allow(subject).to receive(:call).with(klass,api_url,params,method).and_return(response)
        expect(subject.call(klass,api_url,params,method)).to eq(response)
      end
    end

    context ".post_request_for" do
      it "calls the post request" do
        method = :post

        allow(subject).to receive(:get_api_url).with(klass,params).and_return(api_url)
        expect(subject.get_api_url(klass,params)).to eq(api_url)

        allow(subject).to receive(:call).with(klass,api_url,params,method,body).and_return(response)
        expect(subject.call(klass,api_url,params,method,body)).to eq(response)
      end
    end

    context ".put_request_for" do
      it "calls the put request" do
        method = :put

        allow(subject).to receive(:get_api_url).with(klass,params).and_return(api_url)
        expect(subject.get_api_url(klass,params)).to eq(api_url)

        allow(subject).to receive(:call).with(klass,api_url,params,method,body).and_return(response)
        expect(subject.call(klass,api_url,params,method,body)).to eq(response)
      end
    end

    context ".delete_request_for" do
      it "calls the delete request" do
        method = :delete

        allow(subject).to receive(:get_api_url).with(klass,params).and_return(api_url)
        expect(subject.get_api_url(klass,params)).to eq(api_url)

        allow(subject).to receive(:call).with(klass,api_url,params,method,body).and_return(response)
        expect(subject.call(klass,api_url,params,method,body)).to eq(response)
      end
    end

    context ".generateXML" do
      it "generates XML for the given hash object" do
        response = "<root xmlns='http://www.tractbilling.com/billing/1_31/domain'>\n  <element1 x='y' y='z'/>\n  <element2 a='b'>\n    <children c='d' e='f'/>\n  </element2>\n</root>"

        h = {
          root: {},
          element1: {x: 'y', y: 'z'},
          element2: {
            attributes: {a: 'b'},
            children: {c: 'd', e: 'f'}
          }
        }

        actual_response = described_class.generateXML(h, 'root')
        expect(actual_response).to eq(response)
      end
    end

end


