## Related links


#### Voting

```
client.related_vote_up(:param1 => { :param1 => 2242488, :param2 => 27794764 })
client.related_vote_down(:param1 => { :param1 => 2242488, :param2 => 27794764 })
```

Where

* param1 => digg ID
* param2 => related ID

#### Adding new

```
client.related_add({ :param1 => 2242488, :url => 'http://github.com/lukaszraczylo/wykop-ruby', :title => '(test) ruby gem dla wykop.pl', :plus18 => 0})
```
