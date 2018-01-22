use icc;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;


delete from `temple-branch`;
INSERT INTO `temple-branch`(`id`,`name`,`temple-id`,`physical-address-id`,`contact-number`,`contact-name`,`created-by`,`updated-by`,`created-on`,`updated-on`) VALUES('92bdd6d8-4788-496a-96dc-72cf6df6fd5c','ICC - Jayanagar Centre','4ee2d7f5-9f3b-4add-986a-7f1d5658509a',NULL,NULL,'Rangaraj Krishna Dasa','string','string','2018-01-02 07:09:44','2018-01-02 10:32:30');

delete from circle;
INSERT INTO `circle` VALUES ('25067975-fcaa-4e80-959c-433f11b64989','Mayapur',NULL,'2018-01-01 10:35:51','2018-01-01 10:39:03','string','string'),('f36e9c73-d8f4-4bfd-901d-2d2ac7b8a5e5','Jagannaths Mercy',NULL,'2018-01-01 10:35:51','2018-01-01 10:38:26','string','string');

delete from `asrama-master` ;
INSERT INTO `asrama-master` VALUES ('56b94564-9237-402c-8fe7-7b5d95456749','Vanaprastha','Vanaprastha','2018-01-01 15:27:58','2018-01-01 15:38:26',NULL,NULL),('e608b870-cf32-4a14-8680-9e6046d07ce4','Brahmachari','Brahmachari','2018-01-01 15:27:58','2018-01-01 15:37:53',NULL,NULL),('eff83f8d-2ab3-4901-9fdc-c94372731694','Grihastha','Grihastha','2018-01-01 15:27:58','2018-01-01 15:38:07',NULL,NULL),('f94f80d1-c866-4a9d-9958-21f60962dc87','Sanyasi','Sanyasi','2018-01-01 15:27:58','2018-01-01 15:38:37',NULL,NULL);

