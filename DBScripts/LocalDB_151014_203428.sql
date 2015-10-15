-- Worker_Task [rel1]
create table `worker_task` (
   `worker_oid`  integer not null,
   `task_oid`  integer not null,
  primary key (`worker_oid`, `task_oid`)
);
alter table `worker_task`   add index fk_worker_task_worker (`worker_oid`), add constraint fk_worker_task_worker foreign key (`worker_oid`) references `worker` (`oid`);
alter table `worker_task`   add index fk_worker_task_task (`task_oid`), add constraint fk_worker_task_task foreign key (`task_oid`) references `task` (`oid`);


