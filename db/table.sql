/* 创建新表 "users"。                                                                               */
/* "user" : 用户表                                                                               */
/* 	"user_id" : 主键，自动增长列                                                                      */
/* 	"user_name" : 用户名                                                                         */
/* 	"user_true_name" : 真实姓名                                                                   */
/* 	"user_password" : 密码                                                                      */  
create table users ( 
	UId int primary key auto_increment, 
	UName varchar(60) , 
	UTrueName varchar(60)  , 
	UPassword varchar(60),   
	hufId int  
) 

--角色ID
--角色名字
--角色描述
--角色状态

create table role( 
	RId int primary key auto_increment,
	RName varchar(60) ,
	RDesc varchar(200) ,
	RFlag int 
) 

create table hrRight( 
	 rightCode varchar(60) not null,
	 rightParentCode varchar(60) ,
	rightType varchar(60)  ,
	rightText varchar(200)  ,
	rightUrl varchar(100)  ,
	rightTip varchar(200)  
) 

create table HrRoleRight(
	RId int ,
	rightCode varchar(60)
)

create table HrUserRole(
	UId int ,
	RId int
)

/* 创建新表 "config_file_first_kind"。                                                             */
/* "config_file_first_kind" : 一级机构设置                                                          */
/* 	"ffk_id" : 主键，自动增长列                                                                       */
/* 	"first_kind_id" : 一级机构编号                                                                  */
/* 	"first_kind_name" : 一级机构名称                                                                */
/* 	"first_kind_salary_id" : 一级机构薪酬发放责任人编号                                                    */
/* 	"first_kind_sale_id" : 一级机构销售责任人编号                                                        */  
create table config_file_first_kind ( 
	ffk_id int  primary key auto_increment,
	first_kind_id char(2),
	first_kind_name varchar(60) ,
	first_kind_salary_id varchar(100) ,
	first_kind_sale_id varchar(100) 
) 

/* 创建新表 "config_file_second_kind"。                                                            */
/* "config_file_second_kind" : 二级机构设置                                                         */
/* 	"fsk_id" : 主键，自动增长列                                                                       */
/* 	"first_kind_id" : 一级机构编号                                                                  */
/* 	"first_kind_name" : 一级机构名称                                                                */
/* 	"second_kind_id" : 二级机构编号                                                                 */
/* 	"second_kind_name" : 二级机构名称                                                               */
/* 	"second_salary_id" : 二级机构薪酬发放责任人编号                                                        */
/* 	"second_sale_id" : 二级机构销售责任人编号                                                            */  
create table config_file_second_kind ( 
	fsk_id int primary key auto_increment,
	first_kind_id char(2),
	first_kind_name varchar(60),
	second_kind_id char(2),
	second_kind_name varchar(60),
	second_salary_id varchar(1000),
	second_sale_id varchar(1000)
)  

/* 创建新表 "config_file_third_kind"。                                                             */
/* "config_file_third_kind" : 三级机构设置                                                          */
/* 	"ftk_id" : 主键，自动增长列                                                                       */
/* 	"first_kind_id" : 一级机构编号                                                                  */
/* 	"first_kind_name" : 一级机构名称                                                                */
/* 	"second_kind_id" : 二级机构编号                                                                 */
/* 	"second_kind_name" : 二级机构名称                                                               */
/* 	"third_kind_id" : 三级机构编号                                                                  */
/* 	"third_kind_name" : 三级机构名称                                                                */
/* 	"third_kind_sale_id" : 三级机构销售责任人编号                                                        */
/* 	"third_kind_is_retail" : 三级机构是否为零售店                                                       */  
create table config_file_third_kind ( 
	ftk_id int primary key auto_increment,
	first_kind_id char(2) ,
	first_kind_name varchar(60) ,
	second_kind_id char(2) ,
	second_kind_name varchar(60) ,
	third_kind_id char(2) ,
	third_kind_name varchar(60) ,
	third_kind_sale_id varchar(1000) ,
	third_kind_is_retail char(2) 
)  


/* 创建新表 "config_question_first_kind"。                                                         */
/* "config_question_first_kind" : 试题一级分类设置                                                    */
/* 	"qfk_id" : 主键，自动增长列                                                                       */
/* 	"first_kind_id" : 试题一级分类编号                                                                */
/* 	"first_kind_name" : 试题一级分类名称                                                              */  
create table config_question_first_kind ( 
	qfk_id int primary key auto_increment,
	first_kind_id char(2) ,
	first_kind_name varchar(60) 
) 

/* 创建新表 "config_question_second_kind"。                                                        */
/* "config_question_second_kind" : 试题二级分类设置                                                   */
/* 	"qsk_id" : 主键，自动增长列                                                                       */
/* 	"first_kind_id" : 试题一级分类编号                                                                */
/* 	"first_kind_name" : 试题一级分类名称                                                              */
/* 	"second_kind_id" : 试题二级分类编号                                                               */
/* 	"second_kind_name" : 试题二级分类名称                                                             */  
create table config_question_second_kind ( 
	qsk_id int primary key auto_increment,
	first_kind_id char(2) ,
	first_kind_name varchar(60) ,
	second_kind_id char(2) ,
	second_kind_name varchar(60) 
)  

/* 创建新表 "config_public_char"。                                                                 */
/* "config_public_char" : 公共字段设置，包括薪酬设置，职称设置，国籍，民族，宗教信仰，
							政治面貌，教育年限，学历,专业，特长，爱好，培训项目，培训成绩，奖励项目，奖励等级 */
/* 	"pbc_id" : 主键，自动增长列                                                                       */
/* 	"attribute_kind" : 属性的种类                                                                  */
/* 	"attribute_name" : 属性的名称                                                                  */  
create table config_public_char ( 
	pbc_id int primary key auto_increment,
	attribute_kind varchar(60) ,
	attribute_name varchar(60) 
) 


