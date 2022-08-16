USE master
GO


--drop database if it exists
IF DB_ID('final_capstone') IS NOT NULL
BEGIN
	ALTER DATABASE final_capstone SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE final_capstone;
END

CREATE DATABASE final_capstone
GO

USE final_capstone
GO

BEGIN TRANSACTION
--create tables
CREATE TABLE users (
	user_id int IDENTITY(1,1) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	salt varchar(200) NOT NULL,
	user_role varchar(50) NOT NULL
	CONSTRAINT PK_user PRIMARY KEY (user_id)
)
CREATE TABLE brewery (
	id int IDENTITY(1000,1) NOT NULL,
	name varchar(100) NOT NULL,
	phone varchar (20),
	about varchar (500),
	website varchar (200),
	address varchar (50) NOT NULL,
	image varchar (500),
	logo varchar (500),
	hours varchar (30), 
	city varchar (50),
	state varchar (20),
	zip varchar (10)
	CONSTRAINT PK_brewery PRIMARY KEY (id)
)
CREATE TABLE review(
	review_id int IDENTITY (3000, 1) NOT NULL,
	brewery_id int,
	rating int NOT NULL,
	content varchar (600) NOT NULL
	CONSTRAINT PK_review PRIMARY KEY (review_id),
	CONSTRAINT FK_brewery FOREIGN KEY (brewery_id) REFERENCES brewery (id)
)
CREATE TABLE tag (
	tag_id int IDENTITY (2000,1) NOT NULL,
	type varchar (20) NOT NULL,
	CONSTRAINT PK_tag PRIMARY KEY (tag_id)
)
CREATE TABLE beer_list(
	beer_id int IDENTITY (5000,1),
	beer_name varchar (200),
	type varchar (30),
	abv decimal (4,2)
	CONSTRAINT PK_beer PRIMARY KEY (beer_id)
)
CREATE TABLE beer_brewery(
	beer_brewery_id int IDENTITY (1,1),
	beer_id int,
	brewery_id int
	CONSTRAINT brewery_beer_PK PRIMARY KEY (beer_brewery_id),
	CONSTRAINT beer_fk FOREIGN KEY (beer_id) REFERENCES beer_list (beer_id),
	CONSTRAINT brewery_id_fk FOREIGN KEY (brewery_id) REFERENCES brewery (id)
)
CREATE TABLE brewery_tag (
	brewery_tag_id int IDENTITY (1,1),
	tag_id int,
	brewery_id int,
	CONSTRAINT Brewery_tag_pk PRIMARY KEY (brewery_tag_id),
	CONSTRAINT tag_fk FOREIGN KEY (tag_id) REFERENCES tag (tag_id),
	CONSTRAINT Brewery_fk FOREIGN KEY (brewery_id) REFERENCES brewery (id)
)
CREATE TABLE user_review (
	user_review_id int Identity (1,1),
	user_id int,
	review_id int,
	CONSTRAINT user_review_pk PRIMARY KEY (user_review_id),
	CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES users (user_id),
	CONSTRAINT review_id_fk FOREIGN KEY (review_id) REFERENCES review (review_id)
)
CREATE TABLE trails (
	trail_id int IDENTITY (6000, 1),
	is_completed bit DEFAULT 0,
	type varchar (20)
	CONSTRAINT PK_trail PRIMARY KEY (trail_id)
)
CREATE TABLE brewery_trails(
	brewery_trails_id int IDENTITY (1,1),
	trail_id int,
	brewery_id int
	CONSTRAINT Brewery_trail_pk PRIMARY KEY (brewery_trails_id),
	CONSTRAINT trail_fk FOREIGN KEY (trail_id) REFERENCES trails (trail_id),
	CONSTRAINT FK_brewery_from_trails FOREIGN KEY (brewery_id) REFERENCES brewery (id)
)
CREATE TABLE trail_user (
	trail_user_id int IDENTITY (1,1),
	trail_id int,
	user_id int
	CONSTRAINT trail_user_pk PRIMARY KEY (trail_user_id),
	CONSTRAINT FK_trail FOREIGN KEY (trail_id) REFERENCES trails (trail_id),
	CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES users (user_id)
)



