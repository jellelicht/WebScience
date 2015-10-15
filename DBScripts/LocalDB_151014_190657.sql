-- Group [Group]
create table `group` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `module` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
);


-- User [User]
create table `user` (
   `oid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
  primary key (`oid`)
);


-- Worker [ent1]
create table `worker` (
   `oid`  integer  not null,
   `rewards`  integer,
   `name`  varchar(255),
   `birthdate`  date,
   `accuracy`  varchar(255),
  primary key (`oid`)
);


-- Requester [ent2]
create table `requester` (
   `oid`  integer  not null,
  primary key (`oid`)
);


-- Skill [ent3]
create table `skill` (
   `oid`  integer  not null,
   `name`  varchar(255),
  primary key (`oid`)
);


-- Campaign [ent4]
create table `campaign` (
   `oid`  integer  not null,
   `name`  varchar(255),
   `budget`  integer,
   `status`  bit,
  primary key (`oid`)
);


-- Item [ent5]
create table `item` (
   `oid`  integer  not null,
   `title`  varchar(255),
   `caption`  varchar(255),
   `url`  varchar(255),
  primary key (`oid`)
);


-- Task [ent6]
create table `task` (
   `oid`  integer  not null,
   `title`  varchar(255),
   `description`  varchar(255),
   `reward`  integer,
   `maxtime`  integer,
   `expirationtimestamp`  integer,
  primary key (`oid`)
);


-- Answer [ent7]
create table `answer` (
   `oid`  integer  not null,
   `value`  varchar(255),
   `evaluation`  varchar(255),
  primary key (`oid`)
);


-- CompletedTask [ent8]
create table `completedtask` (
   `oid`  integer  not null,
   `finished`  bit,
   `starttime`  integer,
  primary key (`oid`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`  add column  `module_oid`  integer;
alter table `group`   add index fk_group_module (`module_oid`), add constraint fk_group_module foreign key (`module_oid`) references `module` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_oid`  integer not null,
   `module_oid`  integer not null,
  primary key (`group_oid`, `module_oid`)
);
alter table `group_module`   add index fk_group_module_group (`group_oid`), add constraint fk_group_module_group foreign key (`group_oid`) references `group` (`oid`);
alter table `group_module`   add index fk_group_module_module (`module_oid`), add constraint fk_group_module_module foreign key (`module_oid`) references `module` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_oid`  integer;
alter table `user`   add index fk_user_group (`group_oid`), add constraint fk_user_group foreign key (`group_oid`) references `group` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `user_oid`  integer not null,
   `group_oid`  integer not null,
  primary key (`user_oid`, `group_oid`)
);
alter table `user_group`   add index fk_user_group_user (`user_oid`), add constraint fk_user_group_user foreign key (`user_oid`) references `user` (`oid`);
alter table `user_group`   add index fk_user_group_group (`group_oid`), add constraint fk_user_group_group foreign key (`group_oid`) references `group` (`oid`);


-- Answer_Item [rel10]
create table `answer_item` (
   `answer_oid`  integer not null,
   `item_oid`  integer not null,
  primary key (`answer_oid`, `item_oid`)
);
alter table `answer_item`   add index fk_answer_item_answer (`answer_oid`), add constraint fk_answer_item_answer foreign key (`answer_oid`) references `answer` (`oid`);
alter table `answer_item`   add index fk_answer_item_item (`item_oid`), add constraint fk_answer_item_item foreign key (`item_oid`) references `item` (`oid`);


-- Answer_CompletedTask [rel11]
alter table `completedtask`  add column  `answer_oid`  integer;
alter table `completedtask`   add index fk_completedtask_answer (`answer_oid`), add constraint fk_completedtask_answer foreign key (`answer_oid`) references `answer` (`oid`);


-- Task_CompletedTask [rel12]
create table `task_completedtask` (
   `task_oid`  integer not null,
   `completedtask_oid`  integer not null,
  primary key (`task_oid`, `completedtask_oid`)
);
alter table `task_completedtask`   add index fk_task_completedtask_task (`task_oid`), add constraint fk_task_completedtask_task foreign key (`task_oid`) references `task` (`oid`);
alter table `task_completedtask`   add index fk_task_completedtask_complete (`completedtask_oid`), add constraint fk_task_completedtask_complete foreign key (`completedtask_oid`) references `completedtask` (`oid`);


-- Worker_User [rel2]
alter table `user`  add column  `worker_oid`  integer;
alter table `user`   add index fk_user_worker (`worker_oid`), add constraint fk_user_worker foreign key (`worker_oid`) references `worker` (`oid`);


-- Requester_User [rel3]
alter table `user`  add column  `requester_oid`  integer;
alter table `user`   add index fk_user_requester (`requester_oid`), add constraint fk_user_requester foreign key (`requester_oid`) references `requester` (`oid`);


-- Worker_Skill [rel4]
create table `worker_skill` (
   `worker_oid`  integer not null,
   `skill_oid`  integer not null,
  primary key (`worker_oid`, `skill_oid`)
);
alter table `worker_skill`   add index fk_worker_skill_worker (`worker_oid`), add constraint fk_worker_skill_worker foreign key (`worker_oid`) references `worker` (`oid`);
alter table `worker_skill`   add index fk_worker_skill_skill (`skill_oid`), add constraint fk_worker_skill_skill foreign key (`skill_oid`) references `skill` (`oid`);


-- Requester_Campaign [rel5]
alter table `requester`  add column  `campaign_oid`  integer;
alter table `requester`   add index fk_requester_campaign (`campaign_oid`), add constraint fk_requester_campaign foreign key (`campaign_oid`) references `campaign` (`oid`);


-- Skill_Task [rel6]
create table `skill_task` (
   `skill_oid`  integer not null,
   `task_oid`  integer not null,
  primary key (`skill_oid`, `task_oid`)
);
alter table `skill_task`   add index fk_skill_task_skill (`skill_oid`), add constraint fk_skill_task_skill foreign key (`skill_oid`) references `skill` (`oid`);
alter table `skill_task`   add index fk_skill_task_task (`task_oid`), add constraint fk_skill_task_task foreign key (`task_oid`) references `task` (`oid`);


-- Item_Task [rel7]
create table `item_task` (
   `item_oid`  integer not null,
   `task_oid`  integer not null,
  primary key (`item_oid`, `task_oid`)
);
alter table `item_task`   add index fk_item_task_item (`item_oid`), add constraint fk_item_task_item foreign key (`item_oid`) references `item` (`oid`);
alter table `item_task`   add index fk_item_task_task (`task_oid`), add constraint fk_item_task_task foreign key (`task_oid`) references `task` (`oid`);


-- Worker_Answer [rel9]
create table `worker_answer` (
   `worker_oid`  integer not null,
   `answer_oid`  integer not null,
  primary key (`worker_oid`, `answer_oid`)
);
alter table `worker_answer`   add index fk_worker_answer_worker (`worker_oid`), add constraint fk_worker_answer_worker foreign key (`worker_oid`) references `worker` (`oid`);
alter table `worker_answer`   add index fk_worker_answer_answer (`answer_oid`), add constraint fk_worker_answer_answer foreign key (`answer_oid`) references `answer` (`oid`);


