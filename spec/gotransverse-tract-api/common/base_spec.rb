require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe Common::Base do
    before(:each) { http_auth }

    let(:response) { {a: 'b', c: 'd'} }

    describe ".find_all" do
      it "returns all details" do
        allow(subject).to receive(:find_all).and_return(response)
        expect(subject.find_all).to eq(response)
      end
    end

    describe ".find_by_eid" do
      it "returns details for a given eid" do
        eid = 165

        allow(subject).to receive(:find_by_eid).with(eid).and_return(response)
        expect(subject.find_by_eid(eid)).to eq(response)
      end
    end

    describe ".find_by_name" do
      it "returns details for a given name" do
        name = 'abc'

        allow(subject).to receive(:find_by_name).with(name).and_return(response)
        expect(subject.find_by_name(name)).to eq(response)
      end
    end

    describe ".find_by_stat" do
      it "returns details for a given status" do
        status = 'ACTIVE'

        allow(subject).to receive(:find_by_status).with(status).and_return(response)
        expect(subject.find_by_status(status)).to eq(response)
      end
    end

  end

  RSpec.describe Common::OrderBase do
    before(:each) { http_auth }

    let(:response) { {a: 'b', c: 'd'} }

    describe ".find_by_account_num" do
      it "returns details for a given account number" do
        account_num = 100

        allow(subject).to receive(:find_by_account_num).with(account_num).and_return(response)
        expect(subject.find_by_account_num(account_num)).to eq(response)
      end
    end

    describe ".find_by_external_account_num" do
      it "returns details for a given external account number" do
        ext_account_num = 100

        allow(subject).to receive(:find_by_external_account_num).with(ext_account_num).and_return(response)
        expect(subject.find_by_external_account_num(ext_account_num)).to eq(response)
      end
    end

  end

  RSpec.describe Common::ServiceBase do
    before(:each) { http_auth }

    let(:response) { {a: 'b', c: 'd'} }

    describe ".find_by_service_eid" do
      it "returns details for a given service eid" do
        service_eid = 100

        allow(subject).to receive(:find_by_service_eid).with(service_eid).and_return(response)
        expect(subject.find_by_service_eid(service_eid)).to eq(response)
      end
    end

    describe ".find_by_start_dat" do
      it "returns details for a given start date" do
        start_date = '01/01/2016'

        allow(subject).to receive(:find_by_start_date).with(start_date).and_return(response)
        expect(subject.find_by_start_date(start_date)).to eq(response)
      end
    end

  end

end
