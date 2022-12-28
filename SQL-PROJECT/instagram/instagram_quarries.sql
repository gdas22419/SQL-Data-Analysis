select * from user;
select * from follows;
select * from photes;
select * from tags;
select * from photes_tag;
select * from likes;

/*We want to reward our users who have been
 around the longest.  
Find the 5 oldest users.*/

select * from user
order by created_at
limit 5 ;

/*What day of the week do most users register on?
We need to figure out when to schedule an ad campgain*/

select * , dayname(created_at) `day` ,count(*) count 
from user
group by 4
order by 5 desc;

/*We want to target our inactive users with an email campaign.
Find the users who have never posted a photo*/
select user_name from user
left join photes
on  user.id =photes.user_id 
where photes.id is NULL;

/*We're running a new contest to see who can get the most 
likes on a single photo.
WHO WON??!!*/

select user.user_name, photes.id,photes.image_url,
count(*) as total_likes  from user
join photes
on user.id=photes.user_id
join likes
on photes.id = likes.phote_id
group by photes.id
order by 4 desc
;


/*Our Investors want to know...
How many times does the average user post?*/
/*total number of photos/total number of users*/

select round((select count(*) from photes)/(select count(*) from user),2);

/*user ranking by postings higher to lower*/

select user.user_name, count(photes.image_url) from user
join photes
on user.id = photes.user_id
group by user_id
order by 2 desc;

/*Total Posts by users (longer versionof SELECT COUNT(*)FROM photos) */
select sum(user_post.total_post) from
(select user.user_name , count(photes.image_url) as total_post from user
join photes 
on user.id = photes.user_id
group by user_id) as user_post;

/*total numbers of users who have posted at least one time */
select count(distinct(user.user_name))  from user
join photes
on user.id=photes.user_id 
;

/*A brand wants to know which hashtags to use in a post
What are the top 5 most commonly used hashtags?*/



select tag_name, count(tag_name) as total_tag from tags
join photes_tag
on tags.id= photes_tag.tag_id
group by tag_id
order by total_tag desc
limit 5;

/*We have a small problem with bots on our site...
Find users who have liked every single photo on the site*/

select user.id,user.user_name,count(user.id) as total_likes
from user
join likes on user.id = likes.user_id
group by user.id
having total_likes = (select count(*) from photes);

/*We also have a problem with celebrities
Find users who have never commented on a photo*/


SELECT user_name,comment_text
FROM user
LEFT JOIN comment ON user.id = comment.user_id
GROUP BY user.id
HAVING comment_text IS NULL;


/*Mega Challenges
Are we overrun with bots and celebrity accounts?
Find the percentage of our users who have either never 
commented on a photo or have commented on every photo*/
select tableA.total_A as 'number of user who never commented',
(tableA.total_A/(select count(*) from user))*100 as '%',
tableB.total_B as 'Number of users who likes every photes',
(tableB.total_B/(select count(*) from user))*100 as '%' 
from 
(
select count(*) as total_A  from 
(select user_name, comment_text
 from user
 left join comment on user.id= comment.user_id
 group by user.id
 having comment_text is null) as total_number_of_user_without_comment
 ) as tableA
 join 
 (
select count(*) as total_B from (
select user.id,user_name, count(user.id) as total_likes_by_user
from user
join likes on user.id = likes.user_id
group by user.id
having total_likes_by_user = (select count(*)  from photes)) 
as total_number_of_user_likes_every_photes
) as tableB;

/*Find users who have ever commented on a photo*/
select 	user_name, comment_text from user
left join comment on user.id = comment.user_id
group by user.id
having comment_text is not null;

select count(*) from 
(select 	user_name, comment_text from user
left join comment on user.id = comment.user_id
group by user.id
having comment_text is not null) as total_number_user_with_comment;

/*Are we overrun with bots and celebrity accounts?
Find the percentage of our users who have either never commented
 on a photo or have commented on photos before*/
 
 select tableA.total_A as 'Number of who never commented',
 (tableA.total_A/(select count(*) from user))*100 as '%',
 tableB.total_B as 'number of user who commented on photes',
 (tableB.total_B/(select count(*) from user))*100 as '%'
 from
 (
 select count(*) total_A from 
(select 	user_name, comment_text from user
left join comment on user.id = comment.user_id
group by user.id
having comment_text is null) as total_number_user_without_comment
 ) as tableA
 join
 (
select count(*) total_B from 
(select 	user_name, comment_text from user
left join comment on user.id = comment.user_id
group by user.id
having comment_text is not null) as total_number_user_with_comment
) as tableB;

