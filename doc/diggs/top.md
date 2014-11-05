## Top

Displays information about top diggs

#### top_index

Hits of the year

```
client.top_index
client.top_index(2013)
```

#### top_date

Hits of the month

```
#current
client.top_date

#year
client.top_date(2013)

#year and month
client.top_date(2013, 12)

#year month and page
client.top_date(2013, 12, 1)
```

Default values ( if not specified ) are:
- last year
- January
- 0 page ( first )


#### top_hits

Hits, random ones - from 'wybrane hity'

```
client.top_hits
```