delete from devotee;
INSERT INTO `devotee` (`id`,`legal-name`,`circle-id`,`spiritual-name`,`gender`,`shiksha-level`,`credit-limit`,`realm`,`username`,`password`,`email`,`emailVerified`,`verificationToken`,`created-on`,`updated-on`,`created-by`,`updated-by`,`access-id`,`gothra`,`nakshatra`,`government-unique-id`,`income-tax-id`,`lpm-id`,`kc-association-date`,`mother-tongue-language-id`) VALUES ('3db35f39-8f62-4178-8993-fca4959536d7','Rajendra K','f36e9c73-d8f4-4bfd-901d-2d2ac7b8a5e5','Rasaraj Shyamsundar Dasa','1','d2d9ce87-8f1c-4848-a816-443fd92dbc8c',3000.00,'','hairajendra@gmail.com','$2a$10$zFrX6zpTaxdZfn/HfQps3.951gSH83GczrbKJinm7IVDglKwaWvL.','hairajendra@gmail.com',0,'','2018-01-01 15:12:38','2018-01-16 09:51:51','string','string','string','string','string','string','string','string','2018-01-01','e35a1dd6-b497-4c9a-aadf-ccb97af97711');
INSERT INTO `devotee` (`id`,`legal-name`,`circle-id`,`spiritual-name`,`gender`,`shiksha-level`,`credit-limit`,`realm`,`username`,`password`,`email`,`emailVerified`,`verificationToken`,`created-on`,`updated-on`,`created-by`,`updated-by`,`access-id`,`gothra`,`nakshatra`,`government-unique-id`,`income-tax-id`,`lpm-id`,`kc-association-date`,`mother-tongue-language-id`) VALUES ('66424f76-ce14-4cf0-94da-7c23076695f0',NULL,NULL,NULL,NULL,NULL,3000.00,NULL,'it@iskconculturalcentre.com','$2a$10$oj6xqPh5/F05EWob9sqD4.0TtJnozMEQOqFP1loKxvPWIYYpmzmP.',NULL,NULL,NULL,'2018-01-20 04:56:57','2018-01-20 04:56:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'e35a1dd6-b497-4c9a-aadf-ccb97af97711');

delete from `donation-type-master`;
INSERT INTO `donation-type-master` VALUES ('04efbd28-3a50-45bd-ad8f-c4824506c434','Anna Dhaan Dhaan','2018-01-01 15:28:05','2018-01-02 03:04:43','string','string'),('5a044cc5-b21a-4175-bdd2-119484d126e1','Nithya Seva','2018-01-01 15:28:05','2018-01-02 03:02:53','string','string'),('a1da6211-8046-46d8-a106-05a3b595858c','Shaastra Dhaan','2018-01-01 15:28:05','2018-01-02 03:04:34','string','string'),('ba0b76d1-b4cc-4a2f-ae45-76a2f3e1cd9d','Adhoc','2018-01-01 15:28:05','2018-01-02 03:05:21','string','string'),('dee23c71-a461-4530-8845-4b22793da10d','Festival','2018-01-01 15:28:05','2018-01-02 03:03:47','string','string');

delete from `electronic-address-type-master`;
INSERT INTO `electronic-address-type-master` VALUES ('1e7f6949-148e-4806-be05-8575347b6916','Fax','2018-01-01 15:43:26','2018-01-01 15:43:26','string','string'),('8a0ea8d4-cbc2-4c94-a371-ffc3cb653d78','Email','2018-01-01 15:42:12','2018-01-01 15:42:12','string','string'),('8b936cc8-76f4-46e8-a82d-74429514302e','MobilePhone','2018-01-01 15:43:19','2018-01-01 15:43:19','string','string'),('f030ca89-a947-4d62-b4f7-8bf2fbd2e424','LandPhone','2018-01-01 15:43:14','2018-01-01 15:43:14','string','string');

delete from `festival-master`;
INSERT INTO `festival-master` VALUES ('2728ba73-bd72-4e3c-8ff2-beafaae1ca31','Nithyananda Tryodasi','2018-01-01 15:28:07','2018-01-01 15:45:10',NULL,NULL),('a2b5b701-c4cd-45be-83d2-91d1a8281bfd','Sunday Feast','2018-01-01 15:28:07','2018-01-01 15:45:32',NULL,NULL),('bb7d54d7-4c69-45b9-9671-24283c4b1b8b','Goverdhana Puja','2018-01-01 15:28:07','2018-01-01 15:45:20',NULL,NULL),('cd2af549-1f9f-4890-a957-fab0157e423b','Vaikunta Ekadashi','2018-01-01 15:28:07','2018-01-01 15:44:43',NULL,NULL),('da5c0085-2f5f-4841-bd90-4bef1625f67b','Gaura Purnima','2018-01-01 15:28:07','2018-01-01 15:44:57',NULL,NULL),('ec585a83-f316-42af-a7a3-bf4c89667e21','Sri Krishna Janmashtami','2018-01-01 15:28:07','2018-01-01 15:44:32',NULL,NULL);

delete from `language`;
INSERT INTO `language` VALUES ('02720062-0c75-432d-9e3b-4bdba7f38288','Bengali','2018-01-01 15:12:47','2018-01-01 15:16:03',NULL,NULL),('10abc1ea-2007-4ca7-9276-7febc13be081','Hindi','2018-01-01 15:12:47','2018-01-01 15:15:23',NULL,NULL),('42104447-0438-4d56-9f7d-fc7ee2179cd2','Gujarati','2018-01-01 15:12:47','2018-01-01 15:16:22',NULL,NULL),('5ad543b6-13cd-4dae-8df0-de14dbcf6dfb','Tamil','2018-01-01 15:12:47','2018-01-01 15:15:53',NULL,NULL),('ad495540-b63e-40bf-b3a7-cd38d8d1d193','Oriya','2018-01-01 15:12:47','2018-01-01 15:16:15',NULL,NULL),('bc21c48b-e614-4fc5-9cb2-4b383393370d','Malayalam','2018-01-01 15:12:47','2018-01-01 15:15:59',NULL,NULL),('db71d694-a432-47c3-bad5-80992b0ebb01','Kannada','2018-01-01 15:12:47','2018-01-01 15:15:36',NULL,NULL),('e35a1dd6-b497-4c9a-aadf-ccb97af97711','Telugu','2018-01-01 15:12:47','2018-01-01 15:15:48',NULL,NULL),('fe9c9d81-e016-4281-b768-49f41ee44852','English','2018-01-01 15:12:47','2018-01-01 15:15:31',NULL,NULL);

delete from `payment-mode-master`;
INSERT INTO `payment-mode-master` VALUES ('29cb0653-ed47-4dbc-9992-ba31753a07f6','Cash','Cash','2018-01-01 15:28:16','2018-01-02 03:11:25',NULL,NULL),('7cd1afef-beac-4813-a55d-d6d6f6b66c09','Coupon','Coupon','2018-01-01 15:28:16','2018-01-02 03:12:01',NULL,NULL),('e2136d35-c075-4490-8da6-b1c44d254e6d','Cheque','Cheque','2018-01-01 15:28:16','2018-01-02 03:11:12',NULL,NULL),('f0946428-4d2a-4f06-b590-5d96f8a77d66','Card','Card','2018-01-01 15:28:16','2018-01-02 03:11:46',NULL,NULL);

delete from `physical-address-type-master`;
INSERT INTO `physical-address-type-master` VALUES ('3ee0efce-5ce3-4bd4-95a1-cd5a91b03d58','Office Address','2018-01-01 15:28:17','2018-01-02 03:14:03','string','string'),('4aaa671d-04de-4a4b-83f9-44685145249c','Permanent Address','2018-01-01 15:28:17','2018-01-02 03:13:49','string','string'),('af635b05-bf47-4d89-8edf-1f5515722c27','Residential Address - Current','2018-01-01 15:28:17','2018-01-02 03:13:57','string','string');

delete from `relationship-master`;
INSERT INTO `relationship-master` VALUES ('2041234b-6764-4186-9112-c6262c336ce0','Grand Daughter','2018-01-01 15:28:18','2018-01-02 02:53:55','Seed','Seed'),('547f6cd7-0494-453d-af77-5f02edcc453a','Grand Son','2018-01-01 15:28:18','2018-01-02 02:53:51','Seed','Seed'),('5f90180b-326f-4411-9c6e-48372b2b3236','Daughter','2018-01-01 15:28:18','2018-01-02 02:51:48','Seed','Seed'),('6cbb55af-4bf0-4bd3-abc5-75a34aec9cc8','Father','2018-01-01 15:28:18','2018-01-02 02:50:19','Seed','Seed'),('6e3f6999-a7b2-458c-b2e1-e08176deb4f1','Grand Mother','2018-01-01 15:28:18','2018-01-02 02:51:37','Seed','Seed'),('8bfa9af1-7f05-489f-9976-ea7ae499fc18','Brother','2018-01-01 15:28:18','2018-01-02 02:51:53','Seed','Seed'),('8d9d1d96-b1ff-428e-8e13-42e691b14e49','Grand Father','2018-01-01 15:28:18','2018-01-02 02:51:33','Seed','Seed'),('ad9d1b47-53de-4904-9bbd-a6837ed05d59','Sister','2018-01-01 15:28:18','2018-01-02 02:51:59','Seed','Seed'),('b8e02c55-cf93-4b63-a795-a3cafe6a9f12','Mother','2018-01-01 15:28:18','2018-01-02 02:51:25','Seed','Seed'),('e55dd46c-2b80-4a14-a847-284237e681fe','Son','2018-01-01 15:28:18','2018-01-02 02:51:44','Seed','Seed');

delete from `spiritual-level-master`;
INSERT INTO `spiritual-level-master` VALUES ('394296e2-4db2-48f0-8c76-c5b17885837b','0','Guru Ashraya','2017-11-10 16:27:08','2017-11-10 16:27:08',NULL,NULL),('5f61bb4f-1a9d-4a72-8144-85d3fd3d6bd3','-1','Aspiring','2017-11-10 16:26:54','2017-11-10 16:26:54',NULL,NULL),('8ab6fd72-81c6-4da9-9be1-2c7b4a888542','-2','Curious','2017-11-10 16:26:43','2017-11-10 16:26:43',NULL,NULL),('913fd405-752b-4779-9ea7-80a29ce83398','2','Second Initiated','2017-11-10 16:27:27','2017-11-10 16:27:27',NULL,NULL),('d2d9ce87-8f1c-4848-a816-443fd92dbc8c','1','First Initiated','2017-11-10 16:27:20','2017-11-10 16:27:20',NULL,NULL);

delete from `temple`;
INSERT INTO `temple` VALUES ('4ee2d7f5-9f3b-4add-986a-7f1d5658509a','ISKCON Cultural Centre','string','SundarRupa Shyam Dasa','2018-01-01 15:28:20','2018-01-02 03:41:57','string','string',NULL);

delete from `service-role`;
INSERT INTO `service-role` (`id`,`name`,`description`,`created`,`modified`,`created-on`,`updated-on`,`created-by`,`updated-by`) VALUES ('f5425e4c-d715-4ba2-b3f0-cee4932c6581','admin','IT Administrator',NULL,NULL,'2018-01-17 10:21:47','2018-01-17 10:21:47',NULL,NULL);

`service-role-mapping`;
INSERT INTO `service-role-mapping` (`id`,`principal-type`,`principal-id`,`role-id`,`created-on`,`updated-on`,`created-by`,`updated-by`) VALUES ('21f377ba-2a38-4996-a191-88f782cfc401','USER','3db35f39-8f62-4178-8993-fca4959536d7','f5425e4c-d715-4ba2-b3f0-cee4932c6581','2018-01-19 03:01:05','2018-01-19 03:04:27',NULL,NULL);

delete from `department`;
INSERT INTO `department` (`id`,`temple-id`,`department-name`,`department-leader-devotee-id`,`created-on`,`updated-on`,`created-by`,`updated-by`) VALUES ('86157f6d-36af-452a-88af-baa360aee2c1','4ee2d7f5-9f3b-4add-986a-7f1d5658509a','IT','3db35f39-8f62-4178-8993-fca4959536d7','2018-01-22 10:53:08','2018-01-22 10:53:08',NULL,NULL);
git
INSERT INTO  (`department-id`,`role-id`,`created-on`,`updated-on`,`created-by`,`updated-by`) VALUES ('86157f6d-36af-452a-88af-baa360aee2c1','480812ee-ac47-4062-8413-f349e3407efb','2018-01-22 11:02:03','2018-01-22 11:04:01',NULL,NULL);
INSERT INTO `department-role` (`department-id`,`role-id`,`created-on`,`updated-on`,`created-by`,`updated-by`) VALUES ('86157f6d-36af-452a-88af-baa360aee2c1','744133eb-d4e4-443c-bd8c-de2a3481c6c0','2018-01-22 11:02:03','2018-01-22 11:03:16',NULL,NULL);


SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;