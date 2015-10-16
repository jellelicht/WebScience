-- Answer_Item [rel14]
alter table `answer`  add column  `item_oid`  integer;
alter table `answer`   add index fk_answer_item (`item_oid`), add constraint fk_answer_item foreign key (`item_oid`) references `item` (`oid`);


