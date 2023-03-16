require 'csv'
require 'time'

def sort_transactions_chronologically(csv_file)
  begin
    transactions = []
    # Read the CSV file and store each row as a transaction
    CSV.foreach(csv_file, headers: true) do |row|
      transactions << row.to_h
    end

    # Sort the transactions by UTC time in ascending order
    sorted_transactions = transactions.sort_by { |t| Time.parse(t['UTC_Time']) }

    # Output the sorted transactions
    CSV.open("./data/outputs/sorted_transactions.csv", 'wb') do |csv|
      csv << sorted_transactions.first.keys
      sorted_transactions.each do |transaction|
        csv << transaction.values
      end
    end

    puts ""
    puts "# # # # # # # # # #"
    puts "'sorted_transactions.csv' has been created! Transactions are now sorted by UTC time."
    puts "# # # # # # # # # #"
  rescue => exception
    puts "Error occurred while processing 'csv_file': #{exception.message}"
  end
end
