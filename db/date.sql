insert into users(UName,UtrueName,UPassword,hufId) values('admin','admin','a',1);

insert into role(RName,RDesc,RFlag) values('管理员','管理员',1);

insert into hrRight values('L01','-1','Folder','客户化设置','','进行基本数据的录入');
insert into hrRight values('L0101','L01','Folder','人力资源档案管理设置','','人力资源档案管理数据录入');
insert into hrRight values('L010101','L0101','Document','一级机构设置','getconfigfilefirstkinds','一级机构数据录入');
insert into hrRight values('L010102','L0101','Document','二级机构设置','configfilesecondkind.do?operate=list&pageNow=1','二级机构数据录入');
insert into hrRight values('L010103','L0101','Document','三级机构设置','configfilethirdkind.do?operate=list&pageNow=1','三级机构数据录入');
insert into hrRight values('L010104','L0101','Document','职称设置','configprofessiondesign.do?operate=list&pageNow=1','职称数据录入');
insert into hrRight values('L010105','L0101','Document','职位分类设置','configmajorkind.do?operate=list&pageNow=1','职位分类数据录入');
insert into hrRight values('L010106','L0101','Document','职位设置','configmajor.do?operate=list&pageNow=1','职位数据录入');
insert into hrRight values('L010107','L0101','Document','公共属性设置','configpublicchar.do?operate=list&pageNow=1','公共属性数据录入');
insert into hrRight values('L0102','L01','Folder','薪酬管理设置','','薪酬管理数据录入');
insert into hrRight values('L010201','L0102','Document','薪酬项目设置','configsalarydesign.do?operate=list','薪酬项目数据录入');
insert into hrRight values('L010202','L0102','Document','薪酬发放方式设置','configsalarygrantmode.do?operate=toAdd','薪酬发放方式数据录入');
insert into hrRight values('L0103','L01','Folder','题库管理设置','','题库管理数据录入');
insert into hrRight values('L010301','L0103','Document','试题一级分类设置','configquestionfirstkind.do?operate=list&pageNow=1','试题一级分类数据录入');
insert into hrRight values('L010302','L0103','Document','试题二级分类设置','configquestionsecondkind.do?operate=list&pageNow=1','试题二级分类数据录入');
insert into hrRight values('L0104','L01','Folder','其他设置','','其他数据录入');
insert into hrRight values('L010401','L0104','Document','关键字查询设置','configprimarykey.do?operate=locate','关键字查询数据录入');
insert into hrRight values('L02','-1','Folder','人力资源管理设置','','人力资源管理录入');
insert into hrRight values('L0201','L02','Document','人力资源档案登记','humanfile.do?operate=toAdd','人力资源档案登记');
insert into hrRight values('L0202','L02','Document','人力资源档案登记复核','humanfile.do?operate=list&pageNow=1','人力资源档案登记复核');
insert into hrRight values('L0203','L02','Document','人力资源档案查询','humanfile.do?operate=toLocate&method=query','人力资源档案查询');
insert into hrRight values('L0204','L02','Document','人力资源档案变更','humanfile.do?operate=toLocate&method=change','人力资源档案变更');
insert into hrRight values('L0205','L02','Folder','人力资源档案删除管理','','人力资源档案删除管理');
insert into hrRight values('L020501','L0205','Document','人力资源档案删除','humanfile.do?operate=toLocate&method=delete','人力资源档案删除数据记载');
insert into hrRight values('L020502','L0205','Document','档案删除恢复','humanfile.do?operate=toLocate&method=recovery','人力资源档案删除恢复数据记载');
insert into hrRight values('L020503','L0205','Document','人力资源档案永久删除','humanfile.do?operate=list&method=delforever&pageNow=1','人力资源档案永久删除记载');
insert into hrRight values('L03','-1','Folder','薪酬标准管理','','薪酬标准管理录入');
insert into hrRight values('L0301','L03','Document','薪酬标准登记','salarystandard.do?operate=toAdd','薪酬标准登记录入');
insert into hrRight values('L0302','L03','Document','薪酬标准登记复核','salarystandard.do?operate=toCheck&status=0&method=check','薪酬标准登记复核录入');
insert into hrRight values('L0303','L03','Document','薪酬标准查询','salarystandard.do?operate=toLocate&method=query','薪酬标准查询录入');
insert into hrRight values('L0304','L03','Document','薪酬标准变更','salarystandard.do?operate=toChangeLocate','薪酬标准变更录入');
insert into hrRight values('L04','-1','Folder','薪酬发放管理','','薪酬发放管理录入');
insert into hrRight values('L0401','L04','Document','薪酬发放登记','salarygrant.do?operate=locate','薪酬发放登记录入');
insert into hrRight values('L0402','L04','Document','薪酬发放登记复核','salarygrant.do?operate=tocheck','薪酬发放登记复核录入');
insert into hrRight values('L0403','L04','Document','薪酬发放查询','salarygrant.do?operate=toquerylocate','薪酬发放查询');
insert into hrRight values('L05','-1','Folder','调动管理','','调动管理录入');
insert into hrRight values('L0501','L05','Document','调动登记','majorchange.do?operate=query','调动登记录入');
insert into hrRight values('L0502','L05','Document','调动审核','majorchange.do?operate=check&pageNow=1','调动审核录入');
insert into hrRight values('L0503','L05','Document','调动查询','majorchange.do?operate=queryAll&pageNow=1','调动查询录入');
insert into hrRight values('L06','-1','Folder','培训管理','','培训管理录入');
insert into hrRight values('L0601','L06','Document','培训登记','training.do?operate=list&pageNow=1','培训登记录入');
insert into hrRight values('L0602','L06','Document','培训登记复核','training.do?operate=check&pageNow=1','培训登记复核录入');
insert into hrRight values('L0603','L06','Document','培训查询','training.do?operate=queryAll&pageNow=1','培训查询录入');
insert into hrRight values('L07','-1','Folder','激励管理','','激励管理录入');
insert into hrRight values('L0701','L07','Document','激励登记','bonus.do?operate=query','激励登记录入');
insert into hrRight values('L0702','L07','Document','激励登记复核','bonus.do?operate=check&pageNow=1','激励登记复核录入');
insert into hrRight values('L0703','L07','Document','激励查询','bonus.do?operate=queryAll&pageNow=1','激励查询录入');
insert into hrRight values('L08','-1','Folder','招聘管理','','招聘管理录入');
insert into hrRight values('L0801','L08','Folder','职位发布管理','','职位发布管理录入');
insert into hrRight values('L080101','L0801','Document','职位发布登记','engagemajorrelease.do?operate=toAdd','职位发布登记录入');
insert into hrRight values('L080102','L0801','Document','职位发布变更','engagemajorrelease.do?operate=doEdits&pageNow=1','职位发布变更录入');
insert into hrRight values('L0802','L08','Folder','简历管理','','简历管理录入');
insert into hrRight values('L080202','L0802','Document','简历筛选','engageresume.do?operate=locate&method=check','简历筛选录入');
insert into hrRight values('L080203','L0802','Document','有效简历查询','engageresume.do?operate=locate&method=query','有效简历查询录入');
insert into hrRight values('L0803','L08','Folder','面试管理','','面试管理录入');
insert into hrRight values('L080301','L0803','Document','面试结果登记','engageresume.do?operate=locate&method=interview','面试结果登记录入');
insert into hrRight values('L080302','L0803','Document','面试筛选','engageinterview.do?operate=list&pageNow=1','面试筛选录入');
insert into hrRight values('L0804','L08','Folder','招聘考试题库管理','','招聘考试题库管理录入');
insert into hrRight values('L080401','L0804','Document','试题登记','engagesubjects.do?operate=toAdd','试题登记录入');
insert into hrRight values('L080402','L0804','Document','试题查询','engagesubjects.do?operate=locate&param=query','试题查询录入');
insert into hrRight values('L0805','L08','Folder','招聘考试管理','','招聘考试管理录入');
insert into hrRight values('L080501','L0805','Document','考试出题','engageExam.do?operate=toRegisterList&pageNow=1','考试出题录入');
insert into hrRight values('L080502','L0805','Document','考试阅卷','engageAnswer.do?operate=toReadLocate','考试阅卷录入');
insert into hrRight values('L080503','L0805','Document','成绩查询筛选','engageAnswer.do?operate=toFilter','成绩查询筛选录入');
insert into hrRight values('L0806','L08','Folder','录用管理','','录用管理录入');
insert into hrRight values('L080601','L0806','Document','录用申请','engageresume.do?operate=passList&method=register&passStatus=0&pageNow=1','录用申请录入');
insert into hrRight values('L080602','L0806','Document','录用审批','engageresume.do?operate=passList&method=check&passStatus=1&pageNow=1','录用审批录入');
insert into hrRight values('L080603','L0806','Document','录用查询','engageresume.do?operate=passList&method=query&passStatus=2&pageNow=1','录用查询录入');
insert into hrRight values('L09','-1','Folder','标准数据报表','','标准数据报表录入');
insert into hrRight values('L0901','L09','Document','EXCEL标准数据报表','exportfile.do?operate=toExport&method=excel','EXCEL标准数据报表录入');
insert into hrRight values('L0902','L09','Document','pdf标准数据报表','exportfile.do?operate=toExport&method=pdf','pdf标准数据报表录入');
insert into hrRight values('L010','-1','Folder','权限管理','','权限管理录入');
insert into hrRight values('L01001','L010','Document','权限管理','right.do?operate=toRight&pageNow=1','权限管理录入');
insert into hrRight values('L01002','L010','Document','用户管理','right.do?operate=toUser','用户管理录入');
insert into hrRight values('L01003','L010','Document','角色管理','right.do?operate=toRole','角色管理录入');

