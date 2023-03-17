# My tool to create a modified copy of Binance transactions history .csv files

The format of the modified .csv file (its headers) should be generic so that it can be used in later projects to group other CryptoExchanges' transactions history .csv files, as well as my on-chain transactions from different wallets within the same template.

## THE GOAL OF THIS TOOL: I want only one line for each transaction, so I need to ->

1. Set appropriate headers to the new .csv file;
2. Make sure that each transaction's data goes into the right column of the new .csv file;
3. Iterate through each transaction to find related transactions and compile them into a single line.

---

## How to use this tool?

1. Create a new folder.
2. Clone this repo inside your new folder, and add your Binance 'Transaction History' .csv file inside '/data/input' folder.
   -> your binance file should look like this: "part-00000-8aae60e2-9a76-4765-98b2-9d4f5ff6eff8-c000.csv"
3. Open "main.rb" in your IDE and modify: input_file = 'test-Tx-set.csv.csv' according to the name of 'your-Binance-Transaction-History-file'.
4. Open the folder in a Terminal window,and run the following command:<br><code>$ ruby binance-CSV-editor.rb</code>

FOR NOW, YOU HAVE A BETTER FORMAT, AND ALL TRANSACTIONS SORTED CHRONOLOGICALLY IN 'data/outputs/sorted_transactions.csv'
NEXT STEPS WILL COME LATER =>

1. Check 'data/outputs' folder: it now includes 'all_binance_transactions_grouped_together.csv' with all your Binance transactions, each taking a single row of the table.
2. Now you can do the same with your other crypto-exchanges transaction history .csv files and regroup everything using this template!
3. I will put here the links to my similar projects for Coinbase and Crypto.com/exchange...
