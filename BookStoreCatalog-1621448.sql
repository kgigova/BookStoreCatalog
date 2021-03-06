USE [db2b7839c89c254a0aa525a7960167e234]
GO
/****** Object:  Table [dbo].[book]    Script Date: 25.6.2017 г. 23:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[book](
	[book_id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[author_name] [varchar](128) NULL,
	[title] [varchar](256) NULL,
	[description] [text] NULL,
	[b_price] [decimal](18, 2) NULL,
	[imagePath] [text] NULL,
	[pdfPath] [text] NULL,
 CONSTRAINT [PK_book_id] PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[category]    Script Date: 25.6.2017 г. 23:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[c_name] [varchar](128) NULL,
 CONSTRAINT [PK_category_id] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[comment]    Script Date: 25.6.2017 г. 23:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[book_id] [int] NULL,
	[comment] [text] NULL,
	[c_date_time] [datetime] NULL,
 CONSTRAINT [PK_comment_id] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[login]    Script Date: 25.6.2017 г. 23:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[login](
	[login_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [varchar](30) NULL,
	[password] [text] NULL,
	[role] [varchar](30) NULL,
 CONSTRAINT [PK_login_id] PRIMARY KEY CLUSTERED 
(
	[login_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[orders]    Script Date: 25.6.2017 г. 23:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[book_id] [int] NULL,
	[user_id] [int] NULL,
	[o_date_time] [datetime] NULL,
	[status] [varchar](30) NULL,
 CONSTRAINT [PK_order_id] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 25.6.2017 г. 23:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[fname] [varchar](20) NULL,
	[lname] [varchar](30) NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_user_id] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[BookDetails]    Script Date: 25.6.2017 г. 23:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[BookDetails]
as 
select b.book_id, b.title, b.author_name, b.b_price,c.c_name, b.imagePath
from    dbo.book as b left join
                 dbo.category as c on c.category_id = b.category_id
GO
SET IDENTITY_INSERT [dbo].[book] ON 

INSERT [dbo].[book] ([book_id], [category_id], [author_name], [title], [description], [b_price], [imagePath], [pdfPath]) VALUES (11, 3, N'C.L. Wells', N'The Testament Stone', N'When her best friend is murdered by a deranged killer, Megyn Keith unexpectedly inherits an ancient pendant with strange powers. She is led on a journey of discovery as the powers of the pendant begin to manifest and reveal clues about who the murderer is and why they committed the crime. As Megyn gets closer and closer to the truth, she unknowingly becomes the killer’s next target. Out of her element and running out of time, she must discover who the real killer is and avenge her best friend’s death before she becomes the next victim. ', CAST(11.49 AS Decimal(18, 2)), N'BookPictures/0bf393fb-3e7b-493c-9571-3a8e9c90b784.jpg', N'pdfs/2197fcab-9d37-4269-b3b0-21e79bdf7eb4.pdf')
INSERT [dbo].[book] ([book_id], [category_id], [author_name], [title], [description], [b_price], [imagePath], [pdfPath]) VALUES (12, 4, N'E.M. McCarthy', N'The Kiss That Saved Her', N'Princess Joanna is expected to marry to protect her kingdom from the threat of war but she loves David, a common man. She will only marry if she loves her husband. Her dearest friend, Prince Samuel, has loved her since he met her. Rumors swirl about Prince Samuel’s relationship with a princess whose country has had a major discovery of gold. Will there be a change of heart? Will Princess Joanna choose royalty over love? Is there really such a thing as love at first sight?The Kiss that Saved Her is a retelling and expansion of the fairytale, Snow White. The novel is a Christian Romance story suitable for teens and other romance book lovers.', CAST(12.89 AS Decimal(18, 2)), N'BookPictures/836df06b-18f5-46c0-890b-45edf5508543.jpg', N'pdfs/b7446306-497a-47f8-a1be-891cf0d93e50.pdf')
INSERT [dbo].[book] ([book_id], [category_id], [author_name], [title], [description], [b_price], [imagePath], [pdfPath]) VALUES (16, 5, N'Chrys Romeo', N'The Vortex', N'Away from Earth, on another planet, people want to begin a new life, just as two galaxies are about to collide. The story lets you find out if love is powerful enough to withstand a galaxy collision. It also changes the perspective on the possibilities of life, which are endless in this universe.', CAST(11.45 AS Decimal(18, 2)), N'BookPictures/0731b8cb-770d-4250-8f44-02594d33ffd9.jpg', N'pdfs/0aedd515-c62c-4106-b5cb-75675adf50ba.pdf')
INSERT [dbo].[book] ([book_id], [category_id], [author_name], [title], [description], [b_price], [imagePath], [pdfPath]) VALUES (17, 2, N'Nick Nwaogu', N'February', N'In February, together, Sergeant Femi Kolawole and investigative journalist Chioma Okafor solves Emeka''s Valentine-day murder, and on doing so, Chioma is exposed to Femi''s heroic personality, which makes her eventually fall in love with him.This is a story on how crime brings two love birds together.', CAST(12.55 AS Decimal(18, 2)), N'BookPictures/0eafe2a5-c762-4cce-a0f1-879675651e96.jpg', N'pdfs/f244b861-ac89-49dc-bc00-e3acece364d4.pdf')
INSERT [dbo].[book] ([book_id], [category_id], [author_name], [title], [description], [b_price], [imagePath], [pdfPath]) VALUES (18, 2, N'Den Warren', N'Ayanna', N'In a world where many people kill for their daily needs, a young girl, who spent her formative years among a clan of cannibals, is now under the guidance of a militaristic community, where she learns the ways of war.

Ayanna may be read as a stand-alone story, or as a sequel to the novel, Kings and Clans of the Midwest.
', CAST(15.60 AS Decimal(18, 2)), N'BookPictures/44d79ef8-1965-45fc-b490-c32769e311ee.jpg', N'pdfs/cc1a46dd-91ee-421d-a3c4-42921e2d0164.pdf')
INSERT [dbo].[book] ([book_id], [category_id], [author_name], [title], [description], [b_price], [imagePath], [pdfPath]) VALUES (19, 4, N'Karen Cogan', N'The Prodigal Heart', N'In this inspirational novel, Rachel thinks she has her life under control. She has succeeded in starting a business and she tells herself all her dreams have come true. But there is one dream that lies buried in her past, so painful that she tries never to think of it. She tries to erase all memory of her heart-stopping first love...Until Jonathon walks back into her life. Their love picks up where they left off. Yet, Rachel longs for a man with a strong faith in God. Does she see a desire to know God stirring in Jonathon? And if she does, can she trust him with her heart?', CAST(20.00 AS Decimal(18, 2)), N'BookPictures/0461035d-e55a-456d-9a57-b70f2b2f721a.jpg', N'pdfs/28377130-aaa4-4dd2-afe8-ef5ba1bda23e.pdf')
INSERT [dbo].[book] ([book_id], [category_id], [author_name], [title], [description], [b_price], [imagePath], [pdfPath]) VALUES (20, 5, N'O. H. Reads', N'Safe at Home', N'Carrie has been afraid of the night and every shadow since she was 4, when something crept out of the shadows and killed her parents. She bounced around foster homes while growing up, a trail of death in her wake. Somehow she managed to not go crazy, kill herself, or get investigated by the police. A job as a receptionist at a shipping company has finally brought some normalcy to her life. And then one day Sam walks in the door. An easy smile, grace in his every step, and eyes that remind her of her own make him almost irresistible. But Carrie''s afraid to get close to him. Anyone she''s ever cared about has ended up under a white sheet. In Carrie''s case, the monsters of her nightmares aren''t imaginary, they''re real.', CAST(22.00 AS Decimal(18, 2)), N'BookPictures/a3cf3e2d-1c5c-4170-88e5-8caa76a4ea5b.jpg', N'pdfs/9008cffc-e79a-4c5f-98e8-cfff42a2ff84.pdf')
INSERT [dbo].[book] ([book_id], [category_id], [author_name], [title], [description], [b_price], [imagePath], [pdfPath]) VALUES (21, 3, N'K. E. Ward', N'He''s After Me', N'Molly Peterson is simple kinda gal who works at a drugstore in Chicago. One night, as she is walking home, she meets a strange, cigar-smoking man just before two other men attack her, beat her up, and mug her. Then she meets Damion, a handsome business man who comes to her rescue. Together, they discover that whoever attacked her that first night is still after her. Sometimes dealing with incompetent police, sometimes investigating on their own, they must discover who is after her and why. A story set in Chicago, this novelette is part-mystery and part-suspense/thriller.', CAST(23.50 AS Decimal(18, 2)), N'BookPictures/81727656-d30a-4f7f-b6d2-b8598ddb97c2.jpg', N'pdfs/3392ca57-46a3-4aec-9327-87bfbc163505.pdf')
INSERT [dbo].[book] ([book_id], [category_id], [author_name], [title], [description], [b_price], [imagePath], [pdfPath]) VALUES (22, 3, N'Richard Shekari', N'Darkness Risen-The Torcher', N'Darkness covers the earth. The Sun, though still in its position in the solar system, has not been able to perform one of its most vital functions; to give light. It has turned dark, and this, amongst other things has made manifest the wicked dwellers of the darkest part of the underworld. Most of the things humans thought they knew and understood have in a way disobeyed the natural laws that be; there are no children left in the world, and no woman is bestowed with the power to give birth. Both natural and artificial means and sources of light have failed. In the midst of his trial, Jeffery, a young man falls in love with a girl, Karen, whom he had ignored for some time. And their love is put to test as the world is thrown back into an age worse than the days before the dinosaur.', CAST(21.99 AS Decimal(18, 2)), N'BookPictures/807db389-25f6-4175-8656-2eb344897d0c.jpg', N'pdfs/b789f32e-dae1-455f-8f18-5aeb29401fcb.pdf')
SET IDENTITY_INSERT [dbo].[book] OFF
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([category_id], [c_name]) VALUES (2, N'Drama')
INSERT [dbo].[category] ([category_id], [c_name]) VALUES (3, N'Mistery')
INSERT [dbo].[category] ([category_id], [c_name]) VALUES (4, N'Romance')
INSERT [dbo].[category] ([category_id], [c_name]) VALUES (5, N'Sci-fi')
SET IDENTITY_INSERT [dbo].[category] OFF
SET IDENTITY_INSERT [dbo].[comment] ON 

INSERT [dbo].[comment] ([comment_id], [user_id], [book_id], [comment], [c_date_time]) VALUES (3, 1, 11, N'Много хубава книга!', CAST(N'2017-06-19 20:54:47.227' AS DateTime))
SET IDENTITY_INSERT [dbo].[comment] OFF
SET IDENTITY_INSERT [dbo].[login] ON 

INSERT [dbo].[login] ([login_id], [user_id], [user_name], [password], [role]) VALUES (1, 1, N'kg', N'1234', N'администратор')
INSERT [dbo].[login] ([login_id], [user_id], [user_name], [password], [role]) VALUES (2, 2, N'ii', N'12', N'??????????')
SET IDENTITY_INSERT [dbo].[login] OFF
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([order_id], [book_id], [user_id], [o_date_time], [status]) VALUES (3, 11, 1, CAST(N'2017-06-19 21:19:57.603' AS DateTime), N'????????')
INSERT [dbo].[orders] ([order_id], [book_id], [user_id], [o_date_time], [status]) VALUES (4, 12, 1, CAST(N'2017-06-19 21:21:33.960' AS DateTime), N'????????')
INSERT [dbo].[orders] ([order_id], [book_id], [user_id], [o_date_time], [status]) VALUES (8, 19, 1, CAST(N'2017-06-20 21:50:47.287' AS DateTime), N'????????')
SET IDENTITY_INSERT [dbo].[orders] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([user_id], [fname], [lname], [email]) VALUES (1, N'Кристиана', N'Гигова', N'kristiana.gigova@gmail.com')
INSERT [dbo].[users] ([user_id], [fname], [lname], [email]) VALUES (2, N'????', N'??????', N'i.i@a.bg')
SET IDENTITY_INSERT [dbo].[users] OFF
ALTER TABLE [dbo].[book]  WITH CHECK ADD  CONSTRAINT [FK__book__b_prize__060DEAE8] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[book] CHECK CONSTRAINT [FK__book__b_prize__060DEAE8]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK__comment__book_id__0DAF0CB0] FOREIGN KEY([book_id])
REFERENCES [dbo].[book] ([book_id])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK__comment__book_id__0DAF0CB0]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[login]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK__orders__book_id__09DE7BCC] FOREIGN KEY([book_id])
REFERENCES [dbo].[book] ([book_id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK__orders__book_id__09DE7BCC]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_book]    Script Date: 25.6.2017 г. 23:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_delete_book]
@book_id int
as
begin
	delete from orders
	where book_id=@book_id
	delete from comment 
	where book_id=@book_id
	delete FROM book
	where book_id=@book_id 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_bookdetails]    Script Date: 25.6.2017 г. 23:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_delete_bookdetails]
@book_id int,
@user_id int
as
begin
	delete from book
	where book_id=@book_id
	delete from comment
	where user_id=@user_id
	and book_id=@book_id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_books]    Script Date: 25.6.2017 г. 23:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_delete_books]
@book_id int,
@user_id int
as
begin
delete from  orders
where @user_id=user_id
and @book_id=book_id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_bookdetails]    Script Date: 25.6.2017 г. 23:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_insert_bookdetails]
@c_name varchar(128),
@book_id int,
@title varchar(256),
@author_name varchar(128),
@description text,
@b_price money,
@imagePath text = null,
@pdfPath text = null
as
begin
declare @category_id int
set @category_id = (select top 1 category_id from category where c_name = @c_name)
insert into book
(category_id, title, author_name, description, b_price, imagePath, pdfPath )
values (@category_id, @title, @author_name, @description, @b_price, @imagePath, @pdfPath)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_comment]    Script Date: 25.6.2017 г. 23:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_insert_comment]
@book_id int,
@user_id int,
@comment text
as
begin
INSERT INTO comment (user_id, book_id, comment, c_date_time)
VALUES (@user_id, @book_id, @comment, GETDATE())
end
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_incart]    Script Date: 25.6.2017 г. 23:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_insert_incart]
@book_id int,
@user_id int
as
begin
if not exists( SELECT book_id FROM orders WHERE user_id = @user_id AND book_id = @book_id )
	begin
		insert into orders(book_id,user_id,status)
		values (@book_id,@user_id,'В кошница')
		SELECT SCOPE_IDENTITY()
	end
else
	begin
		SELECT -1
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_users]    Script Date: 25.6.2017 г. 23:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_insert_users]
@fname varchar(20),
@lname varchar(30),
@email varchar(50),
@user_name varchar(30),
@password text
as
begin
	declare @user_id int
	insert into users (fname, lname, email)
	values (@fname, @lname, @email)
	set @user_id = SCOPE_IDENTITY();
	insert into login (user_id, user_name, password,role)
	values (@user_id, @user_name, @password, 'потребител')
	SELECT SCOPE_IDENTITY() as login_id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_select_book]    Script Date: 25.6.2017 г. 23:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_select_book]
as 
begin
select b.book_id, b.title, b.author_name,c.c_name, b.description, b.b_price,b.imagePath, b.pdfPath
from    dbo.book as b left join
                 dbo.category as c on c.category_id = b.category_id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_select_bookdetails]    Script Date: 25.6.2017 г. 23:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_select_bookdetails]
@c_name varchar(128)
as
begin
select b.book_id, b.title, b.author_name, ca.c_name, b.description, b.b_price,c.comment, u.fname, u.lname
from book b 
	left join comment c 
		on c.book_id = b.book_id
	left join users u 
		on u.user_id = c.user_id 
	left join category ca 
		on ca.category_id=(select top 1 category_id from category where c_name = @c_name)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_select_booksdetails]    Script Date: 25.6.2017 г. 23:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_select_booksdetails]
@book_id int
as
begin
	select b.book_id,b.title, b.author_name,b.description,b.b_price,c.c_name,b.imagePath,b.pdfPath
	from book b
	left join category c on c.category_id = b.category_id
	where b.book_id=@book_id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_select_comments]    Script Date: 25.6.2017 г. 23:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_select_comments]
@book_id int
as
begin
SELECT u.fname, u.lname, c.comment, c.c_date_time FROM comment c
LEFT JOIN users u
ON c.user_id = u.user_id
WHERE c.book_id = @book_id
ORDER BY c.c_date_time DESC
end
GO
/****** Object:  StoredProcedure [dbo].[sp_select_has_book]    Script Date: 25.6.2017 г. 23:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_select_has_book]
@user_id int,
@book_id int
as
begin
SELECT * FROM orders WHERE user_id = @user_id AND book_id = @book_id AND status = 'Поръчана'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_select_mybooks]    Script Date: 25.6.2017 г. 23:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_select_mybooks]
@user_id int
as
begin
select b.book_id, b.title, b.author_name,c.c_name, b.description, b.b_price,o.o_date_time as orderdate,b.imagePath
from orders o 
left join book b
	on o.book_id = b.book_id
left join category c
	on c.category_id = b.category_id
where 
	user_id=@user_id AND o.o_date_time IS NOT NULL
end
GO
/****** Object:  StoredProcedure [dbo].[sp_select_orders_for_user]    Script Date: 25.6.2017 г. 23:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_select_orders_for_user]
@user_id int
as
begin
	SELECT o.book_id, b.title, b.b_price, b.author_name, c.c_name,b.imagePath
	FROM orders o
	left join book b on o.book_id=b.book_id
	left join category c on c.category_id=b.category_id
	where o.user_id=@user_id and status='В кошница'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_select_search]    Script Date: 25.6.2017 г. 23:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_select_search]
@criteria varchar(max)
as
begin
	select
		b.book_id, b.title, b.author_name, ca.c_name, b.description, b.imagePath, b.b_price,c.comment, u.fname, u.lname
    from
        book b
	left join comment c
		on c.book_id = b.book_id
	left join users u
		on u.user_id = c.user_id
	left join category ca
		on ca.category_id = b.category_id
    where
		b.title LIKE '%' + @criteria +'%' OR
		b.author_name LIKE '%' + @criteria + '%'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_select_total_price]    Script Date: 25.6.2017 г. 23:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_select_total_price]
@user_id int
as
begin
select Sum(t2.b_price) 
FROM   ((SELECT * 
        FROM   orders o
        WHERE  user_id= @user_id 
               AND status = 'В кошница') AS t1 
        LEFT JOIN (SELECT * 
                   FROM book) AS t2 
               ON t1.book_id = t2.book_id)
			   end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_bookdetails]    Script Date: 25.6.2017 г. 23:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_update_bookdetails]
@c_name varchar(128),
@book_id int,
@title varchar(256),
@author_name varchar(128),
@description text,
@b_price money,
@imagePath text = null,
@pdfPath text = null
AS 
  BEGIN 
      UPDATE book 
      SET    title = @title, 
             author_name = @author_name, 
             description = @description, 
             b_price = @b_price, 
             category_id = (SELECT TOP 1 category_id 
                            FROM   category 
                            WHERE  c_name = @c_name), 
             imagepath = @imagePath, 
             pdfpath = @pdfPath 
      WHERE  book_id = @book_id 
  END
GO
/****** Object:  StoredProcedure [dbo].[sp_update_order]    Script Date: 25.6.2017 г. 23:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_update_order]
(
@user_id int
)
as
begin
update orders
set o_date_time=GETDATE(), status='Поръчана'
WHERE order_id in
(select order_id from orders
where user_id = @user_id AND status = 'В кошница')
end
GO
/****** Object:  StoredProcedure [dbo].[UsersP]    Script Date: 25.6.2017 г. 23:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UsersP]
	@password text,
	@user_name varchar(10)
as
	select user_id from login 
	where password LIKE @password and user_name=@user_name
return 0
GO