insert into hrRoleRight values(1,'L01');  
insert into hrRoleRight values(1,'L0101');  
insert into hrRoleRight values(1,'L010101');
insert into hrRoleRight values(1,'L010102');
insert into hrRoleRight values(1,'L010103');
insert into hrRoleRight values(1,'L010104');
insert into hrRoleRight values(1,'L010105');
insert into hrRoleRight values(1,'L010106');
insert into hrRoleRight values(1,'L010107');
insert into hrRoleRight values(1,'L0102');
insert into hrRoleRight values(1,'L010201');
insert into hrRoleRight values(1,'L010202');
insert into hrRoleRight values(1,'L0103');
insert into hrRoleRight values(1,'L010301');
insert into hrRoleRight values(1,'L010302');
insert into hrRoleRight values(1,'L0104');
insert into hrRoleRight values(1,'L010401');
insert into hrRoleRight values(1,'L02');
insert into hrRoleRight values(1,'L0201');
insert into hrRoleRight values(1,'L0202');
insert into hrRoleRight values(1,'L0203');
insert into hrRoleRight values(1,'L0204');
insert into hrRoleRight values(1,'L0205');
insert into hrRoleRight values(1,'L020501');
insert into hrRoleRight values(1,'L020502');
insert into hrRoleRight values(1,'L020503');
insert into hrRoleRight values(1,'L03');
insert into hrRoleRight values(1,'L0301');
insert into hrRoleRight values(1,'L0302');
insert into hrRoleRight values(1,'L0303');
insert into hrRoleRight values(1,'L0304');
insert into hrRoleRight values(1,'L04');
insert into hrRoleRight values(1,'L0401');
insert into hrRoleRight values(1,'L0402');
insert into hrRoleRight values(1,'L0403');
insert into hrRoleRight values(1,'L05');
insert into hrRoleRight values(1,'L0501');
insert into hrRoleRight values(1,'L0502');
insert into hrRoleRight values(1,'L0503');
insert into hrRoleRight values(1,'L06');
insert into hrRoleRight values(1,'L0601');
insert into hrRoleRight values(1,'L0602');
insert into hrRoleRight values(1,'L0603');
insert into hrRoleRight values(1,'L07');
insert into hrRoleRight values(1,'L0701');
insert into hrRoleRight values(1,'L0702');
insert into hrRoleRight values(1,'L0703');
insert into hrRoleRight values(1,'L08');
insert into hrRoleRight values(1,'L0801');
insert into hrRoleRight values(1,'L080101');
insert into hrRoleRight values(1,'L080102');
insert into hrRoleRight values(1,'L0802');
insert into hrRoleRight values(1,'L080202');
insert into hrRoleRight values(1,'L080203');
insert into hrRoleRight values(1,'L0803');
insert into hrRoleRight values(1,'L080301');
insert into hrRoleRight values(1,'L080302');
insert into hrRoleRight values(1,'L0804');
insert into hrRoleRight values(1,'L080401');
insert into hrRoleRight values(1,'L080402');
insert into hrRoleRight values(1,'L0805');
insert into hrRoleRight values(1,'L080501');
insert into hrRoleRight values(1,'L080502');
insert into hrRoleRight values(1,'L080503');
insert into hrRoleRight values(1,'L0806');
insert into hrRoleRight values(1,'L080601');
insert into hrRoleRight values(1,'L080602');
insert into hrRoleRight values(1,'L080603');
insert into hrRoleRight values(1,'L09');
insert into hrRoleRight values(1,'L0901');
insert into hrRoleRight values(1,'L0902');
insert into hrRoleRight values(1,'L010');
insert into hrRoleRighto values(1,'L01001');
insert into hrRoleRight values(1,'L01002');
insert into hrRoleRight values(1,'L01003');

