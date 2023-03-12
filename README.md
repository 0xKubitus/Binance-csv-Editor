# My tool to create a modified copy of Binance transactions history .csv files

The format of the modified .csv file (its headers) should be generic so that it can be used in later projects to group other CryptoExchanges' transactions history .csv files within the same template.

## THE GOAL OF THIS TOOL: I want only one line for each transaction, so I need to:

1. Set appropriate headers to the new .csv file;
2. Make sure that each transaction's data goes into the right column of the new .csv file;
3. Iterate through each transaction to find related transactions and compile them into a single line.

---

## How to use this tool?

1. Create a new folder.
2. Clone this repo inside your new folder, and add your Binance 'Transaction History' .csv file inside this folder.
3. Open "binance-CSV-editor.rb" in your IDE and modify: transactions_set_to_be_modified = 'your-Binance-Transaction-History-file.csv' according to the name of <em>'your-Binance-Transaction-History-file'</em>.
4. Open the folder in a Terminal window,and run the following command:<br><code>$ ruby binance-CSV-editor.rb</code>
5. Check your folder: it now includes 'modified_binance_transactions_set.csv' with all your Binance transactions, each taking a single row of the table.
6. Now you can do the same with your other crypto-exchanges transaction history .csv files and regroup everything using this template!
7. I will put here the links to my similar projects for Coinbase and Crypto.com/exchange...
</ol>