/* 创建新表 "config_primary_key"。                                                                 */
/* "config_primary_key" : 关键字设置，包括人力资源管理，薪酬发放，激励管理，调动管理，薪酬标准，培训                               */
/* 	"prk_id" : 主键，自动增长列                                                                       */
/* 	"primary_key_table" : 关键字所涉及的数据库表名                                                        */
/* 	"primary_key" : 关键字                                                                  */
/* 	"key_name" : 中文关键字                                                                  */
/* 	"primary_key_status" : 是否为关键字                                                             */  
create table config_primary_key ( 
	prk_id int primary key auto_increment,
	primary_key_table varchar(60),
	primary_key varchar(60),
	key_name varchar(60),
	primary_key_status int
) 

/* 创建新表 "config_major_kind"。                                                                  */
/* "config_major_kind" : 职位分类设置                                                               */
/* 	"mfk_id" : 主键，自动增长列                                                                       */
/* 	"major_kind_id" : 职位分类编号                                                                  */
/* 	"major_kind_name" : 职分类位名称                                                                */  
create table config_major_kind ( 
	mfk_id int primary key auto_increment,
	major_kind_id char(2),
	major_kind_name varchar(60)
)

/* 创建新表 "config_major"。                                                                       */
/* "config_major" : 职位设置                                                                      */
/* 	"mak_id" : 主键，自动增长列                                                                       */
/* 	"major_kind_id" : 职位分类编号                                                                  */
/* 	"major_kind_name" : 职位分类名称                                                                */
/* 	"major_id" : 职位编号                                                                         */
/* 	"major_name" : 职位名称                                                                       */ 
/* 	"test_amount" : 题套数量                                                                      */   
create table config_major ( 
	mak_id int primary key auto_increment,
	major_kind_id char(2),
	major_kind_name varchar(60),
	major_id char(2),
	major_name varchar(60),
	test_amount int
) 


/* 创建新表 "human_file_dig"。                                                                     */
/* "human_file_dig" : 记录人力资源档案所做的任何更改                                                         */
/* 	"hfd_id" : 主键，自动增长列                                                                       */
/* 	"human_id" : 档案编号                                                                         */
/* 	"first_kind_id" : 一级机构编号                                                                  */
/* 	"first_kind_name" : 一级机构名称                                                                */
/* 	"second_kind_id" : 二级机构编号                                                                 */
/* 	"second_kind_name" : 二级机构名称                                                               */
/* 	"third_kind_id" : 三级机构编号                                                                  */
/* 	"third_kind_name" : 三级机构名称                                                                */
/* 	"human_name" : 姓名                                                                         */
/* 	"human_address" : 地址                                                                      */
/* 	"human_postcode" : 邮政编码                                                                   */
/* 	"human_pro_designation" : 职称                                                              */
/* 	"human_major_kind_id" : 职位分类编号                                                            */
/* 	"human_major_kind_name" : 职位分类名称                                                          */
/* 	"human_major_id" : 职位编号                                                                   */
/* 	"hunma_major_name" : 职位名称                                                                 */
/* 	"human_telephone" : 电话                                                                    */
/* 	"human_mobilephone" : 手机号码                                                                */
/* 	"human_bank" : 开户银行                                                                       */
/* 	"human_account" : 银行帐号                                                                    */
/* 	"human_qq" : QQ号码                                                                         */
/* 	"human_email" : 电子邮件                                                                      */
/* 	"human_hobby" : 爱好                                                                        */
/* 	"human_speciality" : 特长                                                                   */
/* 	"human_sex" : 性别                                                                          */
/* 	"human_religion" : 宗教信仰                                                                   */
/* 	"human_party" : 政治面貌                                                                      */
/* 	"human_nationality" : 国籍                                                                  */
/* 	"human_race" : 民族                                                                         */
/* 	"human_birthday" : 出生日期                                                                   */
/* 	"human_birthplace" : 出生地                                                                  */
/* 	"human_age" : 年龄                                                                          */
/* 	"human_educated_degree" : 学历                                                              */
/* 	"human_educated_years" : 教育年限                                                             */
/* 	"human_educated_major" : 学历专业                                                             */
/* 	"human_society_security_id" : 社会保障号                                                       */
/* 	"human_id_card" : 身份证号                                                                    */
/* 	"remark" : 备注                                                                             */
/* 	"salary_standard_id" : 薪酬标准编号                                                             */
/* 	"salary_standard_name" : 薪酬标准名称                                                           */
/* 	"salary_sum" : 基本薪酬总额                                                                     */
/* 	"demand_salaray_sum" : 应发薪酬总额                                                             */
/* 	"paid_salary_sum" : 实发薪酬总额                                                                */
/* 	"major_change_amount" : 调动次数                                                              */
/* 	"bonus_amount" : 激励累计次数                                                                   */
/* 	"training_amount" : 培训累计次数                                                                */
/* 	"file_chang_amount" : 档案变更累计次数                                                            */
/* 	"human_histroy_records" : 简历                                                              */
/* 	"human_family_membership" : 家庭关系                                                          */
/* 	"human_picture" : 相片                                                                      */
/* 	"attachment_name" : 附件名称                                                                  */
/* 	"check_status" : 复核状态                                                                     */
/* 	"register" : 档案登记人                                                                        */
/* 	"checker" : 档案复核人                                                                         */
/* 	"changer" : 档案变更人                                                                         */
/* 	"regist_time" : 档案登记时间                                                                    */
/* 	"check_time" : 档案复核时间                                                                     */
/* 	"change_time" : 档案变更时间                                                                    */
/* 	"lastly_change_time" : 档案最近更改时间                                                           */
/* 	"delete_time" : 档案删除时间                                                                    */
/* 	"recovery_time" : 档案恢复时间                                                                  */
/* 	"human_file_status" : 档案状态                                                                */  
create table human_file_dig ( 
	hfd_id int primary key auto_increment,
	human_id varchar(30) ,
	first_kind_id char(2) ,
	first_kind_name varchar(60) ,
	second_kind_id char(2) ,
	second_kind_name varchar(60) ,
	third_kind_id char(2) ,
	third_kind_name varchar(60) ,
	human_name varchar(60) ,
	human_address varchar(200) ,
	human_postcode varchar(10) ,
	human_pro_designation varchar(60) ,
	human_major_kind_id char(2) ,
	human_major_kind_name varchar(60) ,
	human_major_id char(2) ,
	hunma_major_name varchar(60) ,
	human_telephone varchar(20) ,
	human_mobilephone char(11) ,
	human_bank varchar(50) ,
	human_account varchar(30) ,
	human_qq varchar(15) ,
	human_email varchar(50) ,
	human_hobby varchar(60) ,
	human_speciality varchar(60) ,
	human_sex char(2) ,
	human_religion varchar(50) ,
	human_party varchar(50) ,
	human_nationality varchar(50) ,
	human_race varchar(50) ,
	human_birthday datetime ,
	human_birthplace varchar(50) ,
	human_age int ,
	human_educated_degree varchar(60) ,
	human_educated_years int ,
	human_educated_major varchar(60) ,
	human_society_security_id varchar(30) ,
	human_id_card varchar(20) not null,
	remark varchar(1000) ,
	salary_standard_id varchar(30) ,
	salary_standard_name varchar(60) ,
	salary_sum float ,
	demand_salaray_sum float ,
	paid_salary_sum float ,
	major_change_amount int ,
	bonus_amount int ,
	training_amount int ,
	file_chang_amount int ,
	human_histroy_records varchar(1000) ,
	human_family_membership varchar(1000) ,
	human_picture varchar(255) ,
	attachment_name varchar(255) ,
	check_status int ,
	register varchar(60),
	checker varchar(60) ,
	changer varchar(60) ,
	regist_time datetime ,
	check_time datetime ,
	change_time datetime ,
	lastly_change_time datetime ,
	delete_time datetime ,
	recovery_time datetime ,
	human_file_status bit
)