--populate default data
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('JoeyLitten','axZvUV/AMhRxhtl9Sc5Krg8/HII=','5a+ULxS8xUw=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('CraigChrist', 'OhoI3boEcDwMITL/WL65vXeVU3I=', 'N21/HgEsnbk=', 'user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('TotallyNotJohnSavage', 'Wl0xIJ2XOmCDzWzHtu2GpXSzpdo=', 'jJDKREJGV0I=', 'user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('AdaLoveLace', 'MN5SpCeEJJN1R3/kQ47BFESviGU=', 'VilbnnPymZo=', 'user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('DiMoFoSho5', 'oKtcRWR59ojq1wirzR2wtmljS5I=', 'AOdc8222+RI=', 'user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('SergioDeLuca ', ' vMldpsR96MaBMij273wef8Wg/gY=', '7BxDpq9HENw=', 'user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('IvanPetrov', 'zf/t91aMLKihWhekx9v670m9AeE=', 'Vsz0sLWUrWQ=', 'user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('Gunner', 'Vurys4CTbhLa4P7jsJDFHJ2gFv8=', 'tl1D+LBGrEs=', 'user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('GideonGates', 'MD+1tmVG1rg//arCyUGBBuK4C+4=', 'egBZIPbs5kA=', 'user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('DerekVogel', 'vbognPoDCh/ErqZvMFzd0pGRoPU=', 'VoASSJYILLQ=', 'user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('LiamW', 'WMwCKx3IBslY187xhFgQonZZIYo=', '1Mfnw1Fa1zU=', 'user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('KNash', ' rTDDXNPv3GaS3b4TmfircrNtsus=', 'VeGuTNOp/JE=', 'user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('TBurke', 'Pdx3SpSzfl25hgPzVEiWfo/svvg=', 'OZYmi5fuVRc=', 'user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('MiaLW', 'B6gEXbDUsUrRLQYqjn5ewz8v2P8=', 'L+KG7ize+Wg=', 'user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('MarioK', 'aihJug9Sj1UvMbSBdJa8bnT24Ug=', 'Ys06GgT1QLc=', 'user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('LiamOnTheWing', 'CAgGzECmygunIwBjYeAkLbviETU=', 'pzV2LXUzV6M=', 'user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('Walshed', ' OEhRiEbeSh51MUASw4Dqa2LHTUo=', 's/IozE71yBs=', 'user');





--   INSERT INTO brewery (name, address, city, state, zip, website, phone, about,) VALUES ('', '', '', '', '', '', '', '')


--brewery info. MVT 'Most Valuable Table'.
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Bookhouse Brewing, LLC.', '1526 W 25th St', 'Cleveland', 'Ohio', '44113-3104', 'http://www.bookhouse.beer', '414-426-4555', 'Innovative and approachable beers and ciders served in a cozy, historic taproom. The location originally housed the Jacob and Magdalena Baehr Brewery, founded in 1873. The owners of Bookhouse are in the process of restoring it to its original glory, and the original brick, wallpaper, and tin are visible throughout. Plants, warm lighting, and bookshelf-lined walls create an inviting atmosphere. The menu is always changing and has something for everyone, so stop in and check out the menu!', 'https://images.squarespace-cdn.com/content/v1/59e7b07a8dd04156df25edaf/1584376002697-CZR8WVKWUZ4H94ZLP3NA/_CRU8860.jpg?format=2500w', 'https://static1.squarespace.com/static/59e7b07a8dd04156df25edaf/t/5acd01cd03ce649b2aaa25b4/1651072155783/')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Boss Dog Brewing', '2179 Lee Rd', 'Cleveland', 'Ohio', '44118-2907', 'http://www.bossdogbrewing.com', '216-321-2337', 'A casual brewpub that serves up a variety of delicious fare. While Boss Dog may be a small outfit, they certainly bring a lot to the table. Featuring both a brunch and dinner food menu, as well as an extensive draft list, you are sure to find something you’ll enjoy. They even have a doggie menu for your furry friends! All of Boss Dog’s ingredients are locally sourced, and they offer full tours of their brewing facility, so if food transparency is your jam, this is the place to go.', 'https://scontent.tbdine.com/merchants/boss-dog-brewing/image/11ed5aa5-9244-4b21-bb9e-97b6105412b5.jpg', 'https://bossdogbrewing.com/wp-content/uploads/2017/12/logo.png')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('BottleHouse Brewery', '13368 Madison Ave', 'Lakewood', 'Ohio', '44107-4840', 'http://www.thebottlehousebrewingcompany.com', '216-214-2120', 'A community-oriented brewery and mead hall. BottleHouse’s full-service food menu, board games, live music and more create an environment that’s more than a place to drink. If the drinks are what you’re here for, though, fret not– BottleHouse has won multiple national awards for its ciders and beers, and their meads are a local favorite. For a truly special experience, try their 5 course dinner, each course paired with a curated mead based drink.', 'https://images.squarespace-cdn.com/content/v1/5b809579da02bc5c8fb70073/1535161103511-9P9NU80F6GGCJ0HBGSJ4/Lakewood+taproom.jpg', 'https://images.squarespace-cdn.com/content/v1/5b809579da02bc5c8fb70073/1595173543447-0YMH1K9LZMI9VRX5MGVQ/new+sign.png')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Brick and Barrel', '1844 Columbus Rd', 'Cleveland', 'Ohio', '44113-2412', 'http://www.brickandbarrelbrewing.com', '503-927-0629', 'Brick and Barrel Brewing is committed to creating a beer experience that is unique in the Cleveland area. By design, they’re a small place where you can chat with the head brewer while tasting their brews and touring the facility. Of course, you can also just sit in the tap room and taste whats boiling only a few yards away. B&B also hosts frequent live events– from music, to tastings, to comedy and more. ', 'https://753547.smushcdn.com/1534094/wp-content/uploads/sites/11/2019/06/CityBrewTours_June19-386-1-1024x667.jpg?lossy=0&strip=1&webp=1', 'https://i0.wp.com/ohiocraftbeer.org/wp-content/uploads/2015/12/OCBA_BrickAndBarrel_Resized.jpg?fit=440%2C330&ssl=1')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Butcher and The Brewer', '2043 E 4th St', 'Cleveland', 'Ohio', '44115-1023', 'http://www.butcherandthebrewer.com/', '216-331-0805', 'Butcher and the Brewer encourages interaction and a sense of community through public house seating, progressive dining, and shared plates. The culinary team, which includes an in-house butcher, has created a farmhouse-inspired menu drawing on local ingredients, ethnic flavors, and artisan products. Their brewmaster uses a strong background in science, a formal education in classic brewing techniques, and their custom on-site brewery to brew a range of traditional and innovative beers.', 'https://oldewoodltd.com/uploads/butcher-and-brewer-image.jpg', 'https://i0.wp.com/ohiocraftbeer.org/wp-content/uploads/2015/12/OCBA_ButcherBrewer_Resized.jpg?fit=440%2C330&ssl=1')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Collision Bend Brewing Co', '1250 Old River Rd', 'Cleveland', 'Ohio', '44113-1243', 'http://www.collisionbendbrewery.com', '216-273-7879', 'Collision Bend Brewing Company, named for the narrow and crooked passages along the Cuyahoga River navigated by large commercial ships, is home to crafted artisanal beers and a menu inspired by Cleveland’s melting pot, offering a unique dining experience. Featuring a wood-burning pizza oven, three bars, outdoor seating with amazing riverfront views and a brewer’s room, Collision Bend is an excellent option for a party or family dinner. You can even dock your boat right alongside the patio!', 'https://media2.clevescene.com/clevescene/imager/u/blog/16490665/colision-brewery-collisionbrew-nstagram.jpg', 'https://www.collisionbendbrewery.com/wp-content/uploads/2017/04/collision-bend-logo-b.png')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Fat Heads Brewery & Saloon', '24581 Lorain Rd', 'North Olmsted', 'Ohio', '44070-2170', 'http://www.fatheadscleveland.com', '440-801-1001', 'Serves fresh, award winning beer, smokehouse wings, freshly made headwiches, burgers and stone oven pizza.', 'https://media-cdn.tripadvisor.com/media/photo-s/06/d1/c5/fe/fat-heads-brewery-saloon.jpg', 'https://i0.wp.com/thefullpint.com/wp-content/uploads/2016/12/Fatheads-Logo.jpg')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Forest City Brewery', '2135 Columbus Rd Ste A', 'Cleveland', 'Ohio', '44113-4243', 'http://www.forestcitybrewery.com', '216-228-9116', 'Recently named one of the top outdoor spaces in Cleveland by News Channel 5! Home of "Big Red" the tallest Red Mulberry tree in Ohio and our giant sycamore tree "Sycamore Sid" that dates back to the original space in 1865.', 'https://images.squarespace-cdn.com/content/v1/538c6a0fe4b006c49d7f990e/1594399383295-VI2DXAHSXCMDKEYES2VJ/1300x1300_rental_hall_2020.png?format=1000w', 'http://images.squarespace-cdn.com/content/v1/538c6a0fe4b006c49d7f990e/1567872078609-JAWPEAYNUG5ME6SARKVF/FCB_logo_grunge_2017.png')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Goldhorn Brewery', '1361 E 55th St', 'Cleveland', 'Ohio', '44103-1301', 'https://goldhornbrewery.com/', '216-385-8677', 'Named for the famed mountain goat of Slovenian folklore in homage to our neighborhood roots. With a robust rotating draft list, hearty feel-good food, and private event spaces, we aim to be a community staple for visitors and residents alike.', 'https://images.squarespace-cdn.com/content/v1/5ac3e59b9f87703486ca7ba8/1525211398077-XDDIT96P9XZYHNGZLC5G/DSC_5805+-+edit.jpg?format=1500w', 'http://static1.squarespace.com/static/5ac3e59b9f87703486ca7ba8/t/5ae8f64c562fa7ee3699bbaa/1525216848082/Copy+of+GoldhornBrewery_HorzLogo_NoTagline_Light_.jpg?format=1500w')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Great Lakes Brewing Co', '2516 Market Ave', 'Cleveland', 'Ohio', '44113-3434', 'http://www.greatlakesbrewing.com', '216-771-4404', 'From our dog-friendly tree-lined patio to the cozy beer cellar and lively beer garden, the GLBC brewpub offers a variety of unique drinking and dining experiences.', 'https://cms.nhl.bamgrid.com/images/photos/300779880/1024x576/cut.jpg', 'https://pbs.twimg.com/profile_images/902583110633635842/ZpcGa010_400x400.jpg')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Hansa Brewery', '2717 Lorain Ave', 'Cleveland', 'Ohio', '44113-3414', 'http://www.hansabrewery.com', '216-631-6585', 'We welcome you with open arms and cold beer to Clevelands newest, authentic Eastern European restaurant and brewery. PROST!', 'https://pbs.twimg.com/media/Ee8Fgt6XkAAhSyC?format=jpg&name=large', 'https://pbs.twimg.com/profile_images/794547798729433089/8h1UuBta_400x400.jpg')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Hofbrauhaus Cleveland', '1550 Chester Ave', 'Cleveland', 'Ohio', '44114-3615', 'http://www.hofbrauhauscleveland.com', '216-621-2337', 'Welcome to Hofbräuhaus Cleveland, modeled after the legendary 400+ year-old Hofbräuhaus in Munich, Germany! Guests are now able to enjoy many of the traditions from Germany that have made Hofbräuhaus famous.', 'http://www.gulflive.com/resizer/kU4vmqpAvLH5TKHUUaHWUg1C1Q4=/arc-anglerfish-arc2-prod-advancelocal/public/YVYESMDDANHEHBHZQFP5GDFB5A.JPG', 'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,f_auto,q_auto:eco,dpr_1/w0wqolwq6ojybuda7vyr')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Market Garden Brewery', '1947 W 25th St', 'Cleveland', 'Ohio', '44113-3418', 'http://www.marketgardenbrewery.com', '216-621-4000', 'Market Garden Brewery was founded in 2011 by four friends with a passion for quality, craft beer. Our motto “Beer for People” reflects our mission to bring better beer to all. No pretense, no gimmicks, no hype - just great beer for the world!', 'https://images.squarespace-cdn.com/content/v1/60085e67e344bd2f8788bf07/1622226902405-2WL4EWS76I179GWP3RE9/2021-MGB-Nano-BierM_GW74584.jpg?format=2500w', 'https://d1ynl4hb5mx7r8.cloudfront.net/wp-content/uploads/2019/11/07082338/65592534.mgb-logo-guardianoval-1-b.jpeg')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Masthead Brewing Co', '1261 Superior Ave E', 'Cleveland', 'Ohio', '44114-3204', 'http://www.mastheadbrewingco.com', '419-260-4770', 'Masthead Brewing Company is located in the historic Bryant Building at 1261 Superior Avenue in downtown Cleveland. Our building was originally built in 1921 as an automotive dealership and is now listed on the National Register of Historic Places. The taproom features 300 seats, a 100’ long bar, and an additional 50 seat dog friendly patio with a view of downtown Cleveland.', 'https://media-cdn.tripadvisor.com/media/photo-s/0f/b0/c6/68/masthead-brewing-from.jpg', 'https://utfb-images.untappd.com/DsSCeYBBoReiFu5zAgmiomt9?auto=compress')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Nano Brew Cleveland', '1859 W 25th St', 'Cleveland', 'Ohio', '44113', 'http://www.nanobrewcleveland.com', '216-862-6631', 'Nano Brew Cle is a friendly, bicycle-themed brewpub located in the historic Ohio City neighborhood of Cleveland, Ohio. Designed to celebrate American fare and all American craft beer, we feature 24 beers on draft and a menu of crave-worthy eats that can be enjoyed both at the inside bar and our lively, two-story patio.', 'https://media-cdn.tripadvisor.com/media/photo-s/1c/e2/f2/1b/nano-brew-serves-as-market.jpg', 'https://images.squarespace-cdn.com/content/v1/6008765d46d4c56a53f90675/0a4cd46e-7d36-4efb-8e4b-a7d892c60754/Nano+Circle.+.PNG')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Noble Beast Brewing Co.', '1470 Lakeside Ave E', 'Cleveland', 'Ohio', '44114-1137', 'http://noblebeastbeer.com', '717-585-9216', 'Hi. Were a small and family-owned business run by regular people. Shaun brews a mix of traditional and experimental beers, manages social media, and fixes the plumbing. His wife JoLyn runs operations, HR, and accounting and keeps everything by the book. Chef James creates a farm fresh and seasonal menu with an intensely creative eye that punches well above regular "brewery" food. They couldnt do it without a fantastic staff highlighted by GM Bill, Sous Chef Brittany, and Brewer Erik.', 'https://i0.wp.com/ohiocraftbeer.org/wp-content/uploads/2017/09/NB_Header_2.jpg?fit=800%2C533&ssl=1', 'https://brewcruizer.com/custom/domain_1/image_files/sitemgr_photo_23307.jpg')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Platform Beer Co', '4125 Lorain Ave', 'Cleveland', 'Ohio', '44113-3718', 'http://platformbeer.co', '216-202-1386', 'Platform was founded in 2014 on the premise that collaboration should be at the cornerstone of everything that we do. Whether it be with pro brewers, the home brewing world or a variety of other industries beer is special and should be shared. From humble beginnings brewing on a 3 bbl brewhouse in Cleveland Platform has expanded to a second tasting room in Columbus a production facility in Cleveland a Cincinnati tasting room named LOCOBA and a sour beer facility in Cleveland named Phunkenship.', 'https://ohiomagazine.azureedge.net/sitefinity/images/default-source/articles/2015/2---february-2015/platform-brew_d3_3107.jpg?sfvrsn=479ad138_2', 'https://images.squarespace-cdn.com/content/v1/58e90d0e20099ea6eba14db3/1491668501108-2M8R0ONNAKV7E5DMYNG4/platform-logo.png')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Rivals Sports Grille', '6710 Smith Rd', 'Middleburg Heights', 'Ohio', '44130-2656', 'https://www.rivals-cleveland.com', '216-267-0005', 'For years, Rivals has been a popular spot in the neighborhood for family and friends to enjoy each others company over food and drinks in the comfortable Rivals atmosphere. With a rich history in the Middleburg Heights community, Rivals is a home away from home for many. While Rivals is a part of the past, it is also a part of the future, looking to grow this home away from home for more to enjoy.', 'https://www.cleveland.com/resizer/gqwwyTxGXg0wxpILr1bCqC18wnk=/1280x0/smart/advancelocal-adapter-image-uploads.s3.amazonaws.com/image.cleveland.com/home/cleve-media/width2048/img/ent_impact_home/photo/24255898-standard.jpg', 'https://pbs.twimg.com/profile_images/1059514380931330048/2uBo5Arw_400x400.jpg')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Rocky River Brewing Co', '21290 Center Ridge Rd', 'Rocky River', 'Ohio', '44116-3204', 'http://www.rockyriverbrewco.com', '440-895-2739', 'For more than 20 years, Rocky River Brewing Companys laid-back, family-friendly atmosphere and extensive melt-in-your-mouth menu selections and tantalizing handcrafted brews has been delighting families and friends. The food the beer our friendly and courteous staff, and our patrons all make visiting R.R.B.C. a fantastic and memorable experience. We welcome you to visit the “Brew Co.” with your family and friends to enjoy the the pleasant atmosphere, friendly people, fresh food and great beers.', 'https://images.squarespace-cdn.com/content/v1/56c8e02b2eeb81462d149d14/1485830567676-37FG3FIFLEITKURK6O0R/Rocky_River_Inside_2.JPG?format=2500w', 'https://d2pxm94gkd1wuq.cloudfront.net/BreweryLogos/Standard/8332030.rocky-river-logo-db.jpg')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Saucy Brew Works', '2885 Detroit Ave', 'Cleveland', 'Ohio', '44113-2765', 'http://www.saucybrewworks.com', '216-666-2568', 'At Saucy Brew Works, we don’t just brew beer. Since opening our doors in 2017, we’ve been dedicated to putting our minds and hearts into the process, using the finest ingredients and employing state of the art techniques. The result is a selection of enjoyable, elegant and authentic craft beers.', 'https://www.vocon.com/wp-content/uploads/Saucy-Brew-02_Medium-850x638.jpg', 'https://lh3.googleusercontent.com/XoxfnbYDi3im8gs6zF-lJvqVIR3NIUFmpb5Yrd_jSUe_QoHczLrid4a7jFxkJLal7sTV8r13fLCdbgqPJ1if6xjN330Sjb8=s750')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Sibling Revelry Brewing', '29305 Clemens Rd', 'Westlake', 'Ohio', '44145-1008', 'http://www.siblingrevelrybrewing.com', '440-471-8589', 'Our taproom is where family and friends meet to grab a brew, talk about Cleveland sports and relax after a long day at the office. Unwind at our bar and enjoy a view of our brewhouse, or relive your childhood and play a board game. Weather permitting, enjoy a cold brew on the outdoor patio, perfect for friends and pups alike. For the constantly-connected, we offer free Wi-Fi and USB wall plugs to charge all of your devices.', 'https://www.cleveland.com/resizer/94dSx6QfH-mvYDeSj6_CQl4YLyc=/1280x0/smart/advancelocal-adapter-image-uploads.s3.amazonaws.com/image.cleveland.com/home/cleve-media/width2048/img/ent_impact_home/photo/sibling-revelryjpg-df78e09ca81d394b.jpg', 'https://popmenucloud.com/cdn-cgi/image/width=640,height=640,format=png,fit=scale-down/iweqcdgm/1349e8b9-e37c-4c5f-bae7-22c8a08c3a4e.png')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Southern Tier Brewing Co', '811 Prospect Ave E', 'Cleveland', 'Ohio', '44115-1111', 'https://taprooms.stbcbeer.com/southern-tier-brewery-cleveland-5b6c1b355dcb', '440-484-4045', 'The Southern Tier Brewing Company taproom in Cleveland is a state-of-the-art brewery and taproom, located in downtown Cleveland, OH. The Prospect Avenue venue, our second satellite taproom, is a short walk from Rocket Mortgage FieldHouse and Progressive Field, where we’re pouring fresh Southern Tier beers, serving a full, chef-created, beer-inspired food menu, and offering a selection of Southern Tier favorites to-go (in cans, bottles, and growler/crowler fills).', 'https://media.wkyc.com/assets/WKYC/images/6b7bee50-0c79-4d13-966f-7d2976b912a3/6b7bee50-0c79-4d13-966f-7d2976b912a3_1920x1080.jpg', 'https://utfb-images.untappd.com/zbaGFCj5NFUDW36i1dgXL4QK?auto=compress')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Terrestrial Brewing Company', '7524 Father Frascati Dr', 'Cleveland', 'Ohio', '44102-2087', 'https://terrestrialbrewing.com/', '216-465-9999', 'The brewery is located in the Battery Park neighborhood of Cleveland, Ohio. The tap list has two, mainstay beers, Canopy Crusher IPA and Public Pilsner, while the rest of the taps constantly rotate with new and exciting brews. The Taproom offers a casual vibe and two large patios with epic views of Lake Erie. The Taproom is also 100% dog-friendly and has an adjacent dog park next to us for the dogs to play and meet some friends.', 'https://i0.wp.com/ohiocraftbeer.org/wp-content/uploads/2017/08/Terrestrial.Interior.jpg?fit=800%2C533&ssl=1', 'https://www.porchdrinking.com/wp-content/uploads/2017/09/terrestrial-bc-logo2-680x325.jpg')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('The Cleveland Brewery', '777 E 185th St', 'Cleveland', 'Ohio', '44119-2170', 'https://theclevelandbrewery.com/', '216-534-6992', 'When a space opened up in our neighborhood, and the name was approved, the stars aligned for The Cleveland Brewery to start in October 2014. We initially sold to local restaurants for funding towards our tasting room which opened in 2015. Since then, John has brewed over 50 recipes and keeps the creativity coming. The tasty beer and our Cleveland spirit is why you fall in love with our spot.', 'https://res.cloudinary.com/bandwango/image/upload/c_crop,h_3057,w_4078,x_447,y_0/w_500,f_auto,q_auto/v1/partners/447/venue/38796/i9yey6j9t0irhcsgyksy.png', 'https://www.thisiscleveland.com/thisiscleveland/media/partnerdirectory/13646_30478.jpg?w=1200&h=630&mode=crop')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('The Jolly Scholar', '11111 Euclid Ave', 'Cleveland', 'Ohio', '44106-1715', 'https://theclevelandbrewery.com/', '216-534-6992', 'Located on the campus of Case Western Reserve University, The Jolly Scholar is a unique Cleveland Brewery serving quality food and artisanal craft beer.', 'https://observer.case.edu/wp-content/uploads/2016/02/JollyScholar_11-7_amh181_1MBJPEG_0003-900x600.jpg', 'https://www.thejollyscholar.com/wp-content/uploads/2018/07/Jolly-Scholar-Logo.png')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Working Class Brewery', '17448 Lorain Ave', 'Cleveland', 'Ohio', '44111-4028', 'http://www.workingclassbrewery.com', '216-417-5112', 'Working Class Brewery is a working class guy following a passion and dream to create great fresh local craft beer for hard working people.Located in the Kamm’s Corners area at 17448  Lorain Avenue, Cleveland, Ohio. Working Class Brewery has its own tap room where retail customers may come to view the operation of the brewery, purchase beer by the glass, beer to go, snacks, and retail items such as T-shirts, hats and glassware with our logo printed on them.', 'https://media-cdn.tripadvisor.com/media/photo-s/14/c1/72/5a/inside.jpg', 'https://pbs.twimg.com/profile_images/1130869525094764544/HMeZ9Dr9_400x400.png')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Immigrant Son Brewing', '18120 Sloane Ave', 'Lakewood', 'Ohio', '44107', 'immigrantsonbrewing.com', '216-600-4483', 'Immigrant Son is not just about a place, a thing, or a single person, it is an ongoing tale about ALL of us as one coming to the table to break bread, share the best of ourselves and what we’ve learned along the way while toasting to the road ahead.', 'https://clevelandmagazine.azureedge.net/sitefinity/images/default-source/archive/immigrant-son-brewery-interior.jpg?sfvrsn=6e7ceb8c_1', 'https://media-exp1.licdn.com/dms/image/C4D0BAQHzAYxbiJbYzA/company-logo_200_200/0/1633837847647?e=2147483647&v=beta&t=F3OPZNNfVwxlhE6w69sXX57LaInYQ8dvFhFpUmE6JYg')


INSERT INTO trails (type) VALUES ('Pet Friendly')
INSERT INTO trails (type) VALUES ('Family Friendly')
INSERT INTO trails (type) VALUES ('Budget')
INSERT INTO trails (type) VALUES ('Patio')

INSERT INTO brewery_trails(trail_id, brewery_id) VALUES
(6000,1009), (6000,1010), (6000,1011), (6000,1013),
(6001,1000), (6001,1012), (6001,1014), (6001,1016),
(6002,1003), (6002,1007), (6002,1011), (6002,1023),
(6003,1008), (6003,1015), (6003,1022), (6003,1024)

INSERT INTO trail_user (trail_id, user_id) VALUES
(6000, 3), (6000, 7), (6000, 4),
(6001, 3), (6001, 4), (6001, 5), 
(6002, 5), (6002, 6), (6002, 3), (6002, 7),
(6003, 5), (6003, 6), (6003, 7)

--these are tags the describe breweries
INSERT INTO tag (type) VALUES ('Pet Friendly') --2000
INSERT INTO tag (type) VALUES ('Family Friendly') --2001
INSERT INTO tag (type) VALUES ('Budget') --2002
INSERT INTO tag (type) VALUES ('Patio') --2003


--adding reviews to start with so app isnt empty. Thanks everyone who sent a review!
INSERT INTO review (brewery_id, rating, content) VALUES 
	(1000, 6, 'The place was okay. I think it could have had better food for the price. Great atmosphere though!'), 
	(1010, 10, 'THIS PLACE WAS SO AMAZING WOW'),
	(1013, 8, 'I love the atmosphere and the food, especially the pizza. The cocktail menu is a little limited. In the warm months, the outdoor space is nice, and the long picnic tables make it very easy to hang out with any size groups in any season.'),
	(1007, 7, 'Ive gone to a couple of swing dances at Forest City Brewery. The stage and dance floor are nice, but it is too hot in the summer and too cold in the winter, and the odd split up space is not my favorite. I havent tried the outdoor space, which might swing my rating higher, as I hear it is nice.'),
	(1009, 8, 'I was impressed by the spacious dining area and food options, in addition to the drinks. The parking situation was not ideal, but that didnt take away from the great atmosphere. I would visit again.'),
	(1004, 9, 'My go to spot before all Cavs and Guardians games. A wide variety of beers to choose from and the food is fantastic! I highly recommend the Albino Stout and Fried Chicken Sliders'),
	(1015, 9, 'Great food and drink. Cool industrial vibe inside with an amazing skylight. Has parking next door'),
	(1020, 8, ' Family-friendly and dog-friendly with great beers that are NOT just a long list of IPAs and a fantastic patio!'),
	(1019, 10, 'Amazing pizza and a great beer selection. Huge outdoor area with picnic tables - great spot for big groups!'),
	(1013, 10, 'MY CAPS BUTTON IS BROKEN BUT I LOVED THIS PLACE'),
	(1000, 10, 'This brewery is an absolute hidden gem  the bartender was very nice and helpful. The atmosphere was calm, cozy, and welcoming. The beers were great! I do wish they had food but after all, theyre a brewery not a restaurant  Id highly recommend to anyone! Definitely will be back!'),
	(1000, 8, 'No food except some large soft pretzels and dip. Nice eclectic delicious selection of craft brews. The sampler comes with four for $11. Plenty of quiet ish space to study or enjoy time with friends!'),
	(1001, 5, 'Meh. Ive had good and bad experiences here. Stay away from trivia night. Your food will be overcooked and the ticket times are over an hour. Not pricey. Food is so, so. Service is so, so. The menu changes periodically so what you see today may disappear by next season. Patio is nice'),
	(1001, 2, 'If you have never had Nashville Hot Chicken, you should not sell Nashville Hot Chicken. Why not just say,"Spicy Fried Chicken sandwich with Pickles and Coleslaw"? The sandwich I ordered was not right, it had like Franks Red Hot on it, please dont lie on menus, people will expect what you write.'),
	(1002, 9, 'The staff is so friendly and the beer selection was amazing. They also have mead, which I got to try for the first time. We loved it so much we actually decided to book the place for our wedding!'),
	(1002, 10, 'Large selection of beer and a great food menu. The chicken hoagie and cheese burger are unreal. The staff is friendly and personable. Highly recommend!'),
	(1003, 10, 'Great low-key brewery. Super accommodating, full of entertainment for all ages. IMO Best Baby-Friendly spot in the city.  Carry food in. Big Jenga, cards, pinball, pac man. Single person bathrooms.  Lots of space, usually not busy. Perfect local hangout.'),
	(1003, 10, 'I cant say enough good things about this place. Just far enough off the beaten path to feel like an instant local. The bartender was so welcoming and had some pretty fantastic stories about how this place has come to be. For avid hop-stoppers, this is one of our favorites!'),
	(1003, 7, 'Cool atmosphere with a lot of things to do. There are plenty of table games and areas to hangout within the bar. I wasnt a big fan of the beer I ordered Bitter Chief. The place is always packed when I drive by so they must be doing something right'),
	(1004, 10, 'Beer was great. Food was fantastic and Jake, Brittany, and Zak are awesome bartenders. We went there everyday we were in Cleveland. We also took some beer home to Virginia with us. Highly recommend.'),
	(1004, 8, 'I only went in for a quick drink with a friend, but it was great. Friendly staff, nice ambiance.'),
	(1004, 10, 'Weve been to Butcher and the Brewer several times, and never had a bad experience. The staff is awesome...They have a great beer selection, and the food is amazing! I highly recomme'),
	(1005, 10, 'The view was great to have during a meal. Kids pizza: average, kids max n cheese great. The Bruschetta pizza I would have skipped & had the mac n cheese instead. We also had the L.E.O Omelette which was enjoyable.'),
	(1005, 5, 'Great Date Night at collisionbrew - shishito peppers with fried pork belly, queso fundito with chorizo and some blackened Shrimp tacos.   Everything was on point.   Love this view and great food.'),
	(1006, 6, ' just didnt feel the love here at all.  Bartenders seemed distracted although it wasnt that busy at all.  Food and Beer was OK!  Im thinking they were going to be off in a few hours so they could spend time with family for the Independence Day Holiday.  In any event prolly wouldnt return!'),
	(1006, 10, 'The power went out while we were there. The staff was super friendly and accommodating. The food and beer was delicious! The view from the patio was nice. I would absolutely recommend this place. I want to go back!'),
	(1007, 10, 'First time at forest city brewery after having some mead around the corner. Such a cute hidden brewery. We tried the pierogis and the pretzel and a few beers and everything was delicious! Cant wait to come back when they have a live band or event going on on their huge stage!'),
	(1007, 10, 'We visited from out of town. Great food, great atmosphere. Would go again next time in tow'),
	(1007, 9, 'Excellent beer and great atmosphere! This is the place to hear live music in Cleveland. And now they have a new chef and food and its delicious. Cant say enough good things about this westside gem.'),
	(1007, 9, 'Ive always appreciated this place and their beer selections...i appreciate them even more because of how seriously theyre taking the safety of their team and customers.'),
	(1008, 10, 'Loved this brewery!  The food, beer and service were perfect.  Looking forward to returning to this brewery.'),
	(1008, 7, 'We have been here 15 times at least since it is close to us. The food can be absolutely amazing, but I would not recommend the chicken. The beer selection is okay, but they will typically have only 7-8 beers on tap. The service is always amazing and the music and atmosphere is great'),
	(1009, 8, 'We sat at the downstairs bar that resembles a man cave.  The service is great, and they have a nice variety of drafts. I have not tried their menu, but maybe next time.'),
	(1009, 10, 'Came in for a late night dinner , service was speedy and drinks where good. Would recommend if in the area'),
	(1010, 10, 'Was in from out of town and had happened upon Hansa after stopping elsewhere a few blocks over. Good service and a great beer selection. The potato pancakes were fantastic!'),
	(1010, 9, 'If you want good food, great beer and good service go to Hansa. We really enjoy the owner who makes you feel like your at his home. Support local.'),
	(1011, 8, 'The Hofbrauhaus is a German restaurant that has an amazing atmosphere with a terrific feeling of livelihood that can be felt by all attendees. The food was good but did not blow my mind. However, I loved the drinks and the amount of fun I had with friends here.'),
	(1011, 10, 'Ive been here twice and would love to say yes again if have a chance to. Very delicious food and a lot of fun atmosphere.'),
	(1011, 3, 'We took our families for a midday dinner. Our server was fantastic until she wasnt. We spent over 700 dollars and left almost 400 in tips. They apparently needed our table and requested we leave. I have never been asked to leave a location that we reserved and paid for ever in my life.'),
	(1012, 9, 'Service was great! Beer was fine. Particularly enjoyed the shandy. Sweet and refreshing! The smash burger and the chicken sandwich were perfect mid afternoon snack portions. Really hit the spot!'),
	(1012, 7, 'Decided to stop in as it was recommended by some locals. We sat at the bar and saw their signs for decent beer selection. However,  several of the ones we wanted to try were tapped.'),
	(1013, 9, 'Ohh where oh where has the jalapeño ale gone - ohh where ohh where can it be??? Their beers are great - but the currently missing Jalapeño ale is Sorely missed.'),
	(1013, 10, 'Delicious pizza and beer! Love the atmosphere and the service was great. 2 seats at the bar made for a great start to a Saturday date night.'),
	(1014, 9, 'Although the Thursday night trivia is Last Call (hard questions, not as fun as organic or list based trivia), the Brussels sprouts are the best Ive ever had! Theyre super greasy, crispy, and sweet with the maple glaze. Large beer selection. Friendly servers'),
	(1014, 10, 'Get the dang philly chicken Mac bites. Sweet lord my hung over self needed these. The Mac and cheese tastes gourmet, high quality bite. Beers I tried were good too. Not sure why reviews are low - I loved it! Great experience. Fantastic patio. Friendly service.'),
	(1015, 10, 'My husband and I loved this place! Local brewery. Food was amazing. I had the veggie sandwich.  Amazing. Husband had the chicken sandwich. It was also amazing. Beer was fantastic. Service was awesome. We will be back'),
	(1015, 8, 'Nachos were good and beer was very good. Stopped by here on a little brewery tour through Cleveland!!'),
	(1016, 10, 'Great atmosphere and even better beer. Love their collection of sours as well as IPAs. Hard to go wrong with any choice.'),
	(1016, 10, 'If you love experimental brews, this is the place for you. They have a ton of options, youll struggle to put a dent in the list. We got to try soo many fun beers and they were all delicious!'),
	(1017, 10, 'The best hamburgers and onion rings ever. Service is great. And patio is fantastic.  I am so glad they are close to me'),
	(1017, 9, 'Great brews and even better food ! Will definitely return and recommend to everyone ! Our server was phenomenal ! Its rare to find that level of service !'),
	(1018, 10, 'outstanding patio bar with plenty of seating. smoked tofu as a protein option. bartender george brings the energy and always makes it a fun experience. tofu mac and cheese is delicious. great fries. tofu tacos also.'),
	(1018, 8, 'Good beer. Really yummy salad. Service was great and quick, even on a busy night. Will definitely go back.'),
	(1019, 8, 'Good service. Nice ambiance. Easy street parking. Well rounded draft menu. Hidden hangout spot around the corner with picnic tables and beach volleyball area.'),
	(1019, 2, 'I waited 1hour and 15 minutes for mid pizza that looked like it was dropped the pizza tasted like it was made in the microwave and the room was cold BAD TIMES'),
	(1019, 10, 'Amazing.  Great atmosphere great unique menu.  The Mac and cheese was amazing. The saucy (meat)balls were soooo good and their pizza is to die for. Cant wait to try more on the menu'),
	(1020, 2, 'Turned into a daycare with all these crotch goblins running around. What happened to 21 and over? Their beer has also gone down hill.'),
	(1020, 8, 'Outdoor patio is great! Brought the kids along and had a blast. Good kids menu, beer is average but will be back!'),
	(1021, 8, 'First time visiting. Tried a pizza that was recommended by the server and it was just okay. Also tried some hard seltzers that were very good. Server was great and let me sample before purchasing. 5 and 14 ounce pours.'),
	(1021, 10, 'Great location right downtown and excellent selection. What I appreciate about this brewery is that they offer a lot of selections from other breweries around the country. They also have a large selection of their own beers brewed on the premises.'),
	(1022, 10, 'Great beer and even better food! Everything I tried there was delicious and thoughtfully prepared. A lot of times brewery food is mediocre but in the case of Terrestrial- this is where they really shine'),
	(1022, 8, 'Moderate number of pretty delicious brews to choose from. My flight of four was about $14 for four half pours. No food available yet which is a big bummer.'),
	(1023, 10, 'A great atmosphere with employees who really know their stuff! A must visit in Cleveland for IPA lovers'),
	(1023, 9, 'Great local brewery with a cozy atmosphere.  The selection isnt the biggest, but the beers are unique.'),
	(1024, 10, 'Amazing bar comfort food and freshly brewed beer thatll take you straight back to the good old college days'),
	(1024, 5, 'I waited 15 minutes after I ordered to get my lemonade and 45 minutes for a whiskey sour. The fries were terrible, the fish sandwich was average, but the chili was very good.'),
	(1025, 9, 'I had the Wing walker which I Loved, and My husband Loved the Chocolate Stout. Great atmosphere! The Bartender Faith was really helpful and knowledgeable about the Beers! We will definitely go back.'),
	(1025, 10, 'All 5 stars are for the peanut butter stout. It is amazing. Ive regularly gotten growler fills to get through quarantine. Not the cheapest growler fills in town, but that stout is worth it!'),
	(1026, 10, 'Really excellent experience. Great food the smoked Pork chop is incredible, longish and giant pierogi also winners! Ipa was fresh and very competent and tasty.'),
	(1026, 6, 'Stopped here with a group and the atmosphere was nice but the food was mediocre at best. The beer selection was great but nothing hit my fancy. Service was great. May try again in a non group setting.')

	
	--assigning reviews to useres
	INSERT INTO user_review (user_id, review_id) VALUES (1, 3000);
	INSERT INTO user_review (user_id, review_id) VALUES (3, 3001);
	INSERT INTO user_review (user_id, review_id) VALUES (4, 3002);
	INSERT INTO user_review (user_id, review_id) VALUES (5, 3003);
	INSERT INTO user_review (user_id, review_id) VALUES (5, 3004);
	INSERT INTO user_review (user_id, review_id) VALUES (5, 3005);
	INSERT INTO user_review (user_id, review_id) VALUES (6, 3006);
	INSERT INTO user_review (user_id, review_id) VALUES (7, 3007);
	INSERT INTO user_review (user_id, review_id) VALUES (7, 3008);
	INSERT INTO user_review (user_id, review_id) VALUES (7, 3009);
	INSERT INTO user_review (user_id, review_id) VALUES (13, 3010);
	INSERT INTO user_review (user_id, review_id) VALUES (13, 3011);
	INSERT INTO user_review (user_id, review_id) VALUES (3, 3012);
	INSERT INTO user_review (user_id, review_id) VALUES (4, 3013);
	INSERT INTO user_review (user_id, review_id) VALUES (5, 3014);
	INSERT INTO user_review (user_id, review_id) VALUES (6, 3015);
	INSERT INTO user_review (user_id, review_id) VALUES (7, 3016);
	INSERT INTO user_review (user_id, review_id) VALUES (8, 3017);
	INSERT INTO user_review (user_id, review_id) VALUES (9, 3018);
	INSERT INTO user_review (user_id, review_id) VALUES (10, 3019);
	INSERT INTO user_review (user_id, review_id) VALUES (11, 3020);
	INSERT INTO user_review (user_id, review_id) VALUES (12, 3021);
	INSERT INTO user_review (user_id, review_id) VALUES (13, 3022);
	INSERT INTO user_review (user_id, review_id) VALUES (14, 3023);
	INSERT INTO user_review (user_id, review_id) VALUES (15, 3024);
	INSERT INTO user_review (user_id, review_id) VALUES (16, 3025);
	INSERT INTO user_review (user_id, review_id) VALUES (17, 3026);
	INSERT INTO user_review (user_id, review_id) VALUES (18, 3027);
	INSERT INTO user_review (user_id, review_id) VALUES (19, 3028);
	INSERT INTO user_review (user_id, review_id) VALUES (13, 3029);
	INSERT INTO user_review (user_id, review_id) VALUES (13, 3030);
	INSERT INTO user_review (user_id, review_id) VALUES (3, 3031);
	INSERT INTO user_review (user_id, review_id) VALUES (4, 3032);
	INSERT INTO user_review (user_id, review_id) VALUES (5, 3033);
	INSERT INTO user_review (user_id, review_id) VALUES (6, 3034);
	INSERT INTO user_review (user_id, review_id) VALUES (7, 3035);
	INSERT INTO user_review (user_id, review_id) VALUES (8, 3036);
	INSERT INTO user_review (user_id, review_id) VALUES (9, 3037);
	INSERT INTO user_review (user_id, review_id) VALUES (10, 3038);
	INSERT INTO user_review (user_id, review_id) VALUES (11, 3039);
	INSERT INTO user_review (user_id, review_id) VALUES (12, 3040);
	INSERT INTO user_review (user_id, review_id) VALUES (13, 3041);
	INSERT INTO user_review (user_id, review_id) VALUES (14, 3042);
	INSERT INTO user_review (user_id, review_id) VALUES (15, 3043);
	INSERT INTO user_review (user_id, review_id) VALUES (16, 3044);
	INSERT INTO user_review (user_id, review_id) VALUES (17, 3045);
	INSERT INTO user_review (user_id, review_id) VALUES (18, 3046);
	INSERT INTO user_review (user_id, review_id) VALUES (19, 3047);
	INSERT INTO user_review (user_id, review_id) VALUES (3, 3048);
	INSERT INTO user_review (user_id, review_id) VALUES (4, 3049);
	INSERT INTO user_review (user_id, review_id) VALUES (5, 3050);
	INSERT INTO user_review (user_id, review_id) VALUES (6, 3051);
	INSERT INTO user_review (user_id, review_id) VALUES (7, 3052);
	INSERT INTO user_review (user_id, review_id) VALUES (8, 3053);
	INSERT INTO user_review (user_id, review_id) VALUES (9, 3054);
	INSERT INTO user_review (user_id, review_id) VALUES (10, 3055);
	INSERT INTO user_review (user_id, review_id) VALUES (11, 3056);
	INSERT INTO user_review (user_id, review_id) VALUES (12, 3057);
	INSERT INTO user_review (user_id, review_id) VALUES (13, 3058);
	INSERT INTO user_review (user_id, review_id) VALUES (14, 3059);
	INSERT INTO user_review (user_id, review_id) VALUES (15, 3060);
	INSERT INTO user_review (user_id, review_id) VALUES (16, 3061);
	INSERT INTO user_review (user_id, review_id) VALUES (17, 3062);
	INSERT INTO user_review (user_id, review_id) VALUES (18, 3063);
	INSERT INTO user_review (user_id, review_id) VALUES (19, 3064);
	INSERT INTO user_review (user_id, review_id) VALUES (3, 3065);
	INSERT INTO user_review (user_id, review_id) VALUES (4, 3066);
	INSERT INTO user_review (user_id, review_id) VALUES (5, 3067);
	INSERT INTO user_review (user_id, review_id) VALUES (6, 3068);
	INSERT INTO user_review (user_id, review_id) VALUES (7, 3069);

--assigning tags to brweries
INSERT INTO brewery_tag (tag_id, brewery_id) VALUES
	(2000, 1001),
	(2001, 1001),
	(2003, 1001),
	(2000, 1002),
	(2001, 1002),
	(2003, 1002),
	(2001, 1003),
	(2002, 1003),
	(2000, 1004),
	(2001, 1004),
	(2003, 1004),
	(2001, 1005),
	(2003, 1005),
	(2000, 1006),
	(2001, 1006),
	(2002, 1006),
	(2003, 1006),
	(2000, 1007),
	(2001, 1007),
	(2002, 1007),
	(2003, 1007),
	(2000, 1008),
	(2001, 1008),
	(2003, 1008),
	(2002, 1008),
	(2000, 1009),
	(2003, 1009),
	(2000, 1010),
	(2002, 1010),
	(2000, 1011),
	(2001, 1011),
	(2003, 1011),
	(2002, 1011),
	(2001, 1012),
	(2000, 1013),
	(2003, 1013),
	(2001, 1014),
	(2003, 1014),
	(2003, 1015),
	(2000, 1016),
	(2001, 1016),
	(2003, 1016),
	(2003, 1017),
	(2002, 1017),
	(2001, 1018),
	(2003, 1018),
	(2002, 1019),
	(2001, 1020),
	(2003, 1020),
	(2000, 1021),
	(2003, 1021),
	(2001, 1022),
	(2002, 1023),
	(2003, 1024),
	(2000, 1025),
	(2003, 1026)



	--INSERT INTO beer_list (beer_name, type, abv) VALUES ('', '',)   <-- inserting beer template

	--big beer list!
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Deep Diver Volume 1', 'Double IPA',7.8)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Tmavé Pivo', 'Dark Lager',4.25)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Blatant Pandering', 'Traditional Bock',5.4)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Apple Forward', 'Dry Cider',5.8)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Punch Out', 'Double Hazy Juicy IPA',8.2)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Holy Toledo', 'German Pilsner',5.4)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Dog Pound Brown', 'American Brown Ale',5.8)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Gimme SMore', 'Porter ',6.0)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Locktender ', 'Imperial Stout',9.0)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Community', 'Pilsner',5.0)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Orange Blossom Special', 'Honey-Fermented IPA',8.4)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Zero Mile', 'Smoked Lager',4.8)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Bridge is Up', 'American Wheat',6.3)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Bitter Chief', 'IPA',7.8)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Buckeye Breakaway', 'Pale Ale',5.4)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Futile to Resist', 'Fruit Sour',6.1)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Faustian Exchange', 'Helles Bock',7.0)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Slim Shandy', 'Lemon Shandy',4.1)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Farmers Daughter', 'Rye Saison',6.3)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Keep On Keepin On', 'Session IPA',4.8)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Square One', 'Session IPA',5.0)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('C-Town', 'American IPA',6.7)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Imperial Sunset', 'American Pale Wheat',8.6)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Bollard Pull', 'American Porter',6.6)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Bumble Berry', 'Honey Blueberry Ale',5.3)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Goggle Fogger', 'Hefeweizen',5.4)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Old World', ' Alt Bier',4.9)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Headhunter', 'IPA',7.5)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Forest City Chocolate Milk', 'Milk Stout',5.4)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Let it Rye', 'IPA',6.6)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('One Arm Daily', 'Cream Ale',5.3)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Verano Oscuro', 'Mexican Lager',5.7)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Polka City', 'Pilsner',5.4)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Moment of Inertia', 'Belgian Blonde',6.3)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Long Blink', 'Session IPA',4.0)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Dead Mans Curve', 'American IPA',8.0)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Commodore Perry', 'IPA',7.7)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Joe Thomas 73', 'Kolsch',5.7)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Great Lakes IPA', 'American IPA ',6.5)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Eliot Ness', 'Amber Lager',6.1)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Mr. MeeSeeks', 'Blueberry Gose',4.6)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Farmers Only', 'Saison',5.0)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Bye Felicia', 'Nut Brown Ale',5.2)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Black Flag', 'Schwarzbier',4.7)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('The Original Lager', 'Bavarian Lager',5.2)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Hefe Weizen', 'Wheat Ale',5.3)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Dunkel', 'Dark Lager',5.5)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Light Lager', 'American Light Lager',3.8)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Progress Pilsner', ' Pilsner',5.5)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Prosperity Wheat', 'Hefeweizen',6.0)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('CitraMax IPA', 'IPA',7.4)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Nano OG Lager', 'Lager',4.3)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Vanilla Underverse', 'Imperial Stout',13.4)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Double Barrel Old Timey', 'Barleywine',14.4)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Phantasmal Bliss', ' IPA',8.0)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Oni Giri', 'Lager',4.5)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Nano Lager Life', ' Lager',4.5)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Butcher & The Brewer Albino Stout', 'Stout',5.4)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Shacksbury Rose Cider', 'Cider',5.5)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Urban Artifact Keypunch', 'Gose',4.3)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Evil Motives IPA', 'IPA',7.2)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Rose Apothecary', 'Fruit Beer',5.0)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Dearly Departed Black IPA', 'IPA',6.8)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Tropic Blond', 'Blond',5.1)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Nomu', 'Lager',4.2)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Blackberry Krush', 'Sour',6.0)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Odd Future', 'IPA',8.6)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Hyper Retro', 'Farmhouse Ale',4.3)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Red White and Blueberry Cider', 'Cider',5.5)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('White Rajah', 'IPA',6.8)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Summer Shandy', 'Shandy',4.2)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('DreamWeaver Wheat', 'Wheat',4.8)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Hop Goblin IPA', 'IPA',7.6)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Oompa Loompa', 'Stout',5.7)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Rocky River Pirate Light', 'Blonde',4.8)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Cooper’s Gold Kolsch', 'German',6.0)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Juicy Asap', 'IPA',6.5)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Love You Bye', 'IPA',8.0)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('El Lager', 'Lager',4.3)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('White Light', 'White Ale',3.2)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Taco Party', 'Pilsner',5.0)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Coffee Red', 'Red Ale',5.5)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Third Wheel', 'Belgian',9.2)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Olly Olly', 'Pale Ale',5.0)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('8 Days a Week', 'Blonde Ale',4.8)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Legacy Lager', 'Lager',4.7)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('The Changer', 'IPA',7.0)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('3 Citrus Peel Out', 'Wheat',8.5)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Swill', 'Lager',5.8)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Star Party V2', 'IPA',7.0)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Bikini Bottom Porter', 'Porter',6.6)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Canopy Crusher', 'IPA',6.6)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Muellerfest', 'Lager',5.4)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Buzz Beer', 'Stout',7.8)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('185th St. Wheat', 'Wheat',5.4)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Lakeview Cemetery', 'Pumpkin',7.5)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Cold Beer Here!', 'Lager',5.1)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Strawberry Banana Bag', 'Fruit',5.5)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Academic Burnout', 'IPA',5.2)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Jolly Dry Stout', 'Stout',4.2)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Ploughman’s Pilsner', 'Pilsner',5.0)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Pit Boss', 'Pale Ale',6.0)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Gunselman’s Kolsch', 'German',5.3)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Hooligan Irish Stout', 'Stout',5.0)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Sunshine On Our Faces', 'Sour',3.6)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Worthy Wit', 'Wheat',5.5)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Caviator Doppelback', 'Bock',7.5)
	INSERT INTO beer_list (beer_name, type, abv) VALUES ('Sloane Shandy', 'Shandy',5.5)


	--assigning beer to brewries!
	INSERT INTO beer_brewery (brewery_id, beer_id)
	VALUES
	(1000, 5000), (1000, 5001), (1000, 5002), (1000, 5003),
	(1001, 5004), (1001, 5005), (1001, 5006), (1001, 5007),
	(1002, 5008), (1002, 5009), (1002, 5010), (1002, 5011),
	(1003, 5012), (1003, 5013), (1003, 5014), (1003, 5015),
	(1004, 5016), (1004, 5017), (1004, 5018), (1004, 5019),
	(1005, 5020), (1005, 5021), (1005, 5022), (1005, 5023),
	(1006, 5024), (1006, 5025), (1006, 5026), (1006, 5027),
	(1007, 5028), (1007, 5029), (1007, 5030), (1007, 5031),
	(1008, 5032), (1008, 5033), (1008, 5034), (1008, 5035),
	(1009, 5036), (1009, 5037), (1009, 5038), (1009, 5039),
	(1010, 5040), (1010, 5041), (1010, 5042), (1010, 5043),
	(1011, 5044), (1011, 5045), (1011, 5046), (1011, 5047),
	(1012, 5048), (1012, 5049), (1012, 5050), (1012, 5051),
	(1013, 5052), (1013, 5053), (1013, 5054), (1013, 5055),
	(1014, 5056), (1014, 5057), (1014, 5058), (1014, 5059),
	(1015, 5060), (1015, 5061), (1015, 5062), (1015, 5063),
	(1016, 5064), (1016, 5065), (1016, 5066), (1016, 5067),
	(1017, 5068), (1017, 5069), (1017, 5070), (1017, 5071),
	(1018, 5072), (1018, 5073), (1018, 5074), (1018, 5075),
	(1019, 5076), (1019, 5077), (1019, 5078), (1019, 5079),
	(1020, 5080), (1020, 5081), (1020, 5082), (1020, 5083),
	(1021, 5084), (1021, 5085), (1021, 5086), (1021, 5087),
	(1022, 5088), (1022, 5089), (1022, 5090), (1022, 5091),
	(1023, 5092), (1023, 5093), (1023, 5094), (1023, 5095),
	(1024, 5096), (1024, 5097), (1024, 5098), (1024, 5099),
	(1025, 5100), (1025, 5101), (1025, 5102), (1025, 5103),
	(1026, 5104), (1026, 5105), (1026, 5106), (1026, 5107)

	COMMIT
	

	/* regularly used queries:

	SELECT * FROM brewery
	select * from users
	select * from review
	select * from beer_list
	select name, id from brewery
	select * from beer_brewery
	select * from trails
	select * from trail_user
	*/
	