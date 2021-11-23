require "bank"

describe Bank, "test user interface and functionality" do

  bank = Bank.new
  
  context "Respond to methods and object" do
    it "Creates new Bank object" do
      expect(bank).to be_instance_of Bank
    end
    
    it "Check if menu exist" do
      expect(bank).to respond_to(:menu)
    end 

	it "Check if action exist" do
      expect(bank).to respond_to(:action)
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

	it "Check if statement exist" do
      expect(bank).to respond_to(:statement)
    end 

  end

	context "Account balance to be expected on account set up" do

		it "Account balance is zero when show account" do
			expect { bank.show }.to output("You have 0 pounds in your account\n").to_stdout
		end

		let(:user_input) { ["1\n", "12\n", "exit\n"] }
		let(:expected_output) { ["Enter 1 - deposit",
			"Enter 2 - show balance",
			"Enter 3 - withdraw",
			"Enter 4 - show transactions",
			"Write 'exit' to exit",
			"How much would like to deposit",
			"You have now 12.0 pounds in your account",
      "Enter 1 - deposit",
      "Enter 2 - show balance",
			"Enter 3 - withdraw",
			"Enter 4 - show transactions",
			"Write 'exit' to exit"].join("\n.*") }
    
		it "Account deposit 12 pounds" do
			set_user_input_and_check_expected_output
		end
  end

	
  context "Account withdrawal to reduce the amount" do

		let(:user_input) { ["1\n", "12\n", "3\n", "10\n", "exit\n"] }
		let(:expected_output) { ["Enter 1 - deposit",
			"Enter 2 - show balance",
			"Enter 3 - withdraw",
			"Enter 4 - show transactions",
			"Write 'exit' to exit",
			"How much would like to deposit",
			"You have now 12.0 pounds in your account",
			"Enter 1 - deposit",
			"Enter 2 - show balance",
			"Enter 3 - withdraw",
			"Enter 4 - show transactions",
			"Write 'exit' to exit",
			"How much would you like to withdraw?"].join("\n.*") }
    let(:expected_output) { [
      "You have now 2.0 pounds in your account",
      "Enter 1 - deposit",
      "Enter 2 - show balance",
      "Enter 3 - withdraw",
      "Enter 4 - show transactions",
      "Write 'exit' to exit"].join("\n.*") }
			
		it "Account withdraw 2 pounds" do
			set_user_input_and_check_expected_output
		end

		it "Account withdraw 2 pounds" do
			bank.deposit(12)
			bank.withdraw(10)
			expect { bank.show }.to output("You have 2 pounds in your account\n").to_stdout
    end
	end

  context "Account to show balance" do
		let(:user_input) { ["1\n", "15\n", "2\n", "exit\n"] }
		let(:expected_output) { ["Enter 1 - deposit",
			"Enter 2 - show balance",
			"Enter 3 - withdraw",
			"Enter 4 - show transactions",
			"Write 'exit' to exit",
			"How much would like to deposit",
			"You have now 15.0 pounds in your account",
			"Enter 1 - deposit",
			"Enter 2 - show balance",
			"Enter 3 - withdraw",
			"Enter 4 - show transactions",
			"Write 'exit' to exit",
			"You have 15.0 pounds in your account",
      "Enter 1 - deposit",
			"Enter 2 - show balance",
			"Enter 3 - withdraw",
			"Enter 4 - show transactions",
			"Write 'exit' to exit"].join("\n.*") }
			
		it "Balance of 15 pounds" do
			set_user_input_and_check_expected_output
		end
  end

  context "Account to show statement" do
		let(:user_input) { ["1\n", "15\n", "4\n", "exit\n"] }
		let(:expected_output) { ["Enter 1 - deposit",
			"Enter 2 - show balance",
			"Enter 3 - withdraw",
			"Enter 4 - show transactions",
			"Write 'exit' to exit",
			"How much would like to deposit",
			"You have now 15.0 pounds in your account",
			"Enter 1 - deposit",
			"Enter 2 - show balance",
			"Enter 3 - withdraw",
			"Enter 4 - show transactions",
			"Write 'exit' to exit"].join("\n.*") }
    let(:expected_output) { [
			"Current balance: 15.0 pounds",
      "Enter 1 - deposit",
			"Enter 2 - show balance",
			"Enter 3 - withdraw",
			"Enter 4 - show transactions",
			"Write 'exit' to exit"].join("\n.*") }
			
		it "Balance of 15 pounds" do
			set_user_input_and_check_expected_output
		end
  end
end

def set_user_input_and_check_expected_output
	allow_any_instance_of(Object).to receive(:gets).and_return(*user_input)

	expect { Bank.new.menu }.to output(/#{expected_output}/m).to_stdout
end