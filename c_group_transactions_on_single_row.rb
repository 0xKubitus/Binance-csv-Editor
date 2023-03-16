require 'csv'

def group_transactions_on_single_row()
  # read the input csv file
  input_file = "test-Tx-set.csv"
  transactions = CSV.read(input_file, headers: true)


end

group_transactions_on_single_row()