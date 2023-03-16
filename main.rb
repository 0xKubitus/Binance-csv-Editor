require_relative "./a_change_table_format.rb"
require_relative "./b_sort_transactions_chronologically.rb"
# require "./group_transactions_on_single_row.rb"


# /!\ ON THE LINE BELOW, YOU HAVE TO REPLACE 'test-Tx-set.csv' WITH THE NAME OF YOUR BINANCE TRANSACTION HISTORY FILE /!\
input_file = "./data/input/test-Tx-set.csv" 


# STEP1: Change the table's headers: 
change_table_format(input_file) 


# STEP2: Make sure all transactions are sorted by chronological order:
data_to_sort = "./data/outputs/modified_transactions.csv"
sort_transactions_chronologically(data_to_sort)


# STEP3: Group related transactions together, on a single row:
# group_transactions_on_single_row()