insert into HrUserRole values(1,1);

insert into config_file_first_kind(first_kind_id,first_kind_name,first_kind_salary_id,first_kind_sale_id) values('01','集团','1','1');

insert into config_file_second_kind(first_kind_id,first_kind_name,second_kind_id,second_kind_name,second_salary_id,second_sale_id) values('01','集团','01','软件公司','1','1');
insert into config_file_second_kind(first_kind_id,first_kind_name,second_kind_id,second_kind_name,second_salary_id,second_sale_id) values('01','集团','02','生物科技有限公司','1','1');

insert into config_file_third_kind(first_kind_id,first_kind_name,second_kind_id,second_kind_name,third_kind_id,third_kind_name,third_kind_sale_id,third_kind_is_retail) values('01','集团','01','软件公司','01','外包组','1','否');
insert into config_file_third_kind(first_kind_id,first_kind_name,second_kind_id,second_kind_name,third_kind_id,third_kind_name,third_kind_sale_id,third_kind_is_retail) values('01','集团','02','生物科技有限公司','01','药店','1','是');

insert into config_question_first_kind(first_kind_id,first_kind_name) values('01','基础类');
insert into config_question_first_kind(first_kind_id,first_kind_name) values('02','技术类');

insert into config_question_second_kind(first_kind_id,first_kind_name,second_kind_id,second_kind_name) values('01','基础类','01','语言类');
insert into config_question_second_kind(first_kind_id,first_kind_name,second_kind_id,second_kind_name) values('01','基础类','02','管理类');
insert into config_question_second_kind(first_kind_id,first_kind_name,second_kind_id,second_kind_name) values('02','技术类','01','软件开发类');
insert into config_question_second_kind(first_kind_id,first_kind_name,second_kind_id,second_kind_name) values('02','技术类','02','生物制药类');