/* 创建新表 "human_file"。                                                                         */
/* "human_file" : 人力资源档案                                                                      */
/* 	"huf_id" : 主键，自动增长列                                                                       */
/* 	"human_id" : 档案编号                                                                         */
/* 	"first_kind_id" : 一级机构编号                                                                  */
/* 	"first_kind_name" : 一级机构名称                                                                */
/* 	"second_kind_id" : 二级机构编号                                                                 */
/* 	"second_kind_name" : 二级机构名称                                                               */
/* 	"third_kind_id" : 三级机构编号                                                                  */
/* 	"third_kind_name" : 三级机构名称                                                                */
/* 	"human_name" : 姓名                                                                         */
/* 	"human_address" : 地址                                                                      */
/* 	"human_postcode" : 邮政编码                                                                   */
/* 	"human_pro_designation" : 职称                                                              */
/* 	"human_major_kind_id" : 职位分类编号                                                            */
/* 	"human_major_kind_name" : 职位分类名称                                                          */
/* 	"human_major_id" : 职位编号                                                                   */
/* 	"hunma_major_name" : 职位名称                                                                 */
/* 	"human_telephone" : 电话                                                                    */
/* 	"human_mobilephone" : 手机号码                                                                */
/* 	"human_bank" : 开户银行                                                                       */
/* 	"human_account" : 银行帐号                                                                    */
/* 	"human_qq" : QQ号码                                                                         */
/* 	"human_email" : 电子邮件                                                                      */
/* 	"human_hobby" : 爱好                                                                        */
/* 	"human_speciality" : 特长                                                                   */
/* 	"human_sex" : 性别                                                                          */
/* 	"human_religion" : 宗教信仰                                                                   */
/* 	"human_party" : 政治面貌                                                                      */
/* 	"human_nationality" : 国籍                                                                  */
/* 	"human_race" : 民族                                                                         */
/* 	"human_birthday" : 出生日期                                                                   */
/* 	"human_birthplace" : 出生地                                                                  */
/* 	"human_age" : 年龄                                                                          */
/* 	"human_educated_degree" : 学历                                                              */
/* 	"human_educated_years" : 教育年限                                                             */
/* 	"human_educated_major" : 学历专业                                                             */
/* 	"human_society_security_id" : 社会保障号                                                       */
/* 	"human_id_card" : 身份证号                                                                    */
/* 	"remark" : 备注                                                                             */
/* 	"salary_standard_id" : 薪酬标准编号                                                             */
/* 	"salary_standard_name" : 薪酬标准名称                                                           */
/* 	"salary_sum" : 基本薪酬总额                                                                     */
/* 	"demand_salaray_sum" : 应发薪酬总额                                                             */
/* 	"paid_salary_sum" : 实发薪酬总额                                                                */
/* 	"major_change_amount" : 调动次数                                                              */
/* 	"bonus_amount" : 激励累计次数                                                                   */
/* 	"training_amount" : 培训累计次数                                                                */
/* 	"file_chang_amount" : 档案变更累计次数                                                            */
/* 	"human_histroy_records" : 简历                                                              */
/* 	"human_family_membership" : 家庭关系                                                          */
/* 	"human_picture" : 相片                                                                      */
/* 	"attachment_name" : 附件名称                                                                  */
/* 	"check_status" : 复核状态                                                                     */
/* 	"register" : 档案登记人                                                                        */
/* 	"checker" : 档案复核人                                                                         */
/* 	"changer" : 档案变更人                                                                         */
/* 	"regist_time" : 档案登记时间                                                                    */
/* 	"check_time" : 档案复核时间                                                                     */
/* 	"change_time" : 档案变更时间                                                                    */
/* 	"lastly_change_time" : 档案最近更改时间                                                           */
/* 	"delete_time" : 档案删除时间                                                                    */
/* 	"recovery_time" : 档案恢复时间                                                                  */
/* 	"human_file_status" : 档案状态                                                                */  
create table human_file( 
	huf_id int primary key auto_increment,
	human_id varchar(30) ,
	first_kind_id char(2) ,
	first_kind_name varchar(60) ,
	second_kind_id char(2) ,
	second_kind_name varchar(60) ,
	third_kind_id char(2) ,
	third_kind_name varchar(60) ,
	human_name varchar(60) ,
	human_address varchar(200) ,
	human_postcode varchar(10) ,
	human_pro_designation varchar(60) ,
	human_major_kind_id char(2) ,
	human_major_kind_name varchar(60) ,
	human_major_id char(2) ,
	human_major_name varchar(60) ,
	human_telephone varchar(20) ,
	human_mobilephone char(11) ,
	human_bank varchar(50) ,
	human_account varchar(30) ,
	human_qq varchar(15) ,
	human_email varchar(50) ,
	human_hobby varchar(60) ,
	human_speciality varchar(60) ,
	human_sex char(2) ,
	human_religion varchar(50) ,
	human_party varchar(50) ,
	human_nationality varchar(50) ,
	human_race varchar(50) ,
	human_birthday datetime ,
	human_birthplace varchar(50) ,
	human_age int ,
	human_educated_degree varchar(60) ,
	human_educated_years int ,
	human_educated_major varchar(60) ,
	human_society_security_id varchar(30) ,
	human_id_card varchar(20) not null,
	remark varchar(1000) ,
	salary_standard_id varchar(30) ,
	salary_standard_name varchar(60) ,
	salary_sum float ,
	demand_salaray_sum float ,
	paid_salary_sum float ,
	major_change_amount int ,
	bonus_amount int ,
	training_amount int ,
	file_chang_amount int ,
	human_histroy_records varchar(1000) ,
	human_family_membership varchar(1000) ,
	human_picture varchar(255) ,
	attachment_name varchar(255) ,
	check_status int ,   
	register varchar(60) ,
	checker varchar(60) ,
	changer varchar(60) ,
	regist_time datetime ,
	check_time datetime ,
	change_time datetime ,
	lastly_change_time datetime ,
	delete_time datetime ,
	recovery_time datetime ,
	human_file_status bit 
) ;

