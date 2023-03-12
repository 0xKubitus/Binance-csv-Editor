=begin


GOAL = EACH TRANSACTION SHOULD:
                                -> NOT BE DESTRUCTURED INTO MULTIPLE LINES;
                                -> BELONG TO ONE OF THESE THREE CATEGORIES = "RECEIVE", "SEND" & "TRADE".

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

STEP 1: Set appropriate headers to the new .csv file = DONE
STEP 2 => Make sure that each transaction's details are  going into the right column of the new .csv file = IN PROGRESS


=end
#########################################################################



require 'csv'

# Assign the original binance file to a variable:
transactions_set_to_be_modified = 'binance_transactions-year_2021.csv' # <= /!\ REPLACE 'binance_transactions-year_2021.csv' WITH THE NAME OF YOUR BINANCE TRANSACTION HISTORY FILE /!\ 
# Read the transactions set to be modified:
transactions = CSV.read(transactions_set_to_be_modified)
# Create a new CSV file named 'modified_binance_transactions_set.csv':
CSV.open('modified_binance_transactions_set.csv', 'w') do |csv|
  # Write the headers for the modified transactions:
  csv << ['Platform: Exchange / Wallet', 'UTC_Time', 'Account / Public Address', 'Operation', 'Credited Asset', 'Credited Amount', 'Debited Asset', 'Debited Amount', 'Fee Asset', 'Fee Amount', 'Remark/Comments', 'Tx Id']
  
  # Loop through each transaction in the original CSV file:
  transactions.each_with_index do |transaction, index|
    # Skip the first row, which contains the headers:
    next if index == 0
    
    # Assign the transaction details to variables:
    platform = 'Binance' # (this value will replace the "User_Id" column from the original CSV file)
    timestamp = transaction[1]
    account = transaction[2]
    operation = transaction[3]
    coin = transaction[4]
    change = transaction[5]
    remark = transaction[6]

    # Define the credited asset & amount, the debited asset & amount, 
    # and eventual fee asset & amount for the transaction, depending of its type of 'Operation'
    case operation

    # OPERATION TYPE = "RECEIVE"
    when 'Deposit', 'Savings Distribution', 'BNB Vault Rewards'
      credited_asset = coin
      credited_amount = change
      debited_asset = ''
      debited_amount = ''
      fee_asset = ''
      fee_amount = ''

    # OPERATION TYPE = "SEND"
    when 'Withdrawal' 
      credited_asset = ''
      credited_amount = ''
      debited_asset = coin
      debited_amount = change
      fee_asset = ''
      fee_amount = ''

    # SPECIAL CASE: OPERATION TYPE = "TRADE"
    when 'Binance Convert'  
      if change > 0
        credited_asset = coin
        credited_amount = change
        debited_asset = ''
        debited_amount = ''
        fee_asset = ''
        fee_amount = ''
      elsif change < 0
        credited_asset = ''
        credited_amount = ''
        debited_asset = coin
        debited_amount = change
        fee_asset = ''
        fee_amount = ''
      end
    when 'Buy Crypto'
      if change > 0 && coin == 'EUR' # <= transaction = FIAT (EUR in my case) purchase and deposit on account 
        credited_asset = coin
        credited_amount = change
        debited_asset = ''
        debited_amount = ''
        fee_asset = ''
        fee_amount = ''
      elsif change < 0 # <= transaction = debit (should be FIAT - EUR in my case)
        credited_asset = ''
        credited_amount = ''
        debited_asset = coin
        debited_amount = change
        fee_asset = ''
        fee_amount = ''
      elsif change > 0 && coin != 'EUR' # <= transaction = credit (crypto)
        credited_asset = coin
        credited_amount = change
        debited_asset = ''
        debited_amount = ''
        fee_asset = ''
        fee_amount = ''
      end

    when 'Fee' # OPERATION TYPE = "FEES"
      credited_asset = ''
      credited_amount = ''
      debited_asset = ''
      debited_amount = ''
      fee_asset = coin
      fee_amount = change
    end
  end
end



#########################################################################
=begin


NEXT STEPS:
STEP 3 => Iterate through each transaction to find related transactions and compile them into a single line.


=end