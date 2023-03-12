## My tool to create a modified copy of Binance transactions history .csv files

#### THE GOAL: I want only one line for each transaction, so I need to:

<ol>
  <li>Set appropriate headers to the new .csv file;</li>
  <li>Make sure that each transaction's data goes into the right column of the new .csv file;</li>
  <li>Iterate through each transaction to find related transactions and compile them into a single line.</li>
</ol>

<small>
<em>/!\ The format of the modified .csv file (its headers) should be generic so that it can be used later to group other CryptoExchanges' transactions history .csv files...</em>
</small>

<br>
<br>
<hr>
<br>

## How to use this tool?

<ol>
<li>Create a new folder.</li>
<li>Clone this repo inside your new folder, and add your Binance 'Transaction History' .csv file inside this folder.</li>
<li>Open "binance-CSV-editor.rb" in your IDE and modify: transactions_set_to_be_modified = 'your-Binance-Transaction-History-file.csv' according to the name of <em>'your-Binance-Transaction-History-file'</em>.</li>
<li>
  Open the folder in a Terminal window and execute 'binance-CSV-editor.rb':
  <br>
  <code>ruby binance-CSV-editor.rb</code>
</li>
<li></li>
<li></li>
<li></li>
</ol>
```
