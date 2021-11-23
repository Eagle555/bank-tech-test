# frozen_string_literal: true

require 'balance'

describe Balance, 'test object and logic' do
  balance = Balance.new

  context 'Respond to methods and object' do
    it 'Creates new Bank object' do
      expect(balance).to be_instance_of Balance
    end

    it 'Check if add_and_verify exist' do
      expect(balance).to respond_to(:add_and_verify)
    end

    it 'Check if deduct_and_verify exist' do
      expect(balance).to respond_to(:deduct_and_verify)
    end

    it 'Check if show_balance exist' do
      expect(balance).to respond_to(:show_balance)
    end
  end

  context 'Account balance to be correct' do
    it 'Account balance is zero when show account' do
      expect(balance.show_balance).to eq(0)
      expect(balance.instance_variable_get(:@credit)).to eq(0)
    end

    it 'Account balance is 12.99 when deposit is made' do
      expect(balance.add_and_verify(12.99)).to be_truthy
      expect(balance.instance_variable_get(:@credit)).to eq(12.99)
    end

    it 'Account balance is 8 when withdraw is made' do
      expect(balance.deduct_and_verify(4.99)).to be true
      expect(balance.instance_variable_get(:@credit)).to eq(8)
    end

    it "Can't withdraw more then in account" do
      expect(balance.deduct_and_verify(9)).to be false
      expect(balance.instance_variable_get(:@credit)).to eq(8)
    end
  end
end
