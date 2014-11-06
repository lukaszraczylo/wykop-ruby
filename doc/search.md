### Search

#### Searching index

```
client.search_index({:q => 'potato'})

# Taking 3rd page of results
client.search_index({:q => 'potato', :page => 3})
```

#### Searching entries

```
client.search_entries({:q => 'potato'})

# Taking 2nd page of results
client.search_entries({:q => 'potato', :page => 2})
```

#### Searching profiles

```
client.search_profiles({:q => 'ouna-'})
```

#### Searching links 

```
# what – rodzaj znalezisk: all (wszystkie), promoted (na głównej), archive (zarchiwizowane), duplicates (duplikaty)
# sort – sortowanie: best (najlepsze), diggs (po liczbie wykopów), comments (po liczbie komentarzy), new (po czasie dodania)
# kind – rodzaj znalezisk: all (wszystkie), today (dzisiaj), yesterday (wczoraj), week (ostatni tydzień), month (ostatni miesiąc), range (zakres czasu)

# Searching for 'banana'
client.search_links({:q => 'potato'})

# ... and page of results
client.search_links({:q => 'potato', :page => 2})

# ... from the main page
client.search_links({:q => 'potato', :page => 2, :what => 'promoted'})

# ... etc.
```