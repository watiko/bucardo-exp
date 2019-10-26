BEGIN TRANSACTION;

INSERT INTO users(user_id, name)
  VALUES (4, 'Dark')
       ;

INSERT INTO todos(user_id, title, completed)
  VALUES (1, 'final todo', true)
       , (4, 't2', false)
       , (4, 't4', true)
       , (4, 't5', false)
       , (4, 't7', false)
       ;

COMMIT;