insert into config_public_char(attribute_kind,attribute_name) values('薪酬发放方式','一级机构发放方式');
insert into config_public_char(attribute_kind,attribute_name) values('国籍','中国');
insert into config_public_char(attribute_kind,attribute_name) values('国籍','美国');
insert into config_public_char(attribute_kind,attribute_name) values('民族','汉族');
insert into config_public_char(attribute_kind,attribute_name) values('民族','回族');
insert into config_public_char(attribute_kind,attribute_name) values('宗教信仰','无');
insert into config_public_char(attribute_kind,attribute_name) values('宗教信仰','佛教');
insert into config_public_char(attribute_kind,attribute_name) values('政治面貌','党员');
insert into config_public_char(attribute_kind,attribute_name) values('政治面貌','群众');
insert into config_public_char(attribute_kind,attribute_name) values('教育年限','12');
insert into config_public_char(attribute_kind,attribute_name) values('教育年限','16');
insert into config_public_char(attribute_kind,attribute_name) values('学历','本科');
insert into config_public_char(attribute_kind,attribute_name) values('学历','大专');
insert into config_public_char(attribute_kind,attribute_name) values('专业','生物工程');
insert into config_public_char(attribute_kind,attribute_name) values('专业','计算机');
insert into config_public_char(attribute_kind,attribute_name) values('特长','数据库');
insert into config_public_char(attribute_kind,attribute_name) values('特长','java');
insert into config_public_char(attribute_kind,attribute_name) values('爱好','篮球');
insert into config_public_char(attribute_kind,attribute_name) values('爱好','舞蹈');
insert into config_public_char(attribute_kind,attribute_name) values('培训项目','英语');
insert into config_public_char(attribute_kind,attribute_name) values('培训项目','管理');
insert into config_public_char(attribute_kind,attribute_name) values('培训成绩','A');
insert into config_public_char(attribute_kind,attribute_name) values('培训成绩','B');
insert into config_public_char(attribute_kind,attribute_name) values('奖励项目','技术攻关');
insert into config_public_char(attribute_kind,attribute_name) values('奖励项目','销售绩效');
insert into config_public_char(attribute_kind,attribute_name) values('奖励等级','A');
insert into config_public_char(attribute_kind,attribute_name) values('奖励等级','B');
insert into config_public_char(attribute_kind,attribute_name) values('职称','工程师');
insert into config_public_char(attribute_kind,attribute_name) values('职称','经理');
insert into config_public_char(attribute_kind,attribute_name) values('职称','助理');
insert into config_public_char(attribute_kind,attribute_name) values('职称','教授');
insert into config_public_char(attribute_kind,attribute_name) values('职称','讲师');
insert into config_public_char(attribute_kind,attribute_name) values('职称','技术支持');
insert into config_public_char(attribute_kind,attribute_name) values('薪酬设置','出差补助');
insert into config_public_char(attribute_kind,attribute_name) values('薪酬设置','交通补贴');
insert into config_public_char(attribute_kind,attribute_name) values('薪酬设置','住房补贴');
insert into config_public_char(attribute_kind,attribute_name) values('薪酬设置','基本工资');
insert into config_public_char(attribute_kind,attribute_name) values('薪酬设置','年终奖');
insert into config_public_char(attribute_kind,attribute_name) values('薪酬设置','误餐补助');

insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','first_kind_name','I机机构名称',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','second_kind_name','II机机构名称',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','third_kind_name','III机机构名称',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_id','档案编号',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_name','姓名',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_address','住址',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_postcode','邮编',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_pro_designation','职称',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_major_kind_name','职位分类名称',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_major_name','职位名称',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_bank','开户银行',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_account','银行帐号',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_telephone','电话',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_mobilephone','手机号码',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_email','E-mail',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_hobby','爱好',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_speciality','特长',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_sex','性别',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_religion','宗教信仰',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_party','政治面貌',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_nationality','国籍',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_race','民族',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_birthday','生日',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_birthplace','出生地',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_age','年龄',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_educated_degree','学历',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_educated_years','教育年限',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_educated_major','专业',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_society_security_id','社会保障号码',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_id_card','身份证号码',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','salary_standard_id','薪酬标准编号',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','salary_standard_name','薪酬标准',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','major_change_amount','调动次数',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','bonus_amount','激励次数',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','training_amount','培训次数',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','file_chang_amount','档案变更次数',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','remark','备注',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_histroy_records','简历',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','human_family_membership','家庭关系',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('human_file','register','登记人',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('salary_standard','standard_id','薪酬标准编号',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('salary_standard','standard_name','薪酬标准名称',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('salary_standard','designer','设计人',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('salary_grant','register','登记人',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('salary_grant','checker','复核人',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('salary_grant','salary_grant_id','薪酬发放编号',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('salary_grant','salary_standard_sum','标准薪酬总金额',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('salary_grant','salary_paid_sum','实发总金额',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('salary_grant','human_amount','总人数',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('bonus','major_kind_name','职位分类名称',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('bonus','major_name','职位名称',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('bonus','human_id','员工编号',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('bonus','human_name','职员工姓名',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('bonus','bonus_item','激励项目',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('bonus','bonus_degree','激励等级',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('bonus','remark','备注',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('training','major_kind_name','职位分类名称',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('training','major_name','职位名称',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('training','human_id','员工编号',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('training','human_name','职员工姓名',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('training','training_item','培训项目',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('training','training_degree','培训等级',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('training','remark','备注',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('major_change','first_kind_name','I机机构',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('major_change','second_kind_name','II机机构',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('major_change','third_kind_name','III机机构',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('major_change','major_kind_name','职位分类',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('major_change','major_name','职位',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('major_change','human_id','员工编号',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('major_change','human_name','员工姓名',1);
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('major_change','change_reason','调动原因',1);

insert into config_major_kind(major_kind_id,major_kind_name) values('01','销售');
insert into config_major_kind(major_kind_id,major_kind_name) values('02','软件开发');
insert into config_major_kind(major_kind_id,major_kind_name) values('03','人力资源');
insert into config_major_kind(major_kind_id,major_kind_name) values('04','生产部');

