## Tag

Works with diggs related to tags

#### tag_show

Returns an array of diggs assigned to given tag

```
client.tag_show(:param1 => 'polityka', :type => 'links', :page => 3)
```

Available types:
```
- index ( all diggs )
- links
- entries ( mikroblog )
```

If no type specified it fails back to **index**


#### tag_observe / tag_unobserve

Add / remove tag from observed list

```
client.tag_observe(:param1 => 'polityka')
client.tag_unobserve(:param1 => 'polityka')
```

Returns **error 999 / "Cos kombinujesz" ** if you apply change more than once to the same tag.

#### tag_block / tag_unblock

Add / remove tag from blocked list

```
client.tag_block(:param1 => 'polityka')
client.tag_unblock(:param1 => 'polityka')
```