/* 创建新表 "salary_standard_details"。                                                            */
/* "salary_standard_details" : 薪酬标准单详细信息                                                      */
/* 	"sdt_id" : 主键，自动增长列                                                                       */
/* 	"standard_id" : 薪酬标准单编号                                                                   */
/* 	"standard_name" : 薪酬标准单名称                                                                 */
/* 	"item_id" : 薪酬项目序号                                                                        */
/* 	"item_name" : 薪酬项目名称                                                                      */
/* 	"salary" : 薪酬金额                                                                           */  
create table salary_standard_details ( 
	sdt_id int primary key auto_increment,
	standard_id varchar(30) ,
	standard_name varchar(60) ,
	item_id int ,
	item_name varchar(60) ,
	salary float 
)  


/* 创建新表 "salary_standard"。                                                                    */
/* "salary_standard" : 薪酬标准基本信息表                                                              */
/* 	"ssd_id" : 主键，自动增长列                                                                       */
/* 	"standard_id" : 薪酬标准单编号                                                                   */
/* 	"standard_name" : 薪酬标准单名称                                                                 */
/* 	"designer" : 制定者名字                                                                        */
/* 	"register" : 登记人                                                                          */
/* 	"checker" : 复核人                                                                         */
/* 	"changer" : 变更人                                                                           */
/* 	"regist_time" : 登记时间                                                                      */
/* 	"check_time" : 复核时间                                                                       */
/* 	"change_time" : 变更时间                                                                      */
/* 	"salary_sum" : 薪酬总额                                                                       */
/* 	"check_status" : 是否经过复核                                                                   */
/* 	"change_status" : 更改状态                                                                    */
/* 	"check_comment" : 复核意见                                                                   */ 
/* 	"remark" : 备注   */

create table salary_standard ( 
	ssd_id int primary key auto_increment,
	standard_id varchar(30) ,
	standard_name varchar(60) ,
	designer varchar(60) ,
	register varchar(60) ,
	checker varchar(60) ,
	changer varchar(60) ,
	regist_time datetime ,
	check_time datetime ,
	change_time datetime ,
	salary_sum float ,
	check_status int ,
	change_status int ,
	check_comment varchar(1000),
	remark varchar(1000) 
)


/* 创建新表 "bonus"。                                                                              */
/* "bonus" : 激励登记表                                                                            */
/* 	"bon_id" : 主键，自动增长列                                                                       */
/* 	"major_kind_id" : 职位分类编号                                                                  */
/* 	"major_kind_name" : 职位分类名称                                                                */
/* 	"major_id" : 职位编号                                                                         */
/* 	"major_name" : 职位名称                                                                       */
/* 	"human_id" : 人力资源档案编号                                                                     */
/* 	"human_name" : 姓名                                                                         */
/* 	"bonus_item" : 激励项目名称                                                                     */
/* 	"bonus_worth" : 激励价值                                                                      */
/* 	"bonus_degree" : 激励等级                                                                     */
/* 	"remark" : 备注                                                                             */
/* 	"register" : 登记人                                                                          */
/* 	"checker" : 复核人                                                                           */
/* 	"regist_time" : 登记时间                                                                      */
/* 	"check_time" : 复核时间                                                                       */
/* 	"check_status" : 复核状态                                                                     */  
create table bonus ( 
	bon_id int primary key auto_increment,
	major_kind_id char(2) ,
	major_kind_name varchar(60) ,
	major_id char(2) ,
	major_name varchar(60) ,
	human_id varchar(30) ,
	human_name varchar(60) ,
	bonus_item varchar(60) ,
	bonus_worth float ,
	bonus_degree varchar(60) ,
	remark varchar(1000) ,
	register varchar(60) ,
	checker varchar(60) ,
	regist_time datetime ,
	check_time datetime ,
	check_status int 
) 


