# STEP 1: Set appropriate headers to the new .csv file.
# STEP 2 => Make sure that each transaction's details are  going into the right column of the new .csv file.


#########################################################################


require 'csv'


def change_table_format(csv_input_file)
  # Read the transactions set to be modified:
  transactions = CSV.read(csv_input_file)

  # Create a new CSV file named 'modified_transactions.csv':
  CSV.open('./data/outputs/modified_transactions.csv', 'w') do |csv|

    # Write the headers for the modified transactions:
    csv << ['EXCHANGE or WALLET', 'UTC_Time', 'Account or Public Address', 'Operation', 'Credited Asset', 'Credited Amount', 'Debited Asset', 'Debited Amount', 'Fee Asset', 'Fee Amount', 'Remark or Comments', 'Tx Id']
    
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
      change = transaction[5].to_f
      remark = transaction[6]
      tx_id = "" # no Tx_ID in Binance, but it has to be there for other transactions like DeFi

      puts "transaction[5].class = " # SHOULD BE A COMMENT
      puts transaction[5].class # SHOULD BE A COMMENT
      # puts "change.class = " # SHOULD BE A COMMENT
      # puts change.class # SHOULD BE A COMMENT
      # puts "- - - - -" # SHOULD BE A COMMENT


      # Define the credited asset & amount, the debited asset & amount, 
      # and eventual fee asset & amount for the transaction, depending of its type of 'Operation'
      case operation

      # OPERATION TYPE = "RECEIVE"
      when 'Deposit', 'Savings Distribution', 'BNB Vault Rewards', 'Distribution', 'ETH 2.0 Staking Rewards', 'Savings Distribution', 'Simple Earn Flexible Airdrop', 'Simple Earn Flexible Interest', 'Simple Earn Locked Rewards', 'Staking Redemption', 'Staking Rewards', 'Transaction Buy', 'Transaction Revenue'
        credited_asset = coin
        credited_amount = change
        debited_asset = ''
        debited_amount = ''
        fee_asset = ''
        fee_amount = ''

      # OPERATION TYPE = "SEND"
      when 'Withdraw', 'Simple Earn Flexible Subscription', 'Simple Earn Locked Subscription', 'Staking Purchase', 'Transaction Related', 'Transaction Sold', 'Transaction Spend'
        credited_asset = ''
        credited_amount = ''
        debited_asset = coin
        debited_amount = change
        fee_asset = ''
        fee_amount = ''

      # SPECIAL CASES - OPERATION TYPE = "SEND or RECEIVE" 
      # despite occuring at the same time, both transactions must remain separate as these are not trades!
      when 'ETH 2.0 Staking', 'Simple Earn Flexible Redemption' 
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

      # SPECIAL CASES - OPERATION TYPE = "TRADE"
      when 'Binance Convert', 'Small Assets Exchange BNB', 'Stablecoins Auto-Conversion'
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


      # Create an array for the modified transaction
      modified_transaction = [platform, timestamp, account, operation, credited_asset, credited_amount, debited_asset, debited_amount, fee_asset, fee_amount, remark, tx_id]

      # Write the modified transaction to the new CSV file
      csv << modified_transaction

      puts "change.class = " # SHOULD BE A COMMENT
      puts change.class # SHOULD BE A COMMENT
      puts "- - - - -" # SHOULD BE A COMMENT

    end
  end

  puts "" # SHOULD BE A COMMENT
  puts "= = = = =" # SHOULD BE A COMMENT
  puts "=> 'modified_transactions.csv' successfully created inside './data/outputs/' folder!" # SHOULD BE A COMMENT
  puts "= = = = =" # SHOULD BE A COMMENT
      
end


