require 'spec_helper'

describe NPPESApi do
  it 'has a version number' do
    expect(NPPESApi::VERSION).not_to be nil
  end

  context "base_url" do
    it "defaults to NPPES_BASE_URL" do
      allow(RestClient).to receive(:get).and_return(double("resp", body: "[]"))

      NPPESApi::search({})

      expect(RestClient).to have_received(:get).with(
        NPPESApi::NPPES_BASE_URL,
        {
          params: { address_purpose: "", version: 2.1 },
        },
      )
    end

    it "allows an alternative base_url" do
      allow(RestClient).to receive(:get).and_return(double("resp", body: "[]"))

      NPPESApi::search({ base_url: "http://foo" })

      expect(RestClient).to have_received(:get).with(
        "http://foo",
        {
          params: { address_purpose: "", version: 2.1 },
        },
      )
    end
  end
end
