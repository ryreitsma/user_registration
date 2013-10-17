require "spec_helper"

describe Fakeable do
  let(:fakeable_class) {
    Class.new do
      include ActiveModel::Model
      include Fakeable

      attr_accessor :id, :updated_at, :created_at, :some_attribute
    end
  }

  describe :fake do
    let(:the_fake) { fakeable_class.fake }

    it "fakes an id" do
      expect(the_fake.id).to be_a Fixnum
    end

    it "fakes a created_at timestamp" do
      expect(the_fake.created_at).to be_a Time
    end

    it "fakes an update_at timestamp" do
      expect(the_fake.updated_at).to be_a Time
    end

    context "when an attribute hash is provided" do
      let(:attribute) { :some_attribute }
      let(:value) { 'some_value' }

      let(:the_fake) { fakeable_class.fake(attribute => value) }

      it "copies relevant attributes" do
        expect(the_fake.send(attribute)).to eql(value)
      end
    end
  end
end
