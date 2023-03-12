=begin


GOAL = EACH TRANSACTION SHOULD:
                                -> NOT BE DESTRUCTURED INTO MULTIPLE LINES;
                                -> BELONG TO ONE OF THESE THREE CATEGORIES = "RECEIVE", "SEND" & "TRADE".

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

STEP 1: Set appropriate headers to the new .csv file


=end
#########################################################################



require 'csv'

# Assign the original binance file to a variable
transactions_set_to_be_modified = 'binance_transactions-year_2021.csv'

# Read the transactions set to be modified
transactions = CSV.read(transactions_set_to_be_modified)

# Create a new CSV file named 'modified_binance_transactions_set.csv'
CSV.open('modified_binance_transactions_set.csv', 'w') do |csv|
  
  # Write the headers for the modified transactions
  csv << ['Platform: Exchange / Wallet', 'UTC_Time', 'Account / Public Address', 'Operation', 'Credited Asset', 'Credited Amount', 'Debited Asset', 'Debited Amount', 'Fee Asset', 'Fee Amount', 'Remark/Comments']
  
end



#########################################################################
=begin


NEXT STEPS:
STEP 2 => Make sure that each transaction's data goes into the right column of the new .csv file;
STEP 3 => Iterate through each transaction to find related transactions and compile them into a single line.


=end