-- Campaign_Requester [rel13]
alter table `campaign`  add column  `requester_oid`  integer;
alter table `campaign`   add index fk_campaign_requester (`requester_oid`), add constraint fk_campaign_requester foreign key (`requester_oid`) references `requester` (`oid`);


