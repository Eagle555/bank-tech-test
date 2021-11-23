require "account"

describe Account, "test deposit, withdrawal and verification" do

  account = Account.new

  context "Expect account to deposit and withdraw" do
	
    it "New account - empty and no transactions" do
      expect(account.instance_variable_get(:@ledger)).to eq([])
      expect(account.current_balance).to eq(0)
      expect { account.transactions }.to output(/No transactions yet/m).to_stdout
    end

		it "Account deposit 20 pounds" do
      account.pay_in(20)
			expect(account.current_balance).to eq(20)
		end

		it "Account withdraw 2 pounds" do
      account.pay_out(2)
			expect(account.current_balance).to eq(18)
		end

		it "Account show transactions" do
			expect { account.transactions }.to output( include("Amount: 2", "Type: deposit", "Type: withdrawal") ).to_stdout
    end
  end

  context "Expect account to prevent fraud" do
    it "Account prevent withdrawal when amount larger then the balance" do
      expect { account.pay_out(20) }.to output( include("Transaction unsuccessful") ).to_stdout
			expect { account.transactions }.to output( include("withdrawal - operation cancelled") ).to_stdout
    end

    it "Transaction verification failed on negative pay out" do
      expect { account.pay_out(-10) }.to output( include("transaction not recorded") ).to_stdout
    end

    it "Transaction verification failed on negative pay in" do
      expect { account.pay_in(-10) }.to output( include("transaction not recorded") ).to_stdout
    end

    it "Transaction failed is amount is to large" do
      expect { account.pay_in(1_000_000_000_001) }.to output( include("Transaction unsuccessful") ).to_stdout
      expect { account.transactions }.to output( include("deposit - operation cancelled") ).to_stdout
    end
	end

end