/* 创建新表 "training"。                                                                           */
/* "training" : 培训登记表                                                                         */
/* 	"tra_id" : 主键，自动增长列                                                                       */
/* 	"major_kind_id" : 职位分类编号                                                                  */
/* 	"major_kind_name" : 职位分类名称                                                                */
/* 	"major_id" : 职位名称                                                                         */
/* 	"major_name" : 职位名称                                                                       */
/* 	"human_id" : 人力资源档案编号                                                                     */
/* 	"human_name" : 姓名                                                                         */
/*	"training_item" ：培训项目										*/
/* 	"training_time" : 培训时间                                                                    */
/* 	"training_hour" : 培训课时                                                                    */
/* 	"training_degree" : 培训成绩等级                                                                */
/* 	"register" : 登记人                                                                          */
/* 	"checker" : 复核人                                                                           */
/* 	"regist_time" : 登记时间                                                                      */
/* 	"check_time" : 复核时间                                                                       */
/* 	"checkstatus" : 培训复核状态                                                                    */
/* 	"remark" : 备注                                                                             */  
create table training ( 
	tra_id int primary key auto_increment,
	major_kind_id char(2) ,
	major_kind_name varchar(60) ,
	major_id char(2) ,
	major_name varchar(60) ,
	human_id varchar(30) ,
	human_name varchar(60) ,
	training_item varchar(60) ,
	training_time datetime ,
	training_hour int ,
	training_degree varchar(60) ,
	register varchar(60) ,
	checker varchar(60) ,
	regist_time datetime ,
	check_time datetime ,
	checkstatus int ,
	remark varchar(1000) 
) 


/* 创建新表 "major_change"。                                                                       */
/* "major_change" : 职位调动表                                                                     */
/* 	"mch_id" : 主键，自动增长列                                                                       */
/* 	"first_kind_id" : 一级机构编号                                                                  */
/* 	"first_kind_name" : 一级机构名称                                                                */
/* 	"second_kind_id" : 二级机构编号                                                                 */
/* 	"second_kind_name" : 二级机构名称                                                               */
/* 	"third_kind_id" : 三级机构编号                                                                  */
/* 	"third_kind_name" : 三级机构名称                                                                */
/* 	"major_kind_id" : 职位分类编号                                                                  */
/* 	"major_kind_name" : 职位分类名称                                                                */
/* 	"major_id" : 职位编号                                                                         */
/* 	"major_name" : 职位名称                                                                       */
/* 	"new_first_kind_id" : 新一级机构编号                                                             */
/* 	"new_first_kind_name" : 新一级机构名称                                                           */
/* 	"new_second_kind_id" : 新二级机构编号                                                            */
/* 	"new_second_kind_name" : 新二级机构名称                                                          */
/* 	"new_third_kind_id" : 新三级机构编号                                                             */
/* 	"new_third_kind_name" : 新三级机构名称                                                           */
/* 	"new_major_kind_id" : 新职位分类编号                                                             */
/* 	"new_major_kind_name" : 新职位分类名称                                                           */
/* 	"new_major_id" : 新职位编号                                                                    */
/* 	"new_major_name" : 新职位名称                                                                  */
/* 	"human_id" : 人力资源档案编号                                                                     */
/* 	"human_name" : 姓名                                                                         */
/* 	"salary_standard_id" : 薪酬标准编号                                                             */
/* 	"salary_standard_name" : 薪酬标准名称                                                           */
/* 	"salary_sum" : 薪酬总额                                                                       */
/* 	"new_salary_standard_id" : 新薪酬标准编号                                                        */
/* 	"new_salary_standard_name" : 新薪酬标准名称                                                      */
/* 	"new_salary_sum" : 新薪酬总额                                                                  */
/* 	"change_reason" : 调动原因                                                                    */
/* 	"check_reason" : 审核通过意见                                                                   */
/* 	"check_status" : 复核通过状态                                                                   */
/* 	"register" : 登记人                                                                          */
/* 	"checker" : 复核人                                                                           */
/* 	"regist_time" : 登记时间                                                                      */
/* 	"check_time" : 复核时间                                                                       */  
create table major_change (  
	mch_id int primary key auto_increment,
	first_kind_id char(2) ,
	first_kind_name varchar(60) ,
	second_kind_id char(2) ,
	second_kind_name varchar(60) ,
	third_kind_id char(2) ,
	third_kind_name varchar(60) ,
	major_kind_id char(2) ,
	major_kind_name varchar(60) ,
	major_id char(2) ,
	major_name varchar(60) ,
	new_first_kind_id char(2) ,
	new_first_kind_name varchar(60) ,
	new_second_kind_id char(2) ,
	new_second_kind_name varchar(60) ,
	new_third_kind_id char(2) ,
	new_third_kind_name varchar(60) ,
	new_major_kind_id char(2) ,
	new_major_kind_name varchar(60) ,
	new_major_id char(2) ,
	new_major_name varchar(60) ,
	human_id varchar(30) ,
	human_name varchar(60) ,
	salary_standard_id varchar(30) ,
	salary_standard_name varchar(60) ,
	salary_sum float ,
	new_salary_standard_id varchar(30) ,
	new_salary_standard_name varchar(60) ,
	new_salary_sum float ,
	change_reason varchar(1000) ,
	check_reason varchar(1000) ,
	check_status int ,
	register varchar(60) ,
	checker varchar(60) ,
	regist_time datetime ,
	check_time datetime 
) 


