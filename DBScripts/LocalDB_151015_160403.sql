-- Campaign_Task [rel2]
alter table `campaign`  add column  `task_oid`  integer;
alter table `campaign`   add index fk_campaign_task (`task_oid`), add constraint fk_campaign_task foreign key (`task_oid`) references `task` (`oid`);


