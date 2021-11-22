require "bank"

describe Bank, "#method" do
  bank = Bank.new
  
  context "Respond to methods and object" do

    it "creates new Bank object" do
        expect(bank).to be_instance_of Bank
    end
    
    it "Check if menu exist" do
        expect(bank).to respond_to(:menu)
    end 
    
    
    it "Check if show account exist" do
        expect(bank).to respond_to(:show)
    end 
    
    it "Check if deposit exist" do
        expect(bank).to respond_to(:deposit)
    end 
    
    it "Check if withdraw exist" do
        expect(bank).to respond_to(:withdraw)
    end 

  end

	context "Expect menu to respond to user input" do
		  
			let(:user_input) { ["2\n", "exit\n"] }
			let(:expected_output) { "You have 0 pounds in your account" }
	
			it "output user balance of zero" do
				set_user_input_and_check_expected_output
			end
		end


	context "Account balance to be expected on account set up" do

		it "Account balance is zero when show account" do
			expect { bank.show }.to output("You have 0 pounds in your account\n").to_stdout
			expect(bank.instance_variable_get(:@bank)).to eq(0)
		end

		it "Account deposit 2 pounds" do
			expect { bank.deposit }.to output("You have 2 pounds in your account\n").to_stdout
			xpect(bank.instance_variable_get(:@bank)).to eq(2)
		end

		it "Account withdraw 2 pounds" do
			expect { bank.withdraw }.to output("You have 0 pounds in your account\n").to_stdout
			xpect(bank.instance_variable_get(:@bank)).to eq(0)
		end

		it "Account show 2 pounds" do
			expect { bank.show }.to output("You have 0 pounds in your account\n").to_stdout
		end

	end
  
end

describe Bank, "#variable" do
 
  bank = Bank.new
  
  bank.instance_variable_set(:@bank, 12) 
  
	context "Expect account variable to respond to change" do

		it "Account shows 12 when variable set to 12" do
			expect(bank.instance_variable_get(:@bank)).to eq(12)
		end
		
		it "Account show 12 pounds" do
			expect { bank.show }.to output("You have 12 pounds in your account\n").to_stdout
		end

  end

end

describe Bank, "#functionality" do

	bank = Bank.new

  context "Expect bank function correctly" do
	
		it "Account deposit 2 pounds" do
			expect { bank.deposit }.to output("You have 2 pounds in your account\n").to_stdout
			expect(bank.instance_variable_get(:@bank)).to eq(2)
		end

		it "Account withdraw 2 pounds" do
			expect { bank.withdraw }.to output("You have 0 pounds in your account\n").to_stdout
			expect(bank.instance_variable_get(:@bank)).to eq(0)
		end

		it "Account show 2 pounds" do
			expect { bank.show }.to output("You have 0 pounds in your account\n").to_stdout
		end

		it "Account show 2 pounds" do
			expect { bank.history }.to output(/Amount: 2/, /Type: deposit/, /Amount: 0/, /Type: withdraw/).to_stdout
    end

	end

end


def set_user_input_and_check_expected_output
	allow_any_instance_of(Object).to receive(:gets).and_return(*user_input)

	expect { load "lib/bank.rb" }.to output(/#{expected_output}/m).to_stdout
end