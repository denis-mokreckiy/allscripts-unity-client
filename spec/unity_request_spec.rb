require 'spec_helper'

describe 'UnityRequest' do
  it_behaves_like 'a unity request'

  subject(:unity_request) { FactoryGirl.build(:unity_request) }

  describe '#initialize' do
    context 'when nil is given for parameters' do
      it { expect { FactoryGirl.build(:unity_request, :parameters => nil) }.to raise_error(ArgumentError) }
    end

    context 'when nil is given for timezone' do
      it { expect { FactoryGirl.build(:unity_request, :timezone => nil) }.to raise_error(ArgumentError) }
    end

    context 'when nil is given for appname' do
      it { expect { FactoryGirl.build(:unity_request, :appname => nil) }.to raise_error(ArgumentError) }
    end

    context 'when nil is given for security_token' do
      it { expect { FactoryGirl.build(:unity_request, :security_token => nil) }.to raise_error(ArgumentError) }
    end
  end

  describe '#to_hash' do
    it ':userid maps to UserID' do
      unity_request.parameters = FactoryGirl.build(:magic_request, :userid => 'UserID')
      expect(unity_request.to_hash['UserID']).to eq('UserID')
    end

    it ':data maps to Base64 encoded data' do
      unity_request.parameters = FactoryGirl.build(:magic_request, :data => 'data')
      expect(unity_request.to_hash['data']).to eq(['data'].pack('m'))
    end
  end
end