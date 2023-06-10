CREATE USER 'hbstudent'@'localhost' IDENTIFIED BY 'hbstudent';


drop database donate_charity_project;
create database donate_charity_project;
GRANT ALL PRIVILEGES ON donate_charity_project.* TO 'hbstudent'@'localhost';
use donate_charity_project;

create table roles(
id int(11) primary key auto_increment, 
role_name varchar(255)
);

insert into roles(id,role_name) values (1,'admin');
insert into roles(id,role_name) values (2,'customer');

create table accounts(
id int(4) primary key auto_increment,
address varchar(255),
email varchar(255),
full_name varchar(255),
note varchar(255),
pass_word varchar(255),
phone_number varchar(255),
account_status int(4) default 1,
user_name varchar(255),
created varchar(255),
role_id int(4) ,
CONSTRAINT FK_userRole foreign key (role_id) references roles(id)
);

insert into accounts values(1,'the sky','triggerHappy@yahoo.com','Alan Kahon','Where is all goodthing','qwe123123','0968371312',1,'rabbitfire','11/9',1);
insert into accounts values(2,'the sea','rabbitFire@yahoo.com','Alice Wonder','High above the cloud','qwe123123','0968371312',1,'rabbitfire','11/9',1);
insert into accounts values(3,'the star','HarryPot@yahoo.com','Harry','High above the cloud','qwe123123','0968371312',1,'rabbitfire','11/9',1);
insert into accounts values(4,'the Ocean','Kang@yahoo.com','Aoi','High above the cloud','qwe123123','0968371312',1,'rabbitfire','11/9',1);
insert into accounts values(5,'the mountain','Kuroshio@yahoo.com','Kaho','High above the cloud','qwe123123','0968371312',1,'rabbitfire','11/9',1);
insert into accounts values(6,'the forest','Venti@yahoo.com','Nishimori Shizuku','High above the cloud','qwe123123','0968371312',1,'rabbitfire','11/9',1);
insert into accounts values(7,'the moon','Diluc@yahoo.com','Moi','High above the cloud','qwe123123','0968371312',1,'rabbitfire','11/9',1);

create table donations (
id int(4) primary key auto_increment,
code varchar(255),
created varchar(255),
description varchar(255),
end_date varchar(255),
money int(11),
name varchar(255),
organization_name varchar(255),
phone_number varchar(255),
start_date varchar(255),
status int(11)
);

insert into donations values(1,'a1','22/3/1996','day are forgotten','20/2/2022',300000,'For the poor children','GO child inc','0968372312','11/02/2023',1);
insert into donations values(2,'b121','2/3/1996','End of all','20/2/2022',300000,'For the elder','GO child inc','0968372312','11/02/2023',1);
insert into donations values(3,'c3e1','2/9/1996','Far from over','20/2/2022',300000,'For the Disable','GO child inc','0968372312','11/02/2023',1);
insert into donations values(4,'a221','2/3/1996','between the good','20/2/2022',300000,'For the blind','GO child inc','0968372312','11/02/2023',1);
insert into donations values(5,'a11','2/3/1996','between t','20/2/2022',300000,'For the blind','GO child inc','0968372312','11/02/2023',1);
insert into donations values(6,'a21','2/3/1996','between the','20/2/2022',300000,'For the blind','GO child inc','0968372312','11/02/2023',1);
insert into donations values(7,'a821','2/3/1996',' the good','20/2/2022',300000,'For the blind','GO child inc','0968372312','11/02/2023',1);

drop table user_donation;
create table user_donation (
id int(11) primary key auto_increment,
created varchar(255), 
money int(11),
name varchar(255),
status int(11),
text varchar(255),
donation_id int(11),
CONSTRAINT FK_donation_to foreign key (donation_id) references donations(id)
);

TRUNCATE table user_donation;

insert into user_donation values(1,'20/02/2013',40000,'odd',0,'text',1);
insert into user_donation values(2,'20/02/2014',40000,'odd',0,'text',1);
insert into user_donation values(3,'20/02/2015',40000,'odd',0,'text',1);
insert into user_donation values(4,'20/02/2015',40000,'odd',0,'text',1);
insert into user_donation values(5,'20/02/2015',40000,'odd',0,'text',1);