/* 创建新表 "salary_grant"。                                                                       */
/* "salary_grant" : 薪酬发放登记表                                                                   */
/* 	"sgr_id" : 主键，自动增长列                                                                       */
/* 	"salary_grant_id" : 薪酬发放编号                                                                */
/* 	                                                        */
/* 	"first_kind_id" : 一级机构编号                                                                  */
/* 	"first_kind_name" : 一级机构名称                                                                */
/* 	"second_kind_id" : 二级机构编号                                                                 */
/* 	"second_kind_name" : 二级机构名称                                                               */
/* 	"third_kind_id" : 三级机构编号                                                                  */
/* 	"third_kind_name" : 三级机构名称                                                                */
/* 	"human_amount" : 总人数                                                                      */
/* 	"salary_standard_sum" : 标准薪酬总金额                                                           */
/* 	"salary_paid_sum" : 实发总金额                                                                 */
/* 	"register" : 登记人                                                                          */
/* 	"regist_time" : 登记时间                                                                      */
/* 	"checker" : 复核人                                                                           */
/* 	"check_time" : 复核时间                                                                       */
/* 	"check_status" : 复核状态                                                                     */  
create table salary_grant ( 
	sgr_id int primary key auto_increment,
	salary_grant_id varchar(30) ,
	first_kind_id char(2) ,
	first_kind_name varchar(60) ,
	second_kind_id char(2) ,
	second_kind_name varchar(60) ,
	third_kind_id char(2) ,
	third_kind_name varchar(60) ,
	human_amount int ,
	salary_standard_sum float ,
	salary_paid_sum float ,
	register varchar(60) ,
	regist_time datetime ,
	checker varchar(60) ,
	check_time datetime ,
	check_status int 
)


/* 创建新表 "salary_grant_details"。                                                               */
/* "salary_grant_details" : 薪酬发放详细信息                                                          */
/* 	"grd_id" : 主键，自动增长列                                                                       */
/* 	"salary_grant_id" : 薪酬发放编号    
 * "salary_standard_id" : 薪酬标准单编号                                                                */
/* 	"human_id" : 档案编号                                                                         */
/* 	"human_name" : 姓名                                                                         */
/* 	"bouns_sum" : 奖励金额                                                                        */
/* 	"sale_sum" : 销售绩效金额                                                                       */
/* 	"deduct_sum" : 应扣金额                                                                       */
/* 	"salary_standard_sum" : 标准薪酬总额                                                            */
/* 	"salary_paid_sum" : 实发薪酬总额                                                                */  
create table salary_grant_details ( 
	grd_id int primary key auto_increment,
	salary_grant_id varchar(30) ,
	salary_standard_id varchar(30) ,
	human_id varchar(30) ,
	human_name varchar(60) ,
	bouns_sum float ,
	sale_sum float ,
	deduct_sum float ,
	salary_standard_sum float ,
	salary_paid_sum float 
) 

/* 创建新表 "engage_major_release"。                                                               */
/* "engage_major_release" : 职位发表登记表                                                           */
/* 	"mre_id" : 主键，自动增长列                                                                       */
/* 	"first_kind_id" : 一级机构编号                                                                  */
/* 	"first_kind_name" : 一级机构名称                                                                */
/* 	"second_kind_id" : 二级机构编号                                                                 */
/* 	"second_kind_name" : 二级机构名称                                                               */
/* 	"third_kind_id" : 三级机构编号                                                                  */
/* 	"third_kind_name" : 三级机构名称                                                                */
/* 	"major_kind_id" : 职位分类编号                                                                  */
/* 	"major_kind_name" : 职位分类名称                                                                */
/* 	"major_id" : 职位编号                                                                         */
/* 	"major_name" : 职位名称                                                                       */
/* 	"human_amount" : 招聘人数                                                                     */
/* 	"engage_type" : 招聘类型                                                                      */
/* 	"deadline" : 截至日期                                                                         */
/* 	"register" : 登记人                                                                          */
/* 	"changer" : 变更人                                                                           */
/* 	"regist_time" : 登记时间                                                                      */
/* 	"change_time" : 变更时间                                                                      */
/* 	"major_describe" : 职位描述                                                                   */
/* 	"engage_required" : 招聘要求                                                                  */  
create table engage_major_release ( 
	mre_id int primary key auto_increment,
	first_kind_id char(2) ,
	first_kind_name varchar(60) ,
	second_kind_id char(2) ,
	second_kind_name varchar(60) ,
	third_kind_id char(2) ,
	third_kind_name varchar(60) ,
	major_kind_id char(2) ,
	major_kind_name varchar(60) ,
	major_id char(2) ,
	major_name varchar(60) ,
	human_amount int ,
	engage_type varchar(60) ,
	deadline datetime ,
	register varchar(60) ,
	changer varchar(60) ,
	regist_time datetime ,
	change_time datetime ,
	major_describe varchar(1000) ,
	engage_required varchar(1000) 
)


/* 创建新表 "engage_exam_details"。                                                                */
/* "engage_exam_details" : 试卷详细信息                                                             */
/* 	"exd_id" : 主键，自动增长列                                                                       */
/* 	"exam_number" : 试卷编号                                                                      */
/* 	"first_kind_id" : 试题一级分类编号                                                                */
/* 	"first_kind_name" : 试题一级分类名称                                                              */
/* 	"second_kind_id" : 试题二级分类编号                                                               */
/* 	"second_kind_name" : 试题二级分类名称                                                             */
/* 	"question_amount" : 出题数量                                                                  */  
create table engage_exam_details ( 
	exd_id int primary key auto_increment,
	exam_number varchar(30) ,
	first_kind_id char(2) ,
	first_kind_name varchar(60) ,
	second_kind_id char(2) ,
	second_kind_name varchar(60) ,
	question_amount int 
)


