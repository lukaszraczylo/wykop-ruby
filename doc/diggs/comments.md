## Comments

Operations on comments

#### Adding comments

```
client.comments_add(:param1 => link_id, :param2 => comment_id_if_reply, :body => 'comment content', :embed => 'url-to-image-or-video')
```

#### Voting for comments

```
client.comments_plus(:param1 => link_id, :param2 => comment_id)
client.comments_minus(:param1 => link_id, :param2 => comment_id)
```

#### Editing comments

```
client.comments_edit(:param1 => comment_id, :body => 'comment - new content')
```

#### Removing comments

```
client.comments_delete(:param1 => comment_id)
```