select guest_name from guest where guest_id IN ( select room_id =5);
select email from guest where guest_id IN (select room_id=5)
select * from reservation where guest_id in (select room_id=5);
SELECT COUNT(*),guest_name FROM guest GROUP BY guest_name
select count(*) , beds_number from room group by beds_number
select COUNT(*),city from guest group by city
SELECT * FROM guest JOIN reservation ON guest_id = guestid
SELECT * FROM guest right JOIN reservation ON guest_id = guestid
SELECT * FROM guest LEFT JOIN reservation ON guest_id = guestid
SELECT * FROM guest FULL JOIN reservation ON guest_id = guestid
select guest_id , room_id from guest join room on room_id=roomid
insert into guest values ('Abdelrhman','algria','bnhad','aasd',0122623154,'abdelrhman@gmail.com',NULL)
insert into payment values (2,3,2,200,NULL,200)
insert into reservation values(5,2,'2000-05-06',NULL)
insert into room values(556,'single',1,350)
insert into guest values ('mohamed','plastine','gaza','gaza',010154569,'mohamed@gmail.com',556)
update guest set guest_name='ali', email='ali@gmail.com' where guest_id=9
update payment set visacard_number =23526555 where payment_id=1
update reservation set check_out_date='2020-5-25' where reservation_id=17
update room set room_type='double', beds_number=2 where roomid=556
update guest set room_id=92 where guest_id=7
delete guest where guest_id=7
delete reservation where reservation_id=3 
delete payment where payment_id=1
delete room where room_id=3
delete guest where guest_name='Abdelrhman'
select count(roomid) from room
select count(guest_name) from guest
select sum (room_price) from room
select MIN(room_price) from room
select Max(room_price) from room
select count(roomid) from room where room_type='single'
select count(roomid) from room where room_type='double'
select beds_number from room where room_type='double'
select  check_in_date , guest_name from reservation join guest on guestid=guest_id
select guest_name from guest where room_id=5
select sum(cash_payed) from payment
select guestid ,  check_out_date from reservation  where check_out_date = NULL
select visacard_number,guest_id from payment
select country from guest where room_id=5
select guest_name from guest join room on guest_id =roomid where room_type='double'
select phone , guest_name from guest where country='egypt'
select email from guest where guest_id IN ( select room_id =5);
select COUNT(guest_name)from guest where country='egypt'
select count(city) from guest  where country='egypt ' 
select guest_name from guest where room_id = NULL