/* 创建新表 "engage_exam"。                                                                        */
/* "engage_exam" : 试卷登记表                                                                      */
/* 	"exa_id" : 主键，自动增长列                                                                       */
/* 	"exam_number" : 试卷编号                                                                      */
/* 	"major_kind_id" : 职位分类编号                                                                  */
/* 	"major_kind_name" : 职位分类名称                                                                */
/* 	"major_id" : 职位编号                                                                         */
/* 	"major_name" : 职位名称                                                                       */
/* 	"register" : 登记人                                                                          */
/* 	"regist_time" : 登记时间                                                                      */
/* 	"limite_time" : 答题限时                                                                      */  
create table engage_exam ( 
	exa_id int primary key auto_increment,
	exam_number varchar(30) ,
	major_kind_id char(2) ,
	major_kind_name varchar(60) ,
	major_id char(2) ,
	major_name varchar(60) ,
	register varchar(60) ,
	regist_time datetime ,
	limite_time int 
)

/* 创建新表 "engage_answer"。                                                                      */
/* "engage_answer" : 考试答题登记表                                                                  */
/* 	"ans_id" : 主键，自动增长列                                                                       */
/* 	"answer_number" : 答案编号                                                                    */
/* 	"exam_number" : 试卷编号                                                                      */
/* 	"resume_id" : 简历编号                                                                      */
/* 	"interview_id" : 面试编号                                                                      */
/* 	"human_name" : 姓名                                                                         */
/* 	"human_idcard" : 身份证号                                                                     */
/* 	"major_kind_id" : 职位分类编号                                                                  */
/* 	"major_kind_name" : major_kind_name 属于 engage_answer                                      */
/* 	"major_id" : major_id 属于 engage_answer                                                    */
/* 	"major_name" : major_name 属于 engage_answer                                                */
/* 	"test_time" : 测试时间                                                                        */
/* 	"use_time" : use_time 属于 engage_answer                                                    */
/* 	"total_point" : 总分                                                                        */  
create table engage_answer ( 
	ans_id int primary key auto_increment,
	answer_number varchar(30) ,
	exam_number varchar(30) ,
	resume_id int ,
	interview_id int ,
	human_name varchar(60) ,
	human_idcard varchar(30) ,
	major_kind_id char(2) ,
	major_kind_name char(10) ,
	major_id char(10) ,
	major_name char(10) ,
	test_time datetime ,
	use_time varchar(20) ,
	total_point float 
)

/* 创建新表 "engage_answer_details"。                                                              */
/* "engage_answer_details" : 考试答题详细信息                                                         */
/* 	"and_id" : 答案详细信息                                                                         */
/* 	"answer_number" : 答案编号                                                                    */
/* 	"subject_id" : 试题编号                                                                       */
/* 	"answer" : 答题者答案                                                                          */  
create table engage_answer_details ( 
	and_id int primary key auto_increment,
	answer_number varchar(30) ,
	subject_id int ,
	answer varchar(10) 
)  


/* 创建新表 "engage_subjects"。                                                                    */
/* "engage_subjects" : 试题题库登记表                                                                */
/* 	"sub_id" : 主键，自动增长列                                                                       */
/* 	"first_kind_id" : 试题I级分类编号                                                                */
/* 	"first_kind_name" : 试题I级分类名称                                                              */
/* 	"second_kind_id" : 试题II级分类编号                                                              */
/* 	"second_kind_name" : 试题II级分类名称                                                            */
/* 	"register" : 登记人                                                                          */
/* 	"regist_time" : 登记时间                                                                      */
/* 	"derivation" : 试题出处                                                                       */
/* 	"content" : 题干                                                                            */
/* 	"key_a" : 答案a                                                                             */
/* 	"key_b" : 答案b                                                                             */
/* 	"key_c" : 答案c                                                                             */
/* 	"key_d" : 答案d                                                                             */
/* 	"key_e" : 答案e                                                                             */
/* 	"correct_key" : 正确答案                                                                      */
/* 	"changer" : 变更人                                                                           */
/* 	"change_time" : 变更时间                                                                      */  
create table engage_subjects ( 
	sub_id int primary key auto_increment,
	first_kind_id char(2) ,
	first_kind_name varchar(60) ,
	second_kind_id char(2) ,
	second_kind_name varchar(60) ,
	register varchar(60) ,
	regist_time datetime ,
	derivation varchar(60) ,
	content varchar(1000) ,
	key_a varchar(10) ,
	key_b varchar(10) ,
	key_c varchar(10) ,
	key_d varchar(10) ,
	key_e varchar(10) ,
	correct_key varchar(10) ,
	changer varchar(60) ,
	change_time datetime 
) 


