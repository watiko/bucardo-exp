INSERT INTO users(user_id, name)
  VALUES (1, 'Alice')
       , (2, 'Bob')
       , (3, 'Charles')
       ;

INSERT INTO todos(user_id, title, completed)
  VALUES (1, 'first todo', true)
       , (1, 'next todo', false)
       , (2, 'first todo', false)
       , (3, 'same', false)
       , (3, 'same', false)
       , (3, 't1', false)
       , (3, 't2', false)
       , (3, 't4', true)
       , (3, 't5', false)
       , (3, 't7', false)
       ;
