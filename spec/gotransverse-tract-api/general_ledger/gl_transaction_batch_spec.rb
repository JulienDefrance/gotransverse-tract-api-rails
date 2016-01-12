require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe GeneralLedger::GLTransactionBatch do
    before(:each) { http_auth }

    let(:eid) { '4096' }
    let(:response) { '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>' }

    context ".update" do
      it "updates a transaction" do
        data = { eid: eid, exported: 'true' }
        allow(subject).to receive(:update).with(eid, data).and_return(response)
        expect(subject.update(eid, data)).to eq(response)
      end
    end

  end
end

