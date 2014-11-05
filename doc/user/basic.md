### User

#### Logging in

```
client = Wykop::Client.new({ app_user_key: CFG_USER_KEY, app_user_secret: CFG_USER_SECRET, 
				app_username: CFG_USER_NAME, app_generated_key: CFG_GEN_SECRET, api_host: 'http://a.wykop.pl' })
if client.login
	(...)
end
```

#### Getting user favorites

```
client.favorites
```

#### Getting user observed diggs

```
client.observed
```

#### Getting user observed tags

```
client.tags
```

#### Getting user information

```
client.info
```

Returns all available client information ( after successful log in )

```
client.info('signup_date')
```

Returns sign up date for client account. Acceptable parameters:

```
{
               "login" => "ouna-",
               "email" => "224af1bddf5::banana",
        "public_email" => "",
                "name" => "",
                 "www" => "",
              "jabber" => "",
                  "gg" => "",
                "city" => "",
               "about" => "Sysadmin.",
        "author_group" => 1,
         "links_added" => 71,
     "links_published" => 6,
            "comments" => 2617,
                "rank" => 1380,
           "followers" => 20,
           "following" => 5,
             "entries" => 5,
    "entries_comments" => 15,
               "diggs" => 3971,
              "buries" => 1521,
              "groups" => 0,
       "related_links" => 59,
         "signup_date" => "2007-12-04 11:50:25",
              "avatar" => "http://xG.cdn03.imgwykop.pl/c3397992/ouna-_GMaL3lbIGi,q60.jpg",
          "avatar_big" => "http://xG.cdn03.imgwykop.pl/c3397992/ouna-_GMaL3lbIGi,q150.jpg",
          "avatar_med" => "http://xG.cdn03.imgwykop.pl/c3397992/ouna-_GMaL3lbIGi,q48.jpg",
           "avatar_lo" => "http://xG.cdn03.imgwykop.pl/c3397992/ouna-_GMaL3lbIGi,q30.jpg",
         "is_observed" => nil,
          "is_blocked" => nil,
                 "sex" => "male",
                 "url" => "http://www.wykop.pl/ludzie/ouna-/",
       "violation_url" => nil,
             "userkey" => "aooo::potato"
}
```