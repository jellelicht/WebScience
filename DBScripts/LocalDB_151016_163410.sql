-- Worker_Answer [rel15]
alter table `answer`  add column  `worker_oid`  integer;
alter table `answer`   add index fk_answer_worker (`worker_oid`), add constraint fk_answer_worker foreign key (`worker_oid`) references `worker` (`oid`);