insert into config_major(major_kind_id,major_kind_name,major_id,major_name,test_amount) values('01','销售','01','区域经理',0);
insert into config_major(major_kind_id,major_kind_name,major_id,major_name,test_amount) values('01','销售','02','总经理',0);
insert into config_major(major_kind_id,major_kind_name,major_id,major_name,test_amount) values('02','软件开发','01','项目经理',0);
insert into config_major(major_kind_id,major_kind_name,major_id,major_name,test_amount) values('02','软件开发','02','程序员',0);
insert into config_major(major_kind_id,major_kind_name,major_id,major_name,test_amount) values('03','人力资源','01','人事经理',0);
insert into config_major(major_kind_id,major_kind_name,major_id,major_name,test_amount) values('03','人力资源','02','专员',0);
insert into config_major(major_kind_id,major_kind_name,major_id,major_name,test_amount) values('04','生产部','01','主任',0);
insert into config_major(major_kind_id,major_kind_name,major_id,major_name,test_amount) values('04','生产部','02','技术工人',0);

insert into human_file(human_id,first_kind_id,first_kind_name,second_kind_id,second_kind_name,third_kind_id,third_kind_name,human_name,human_address,human_postcode,human_pro_designation,human_major_kind_id,human_major_kind_name,human_major_id,human_major_name,
human_telephone,human_mobilephone,human_bank,human_account,human_qq,human_email,human_hobby,human_speciality,human_sex,human_religion,human_party,human_nationality,human_race,human_birthday,human_birthplace,human_age,human_educated_degree,human_educated_years,
human_educated_major,human_society_security_id,human_id_card,remark,salary_standard_id,salary_standard_name,salary_sum,demand_salaray_sum,paid_salary_sum,major_change_amount,bonus_amount,training_amount,file_chang_amount,human_histroy_records,human_family_membership,
human_picture,attachment_name,check_status,register,checker,changer,regist_time,human_file_status) 
values('1','01','源辰集团','01','源辰软件公司','01','外包组','fantia','湖南衡阳','100091','经理','02','软件开发','01','项目经理',
'','13699175041','建设银行','123456879586584','26284795','26284795@qq.com','舞蹈','java','女','无','党员','中国','汉族','1983-07-01','长沙',24,'本科','16','生物工程','','140105198307010065',
'','','',0.00,0.00,0.00,0,0,0,0,'','','','',0,'admin','','','2017-05-31',1);

insert into salary_standard_details(standard_id,standard_name,item_id,item_name,salary)
values('SB100101','高级软件工程师',1,'出差补助',300);
insert into salary_standard_details(standard_id,standard_name,item_id,item_name,salary)
values('SB100101','高级软件工程师',2,'交通补贴',300);
insert into salary_standard_details(standard_id,standard_name,item_id,item_name,salary)
values('SB100101','高级软件工程师',3,'住房补贴',300);
insert into salary_standard_details(standard_id,standard_name,item_id,item_name,salary)
values('SB100101','高级软件工程师',4,'基本工资',5000);
insert into salary_standard_details(standard_id,standard_name,item_id,item_name,salary)
values('SB100101','高级软件工程师',5,'年终奖',300);
insert into salary_standard_details(standard_id,standard_name,item_id,item_name,salary)
values('SB100101','高级软件工程师',6,'误餐补助',300);

insert into salary_standard_details(standard_id,standard_name,item_id,item_name,salary)
values('SB100102','人事部长',1,'出差补助',300);
insert into salary_standard_details(standard_id,standard_name,item_id,item_name,salary)
values('SB100102','人事部长',2,'交通补贴',300);
insert into salary_standard_details(standard_id,standard_name,item_id,item_name,salary)
values('SB100102','人事部长',3,'住房补贴',300);
insert into salary_standard_details(standard_id,standard_name,item_id,item_name,salary)
values('SB100102','人事部长',4,'基本工资',5000);
insert into salary_standard_details(standard_id,standard_name,item_id,item_name,salary)
values('SB100102','人事部长',5,'年终奖',300);
insert into salary_standard_details(standard_id,standard_name,item_id,item_name,salary)
values('SB100102','人事部长',6,'误餐补助',350);