/* 创建新表 "engage_resume"。                                                                      */
/* "engage_resume" : 简历管理                                                                     */
/* 	"res_id" : 主键，自动增长列                                                                       */
/* 	"human_name" : 姓名                                                                         */
/* 	"engage_type" : 招聘类型                                                                      */
/* 	"human_address" : 地址                                                                      */
/* 	"human_postcode" : 邮编                                                                     */
/* 	"human_major_kind_id" : 职位分类编号                                                            */
/* 	"human_major_kind_name" : 职位分类名称                                                          */
/* 	"human_major_id" : 职位编号                                                                   */
/* 	"human_major_name" : 职位名称                                                                 */
/* 	"human_telephone" : 电话号码                                                                  */
/* 	"human_homephone" : 家庭电话                                                                  */
/* 	"human_mobilephone" : 手机                                                                  */
/* 	"human_email" : Email                                                                     */
/* 	"human_hobby" : 兴趣爱好                                                                      */
/* 	"human_specility" : 特长                                                                    */
/* 	"human_sex" : 性别                                                                          */
/* 	"human_religion" : 宗教信仰                                                                   */
/* 	"human_party" : 政治面貌                                                                      */
/* 	"human_nationality" : 国籍                                                                  */
/* 	"human_race" : 民族                                                                         */
/* 	"human_birthday" : 生日                                                                     */
/* 	"human_age" : 年龄                                                                          */
/* 	"human_educated_degree" : 教育程度                                                            */
/* 	"human_educated_years" : 教育年限                                                             */
/* 	"human_educated_major" : 专业                                                               */
/* 	"human_college" : 毕业院校                                                                    */
/* 	"human_idcard" : 身份证号                                                                     */
/* 	"human_birthplace" : 出生地                                                                  */
/* 	"demand_salary_standard" : 薪酬标准                                                           */
/* 	"human_history_records" : 个人履历                                                            */
/* 	"remark" : 备注                                                                             */
/* 	"recomandation" : 推荐意见                                                                    */
/* 	"human_picture" : 照片                                                                      */
/* 	"attachment_name" : 档案附件                                                                  */
/* 	"check_status" : 复核状态                                                                     */
/* 	"register" : 登记人                                                                          */
/* 	"regist_time" : 登记时间                                                                      */
/* 	"checker" : 复核人姓名                                                                         */
/* 	"check_time" : 复核时间                                                                       */
/* 	"interview_status" : 面试状态                                                                 */
/* 	"total_points" : 总分                                                                       */
/* 	"test_amount" : 考试次数                                                                      */
/* 	"test_checker" : 测试复核人                                                                    */
/* 	"test_check_time" : 测试复核时间                                                                */
/* 	"pass_register" : 通过登记人姓名                                                                 */
/* 	"pass_regist_time" : 通过登记时间                                                               */
/* 	"pass_checker" : 通过复核人姓名                                                                  */
/* 	"pass_check_time" : 通过复核时间                                                                */
/* 	"pass_check_status" : 通过的复核状态
	"pass_checkComment":录用申请审核意见
	"pass_passComment":录用申请审批意见                                                            */  
create table engage_resume ( 
	res_id int primary key auto_increment,
	human_name varchar(60) ,
	engage_type varchar(30) ,
	human_address varchar(200) ,
	human_postcode varchar(10) ,
	human_major_kind_id char(2) ,
	human_major_kind_name varchar(60) ,
	human_major_id char(2) ,
	human_major_name varchar(60) ,
	human_telephone varchar(60) ,
	human_homephone varchar(60) ,
	human_mobilephone varchar(60) ,
	human_email varchar(60) ,
	human_hobby varchar(200) ,
	human_specility varchar(200) ,
	human_sex char(2) ,
	human_religion varchar(60) ,
	human_party varchar(60) ,
	human_nationality varchar(60) ,
	human_race varchar(60) ,
	human_birthday datetime ,
	human_age int ,
	human_educated_degree varchar(60) ,
	human_educated_years int ,
	human_educated_major varchar(60) ,
	human_college varchar(60) ,
	human_idcard varchar(60) ,
	human_birthplace varchar(200) ,
	demand_salary_standard numeric(15,2) ,
	human_history_records varchar(1000) ,
	remark varchar(1000) ,
	recomandation varchar(1000) ,
	human_picture varchar(60) ,
	attachment_name varchar(60) ,
	check_status int ,
	register varchar(60) ,
	regist_time datetime ,
	checker varchar(60) ,
	check_time datetime ,
	interview_status int ,
	total_points float ,
	test_amount int ,
	test_checker varchar(60) ,
	test_check_time datetime ,
	pass_register varchar(60) ,
	pass_regist_time datetime ,
	pass_checker varchar(60) ,
	pass_check_time datetime ,
	pass_check_status int ,
	pass_checkComment varchar(60) ,
	pass_passComment varchar(60) 
)


/* 创建新表 "engage_interview"。                                                                   */
/* "engage_interview" : 面试表                                                                   */
/* 	"ein_id" : 主键，自动增长列                                                                       */
/* 	"human_name" : 姓名                                                                         */
/* 	"interview_amount" : 面试次数                                                                 */
/* 	"human_major_kind_id" : 职位分类编号                                                            */
/* 	"human_major_kind_name" : 职位分类名称                                                          */
/* 	"human_major_id" : 职位编号                                                                   */
/* 	"human_major_name" : 职位名称                                                                 */
/* 	"image_degree" : 形象等级                                                                     */
/* 	"native_language_degree" : 口才等级                                                           */
/* 	"foreign_language_degree" : 外语水平等级                                                        */
/* 	"response_speed_degree" : 应变能力                                                            */
/* 	"EQ_degree" : EQ等级                                                                        */
/* 	"IQ_degree" : IQ_等级                                                                       */
/* 	"multi_quality_degree" : 综合素质                                                             */
/* 	"register" : 面试人                                                                          */
/* 	"checker" : 筛选人                                                                           */
/* 	"registe_time" : 面试时间                                                                     */
/* 	"check_time" : 筛选时间                                                                       */
/* 	"resume_id" : 简历编号                                                                        */
/* 	"result" : 面试结果                                                                           */
/* 	"interview_comment" : 面试评价                                                                */
/* 	"check_comment" : 筛选评价                                                                    */
/* 	"interview_status" : 面试状态                                                                 */
/* 	"check_status" : 筛选状态                                                                     */  
create table engage_interview ( 
	ein_id int primary key auto_increment,
	human_name varchar(60) ,
	interview_amount int ,
	human_major_kind_id char(2) ,
	human_major_kind_name varchar(30) ,
	human_major_id char(2) ,
	human_major_name varchar(30) ,
	image_degree varchar(20) ,
	native_language_degree varchar(20) ,
	foreign_language_degree varchar(20) ,
	response_speed_degree varchar(20) ,
	EQ_degree varchar(20) ,
	IQ_degree varchar(20) ,
	multi_quality_degree varchar(20) ,
	register varchar(60) ,
	checker varchar(60) ,
	registe_time datetime ,
	check_time datetime ,
	resume_id int ,
	results varchar(20) ,
	interview_comment varchar(1000) ,
	check_comment varchar(1000) ,
	interview_status int ,
	check_status int 
)