# words_path

## Outline
The problem is to find "word paths". What this meas is that you find. apath from one word to another word, changing one letter each step, and each intermediate word must be in the dictionary.

## Some example solutions:
```
rial -> real -> feal -> foal -> foul -> foud
yagi -> yali -> pali -> palp -> paup -> plup -> blup
jina -> pina -> pint -> pent -> peat -> prat -> pray
fike -> fire -> fare -> care -> carp -> camp
```
## Get help to run the script
```
$ ruby words_path.rb -h
Usage: word_path.rb -f DICTIONARY_FILE_PATH -s START_WORD -e END_WORD
    -f DICTIONARY_FILE_PATH,	Path to the dictionary file
    	--dictionary_file_path
    -s DICTIONARY_FILE_PATH,	Start word to begin the path
    	--start_word 
    -e DICTIONARY_FILE_PATH,	End word to finish the path
    	--end_word
```

## Example of running the script
```
$ ruby words_path.rb -f /usr/share/dic/words -s rial -e foud
Searching... Got it!
rial -> dial -> deal -> feal -> foal -> foul -> foud
```

## Running the tests
```
$ ruby test/test_path.rb
MiniTest::Unit::TestCase is now Minitest::Test. from test/test_path.rb:5:in '<main>'
Run options: --seed 50657

# Running
```
........
Finished in 3.110558s, 2.2504 runs/s, 4.8223 assertions/s.

7 runs, 15 assertions, 0 failures, 0 errors, 0 skips
```
```
$ ruby test/test_node.rb
MiniTest::Unit::TestCase is now Minitest::Test. form test/test_node.rb:4:in '<main>'
Run options: --seed 61093

## Running
...

Finished in 0.001206s, 2488.5052 runs/s, 2488.5052 assertions/s.

3 runs, 3 assertions, 0 failures, 0 errors, 0 skips
```

## Requirements
Ruby 2.0 or greater 