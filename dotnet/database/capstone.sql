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
	content varchar (500) NOT NULL
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



--populate default data
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('JoeyLitten','axZvUV/AMhRxhtl9Sc5Krg8/HII=','5a+ULxS8xUw=','user');

--   INSERT INTO brewery (name, address, city, state, zip, website, phone, about,) VALUES ('', '', '', '', '', '', '', '')


--brewery info. MVT 'Most Valuable Table'.
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Bookhouse Brewing, LLC.', '1526 W 25th St', 'Cleveland', 'Ohio', '44113-3104', 'http://www.bookhouse.beer', '4144264555', 'Innovative and approachable beers and ciders served in a cozy, historic taproom. The location originally housed the Jacob and Magdalena Baehr Brewery, founded in 1873. The owners of Bookhouse are in the process of restoring it to its original glory, and the original brick, wallpaper, and tin are visible throughout. Plants, warm lighting, and bookshelf-lined walls create an inviting atmosphere. The menu is always changing and has something for everyone, so stop in and check out the menu!', 'https://images.squarespace-cdn.com/content/v1/59e7b07a8dd04156df25edaf/1584376002697-CZR8WVKWUZ4H94ZLP3NA/_CRU8860.jpg?format=2500w', 'https://static1.squarespace.com/static/59e7b07a8dd04156df25edaf/t/5acd01cd03ce649b2aaa25b4/1651072155783/')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Boss Dog Brewing', '2179 Lee Rd', 'Cleveland', 'Ohio', '44118-2907', 'http://www.bossdogbrewing.com', '2163212337', 'A casual brewpub that serves up a variety of delicious fare. While Boss Dog may be a small outfit, they certainly bring a lot to the table. Featuring both a brunch and dinner food menu, as well as an extensive draft list, you are sure to find something you’ll enjoy. They even have a doggie menu for your furry friends! All of Boss Dog’s ingredients are locally sourced, and they offer full tours of their brewing facility, so if food transparency is your jam, this is the place to go.', 'https://scontent.tbdine.com/merchants/boss-dog-brewing/image/11ed5aa5-9244-4b21-bb9e-97b6105412b5.jpg', 'https://bossdogbrewing.com/wp-content/uploads/2017/12/logo.png')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('BottleHouse Brewery', '13368 Madison Ave', 'Lakewood', 'Ohio', '44107-4840', 'http://www.thebottlehousebrewingcompany.com', '2162142120', 'A community-oriented brewery and mead hall. BottleHouse’s full-service food menu, board games, live music and more create an environment that’s more than a place to drink. If the drinks are what you’re here for, though, fret not– BottleHouse has won multiple national awards for its ciders and beers, and their meads are a local favorite. For a truly special experience, try their 5 course dinner, each course paired with a curated mead based drink.', 'https://images.squarespace-cdn.com/content/v1/5b809579da02bc5c8fb70073/1535161103511-9P9NU80F6GGCJ0HBGSJ4/Lakewood+taproom.jpg', 'https://images.squarespace-cdn.com/content/v1/5b809579da02bc5c8fb70073/1595173543447-0YMH1K9LZMI9VRX5MGVQ/new+sign.png')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Brick and Barrel', '1844 Columbus Rd', 'Cleveland', 'Ohio', '44113-2412', 'http://www.brickandbarrelbrewing.com', '5039270629', 'Brick and Barrel Brewing is committed to creating a beer experience that is unique in the Cleveland area. By design, they’re a small place where you can chat with the head brewer while tasting their brews and touring the facility. Of course, you can also just sit in the tap room and taste whats boiling only a few yards away. B&B also hosts frequent live events– from music, to tastings, to comedy and more. ', 'https://753547.smushcdn.com/1534094/wp-content/uploads/sites/11/2019/06/CityBrewTours_June19-386-1-1024x667.jpg?lossy=0&strip=1&webp=1', 'https://i0.wp.com/ohiocraftbeer.org/wp-content/uploads/2015/12/OCBA_BrickAndBarrel_Resized.jpg?fit=440%2C330&ssl=1')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Butcher and The Brewer', '2043 E 4th St', 'Cleveland', 'Ohio', '44115-1023', 'http://www.butcherandthebrewer.com/', '216-331-0805', 'Butcher and the Brewer encourages interaction and a sense of community through public house seating, progressive dining, and shared plates. The culinary team, which includes an in-house butcher, has created a farmhouse-inspired menu drawing on local ingredients, ethnic flavors, and artisan products. Their brewmaster uses a strong background in science, a formal education in classic brewing techniques, and their custom on-site brewery to brew a range of traditional and innovative beers.', 'https://oldewoodltd.com/uploads/butcher-and-brewer-image.jpg', 'https://i0.wp.com/ohiocraftbeer.org/wp-content/uploads/2015/12/OCBA_ButcherBrewer_Resized.jpg?fit=440%2C330&ssl=1')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Collision Bend Brewing Co', '1250 Old River Rd', 'Cleveland', 'Ohio', '44113-1243', 'http://www.collisionbendbrewery.com', '2162737879', 'Collision Bend Brewing Company, named for the narrow and crooked passages along the Cuyahoga River navigated by large commercial ships, is home to crafted artisanal beers and a menu inspired by Cleveland’s melting pot, offering a unique dining experience. Featuring a wood-burning pizza oven, three bars, outdoor seating with amazing riverfront views and a brewer’s room, Collision Bend is an excellent option for a party or family dinner. You can even dock your boat right alongside the patio!', 'https://media2.clevescene.com/clevescene/imager/u/blog/16490665/colision-brewery-collisionbrew-nstagram.jpg', 'https://www.collisionbendbrewery.com/wp-content/uploads/2017/04/collision-bend-logo-b.png')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Fat Heads Brewery & Saloon', '24581 Lorain Rd', 'North Olmsted', 'Ohio', '44070-2170', 'http://www.fatheadscleveland.com', '4408011001', 'Serves fresh, award winning beer, smokehouse wings, freshly made headwiches, burgers and stone oven pizza.', 'https://media-cdn.tripadvisor.com/media/photo-s/06/d1/c5/fe/fat-heads-brewery-saloon.jpg', 'https://i0.wp.com/thefullpint.com/wp-content/uploads/2016/12/Fatheads-Logo.jpg')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Forest City Brewery', '2135 Columbus Rd Ste A', 'Cleveland', 'Ohio', '44113-4243', 'http://www.forestcitybrewery.com', '2162289116', 'Recently named one of the top outdoor spaces in Cleveland by News Channel 5! Home of "Big Red" the tallest Red Mulberry tree in Ohio and our giant sycamore tree "Sycamore Sid" that dates back to the original space in 1865.', 'https://images.squarespace-cdn.com/content/v1/538c6a0fe4b006c49d7f990e/1594399383295-VI2DXAHSXCMDKEYES2VJ/1300x1300_rental_hall_2020.png?format=1000w', 'http://images.squarespace-cdn.com/content/v1/538c6a0fe4b006c49d7f990e/1567872078609-JAWPEAYNUG5ME6SARKVF/FCB_logo_grunge_2017.png')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Goldhorn Brewery', '1361 E 55th St', 'Cleveland', 'Ohio', '44103-1301', 'https://goldhornbrewery.com/', '2163858677', 'Named for the famed mountain goat of Slovenian folklore in homage to our neighborhood roots. With a robust rotating draft list, hearty feel-good food, and private event spaces, we aim to be a community staple for visitors and residents alike.', 'https://images.squarespace-cdn.com/content/v1/5ac3e59b9f87703486ca7ba8/1525211398077-XDDIT96P9XZYHNGZLC5G/DSC_5805+-+edit.jpg?format=1500w', 'http://static1.squarespace.com/static/5ac3e59b9f87703486ca7ba8/t/5ae8f64c562fa7ee3699bbaa/1525216848082/Copy+of+GoldhornBrewery_HorzLogo_NoTagline_Light_.jpg?format=1500w')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Great Lakes Brewing Co', '2516 Market Ave', 'Cleveland', 'Ohio', '44113-3434', 'http://www.greatlakesbrewing.com', '2167714404', 'From our dog-friendly tree-lined patio to the cozy beer cellar and lively beer garden, the GLBC brewpub offers a variety of unique drinking and dining experiences.', 'https://cms.nhl.bamgrid.com/images/photos/300779880/1024x576/cut.jpg', 'https://pbs.twimg.com/profile_images/902583110633635842/ZpcGa010_400x400.jpg')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Hansa Brewery', '2717 Lorain Ave', 'Cleveland', 'Ohio', '44113-3414', 'http://www.hansabrewery.com', '2166316585', 'We welcome you with open arms and cold beer to Clevelands newest, authentic Eastern European restaurant and brewery. PROST!', 'https://pbs.twimg.com/media/Ee8Fgt6XkAAhSyC?format=jpg&name=large', 'https://pbs.twimg.com/profile_images/794547798729433089/8h1UuBta_400x400.jpg')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Hofbrauhaus Cleveland', '1550 Chester Ave', 'Cleveland', 'Ohio', '44114-3615', 'http://www.hofbrauhauscleveland.com', '2166212337', 'Welcome to Hofbräuhaus Cleveland, modeled after the legendary 400+ year-old Hofbräuhaus in Munich, Germany! Guests are now able to enjoy many of the traditions from Germany that have made Hofbräuhaus famous.', 'http://www.gulflive.com/resizer/kU4vmqpAvLH5TKHUUaHWUg1C1Q4=/arc-anglerfish-arc2-prod-advancelocal/public/YVYESMDDANHEHBHZQFP5GDFB5A.JPG', 'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,f_auto,q_auto:eco,dpr_1/w0wqolwq6ojybuda7vyr')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Market Garden Brewery', '1947 W 25th St', 'Cleveland', 'Ohio', '44113-3418', 'http://www.marketgardenbrewery.com', '2166214000', 'Market Garden Brewery was founded in 2011 by four friends with a passion for quality, craft beer. Our motto “Beer for People” reflects our mission to bring better beer to all. No pretense, no gimmicks, no hype - just great beer for the world!', 'https://images.squarespace-cdn.com/content/v1/60085e67e344bd2f8788bf07/1622226902405-2WL4EWS76I179GWP3RE9/2021-MGB-Nano-BierM_GW74584.jpg?format=2500w', 'https://d1ynl4hb5mx7r8.cloudfront.net/wp-content/uploads/2019/11/07082338/65592534.mgb-logo-guardianoval-1-b.jpeg')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Masthead Brewing Co', '1261 Superior Ave E', 'Cleveland', 'Ohio', '44114-3204', 'http://www.mastheadbrewingco.com', '4192604770', 'Masthead Brewing Company is located in the historic Bryant Building at 1261 Superior Avenue in downtown Cleveland. Our building was originally built in 1921 as an automotive dealership and is now listed on the National Register of Historic Places. The taproom features 300 seats, a 100’ long bar, and an additional 50 seat dog friendly patio with a view of downtown Cleveland.', 'https://media-cdn.tripadvisor.com/media/photo-s/0f/b0/c6/68/masthead-brewing-from.jpg', 'https://utfb-images.untappd.com/DsSCeYBBoReiFu5zAgmiomt9?auto=compress')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Nano Brew Cleveland', '1859 W 25th St', 'Cleveland', 'Ohio', '44113', 'http://www.nanobrewcleveland.com', '2168626631', 'Nano Brew Cle is a friendly, bicycle-themed brewpub located in the historic Ohio City neighborhood of Cleveland, Ohio. Designed to celebrate American fare and all American craft beer, we feature 24 beers on draft and a menu of crave-worthy eats that can be enjoyed both at the inside bar and our lively, two-story patio.', 'https://media-cdn.tripadvisor.com/media/photo-s/1c/e2/f2/1b/nano-brew-serves-as-market.jpg', 'https://images.squarespace-cdn.com/content/v1/6008765d46d4c56a53f90675/0a4cd46e-7d36-4efb-8e4b-a7d892c60754/Nano+Circle.+.PNG')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Noble Beast Brewing Co.', '1470 Lakeside Ave E', 'Cleveland', 'Ohio', '44114-1137', 'http://noblebeastbeer.com', '7175859216', 'Hi. Were a small and family-owned business run by regular people. Shaun brews a mix of traditional and experimental beers, manages social media, and fixes the plumbing. His wife JoLyn runs operations, HR, and accounting and keeps everything by the book. Chef James creates a farm fresh and seasonal menu with an intensely creative eye that punches well above regular "brewery" food. They couldnt do it without a fantastic staff highlighted by GM Bill, Sous Chef Brittany, and Brewer Erik.', 'https://i0.wp.com/ohiocraftbeer.org/wp-content/uploads/2017/09/NB_Header_2.jpg?fit=800%2C533&ssl=1', 'https://brewcruizer.com/custom/domain_1/image_files/sitemgr_photo_23307.jpg')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Platform Beer Co', '4125 Lorain Ave', 'Cleveland', 'Ohio', '44113-3718', 'http://platformbeer.co', '2162021386', 'Platform was founded in 2014 on the premise that collaboration should be at the cornerstone of everything that we do. Whether it be with pro brewers, the home brewing world or a variety of other industries beer is special and should be shared. From humble beginnings brewing on a 3 bbl brewhouse in Cleveland Platform has expanded to a second tasting room in Columbus a production facility in Cleveland a Cincinnati tasting room named LOCOBA and a sour beer facility in Cleveland named Phunkenship.', 'https://ohiomagazine.azureedge.net/sitefinity/images/default-source/articles/2015/2---february-2015/platform-brew_d3_3107.jpg?sfvrsn=479ad138_2', 'https://images.squarespace-cdn.com/content/v1/58e90d0e20099ea6eba14db3/1491668501108-2M8R0ONNAKV7E5DMYNG4/platform-logo.png')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Rivals Sports Grille', '6710 Smith Rd', 'Middleburg Heights', 'Ohio', '44130-2656', 'https://www.rivals-cleveland.com', '2162670005', 'For years, Rivals has been a popular spot in the neighborhood for family and friends to enjoy each others company over food and drinks in the comfortable Rivals atmosphere. With a rich history in the Middleburg Heights community, Rivals is a home away from home for many. While Rivals is a part of the past, it is also a part of the future, looking to grow this home away from home for more to enjoy.', 'https://www.cleveland.com/resizer/gqwwyTxGXg0wxpILr1bCqC18wnk=/1280x0/smart/advancelocal-adapter-image-uploads.s3.amazonaws.com/image.cleveland.com/home/cleve-media/width2048/img/ent_impact_home/photo/24255898-standard.jpg', 'https://pbs.twimg.com/profile_images/1059514380931330048/2uBo5Arw_400x400.jpg')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Rocky River Brewing Co', '21290 Center Ridge Rd', 'Rocky River', 'Ohio', '44116-3204', 'http://www.rockyriverbrewco.com', '4408952739', 'For more than 20 years, Rocky River Brewing Companys laid-back, family-friendly atmosphere and extensive melt-in-your-mouth menu selections and tantalizing handcrafted brews has been delighting families and friends. The food the beer our friendly and courteous staff, and our patrons all make visiting R.R.B.C. a fantastic and memorable experience. We welcome you to visit the “Brew Co.” with your family and friends to enjoy the the pleasant atmosphere, friendly people, fresh food and great beers.', 'https://images.squarespace-cdn.com/content/v1/56c8e02b2eeb81462d149d14/1485830567676-37FG3FIFLEITKURK6O0R/Rocky_River_Inside_2.JPG?format=2500w', 'https://d2pxm94gkd1wuq.cloudfront.net/BreweryLogos/Standard/8332030.rocky-river-logo-db.jpg')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Saucy Brew Works', '2885 Detroit Ave', 'Cleveland', 'Ohio', '44113-2765', 'http://www.saucybrewworks.com', '2166662568', 'At Saucy Brew Works, we don’t just brew beer. Since opening our doors in 2017, we’ve been dedicated to putting our minds and hearts into the process, using the finest ingredients and employing state of the art techniques. The result is a selection of enjoyable, elegant and authentic craft beers.', 'https://www.vocon.com/wp-content/uploads/Saucy-Brew-02_Medium-850x638.jpg', 'https://lh3.googleusercontent.com/XoxfnbYDi3im8gs6zF-lJvqVIR3NIUFmpb5Yrd_jSUe_QoHczLrid4a7jFxkJLal7sTV8r13fLCdbgqPJ1if6xjN330Sjb8=s750')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Sibling Revelry Brewing', '29305 Clemens Rd', 'Westlake', 'Ohio', '44145-1008', 'http://www.siblingrevelrybrewing.com', '4404718589', 'Our taproom is where family and friends meet to grab a brew, talk about Cleveland sports and relax after a long day at the office. Unwind at our bar and enjoy a view of our brewhouse, or relive your childhood and play a board game. Weather permitting, enjoy a cold brew on the outdoor patio, perfect for friends and pups alike. For the constantly-connected, we offer free Wi-Fi and USB wall plugs to charge all of your devices.', 'https://www.cleveland.com/resizer/94dSx6QfH-mvYDeSj6_CQl4YLyc=/1280x0/smart/advancelocal-adapter-image-uploads.s3.amazonaws.com/image.cleveland.com/home/cleve-media/width2048/img/ent_impact_home/photo/sibling-revelryjpg-df78e09ca81d394b.jpg', 'https://popmenucloud.com/cdn-cgi/image/width=640,height=640,format=png,fit=scale-down/iweqcdgm/1349e8b9-e37c-4c5f-bae7-22c8a08c3a4e.png')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Southern Tier Brewing Co', '811 Prospect Ave E', 'Cleveland', 'Ohio', '44115-1111', 'https://taprooms.stbcbeer.com/southern-tier-brewery-cleveland-5b6c1b355dcb', '4404844045', 'The Southern Tier Brewing Company taproom in Cleveland is a state-of-the-art brewery and taproom, located in downtown Cleveland, OH. The Prospect Avenue venue, our second satellite taproom, is a short walk from Rocket Mortgage FieldHouse and Progressive Field, where we’re pouring fresh Southern Tier beers, serving a full, chef-created, beer-inspired food menu, and offering a selection of Southern Tier favorites to-go (in cans, bottles, and growler/crowler fills).', 'https://media.wkyc.com/assets/WKYC/images/6b7bee50-0c79-4d13-966f-7d2976b912a3/6b7bee50-0c79-4d13-966f-7d2976b912a3_1920x1080.jpg', 'https://utfb-images.untappd.com/zbaGFCj5NFUDW36i1dgXL4QK?auto=compress')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Terrestrial Brewing Company', '7524 Father Frascati Dr', 'Cleveland', 'Ohio', '44102-2087', 'https://terrestrialbrewing.com/', '2164659999', 'The brewery is located in the Battery Park neighborhood of Cleveland, Ohio. The tap list has two, mainstay beers, Canopy Crusher IPA and Public Pilsner, while the rest of the taps constantly rotate with new and exciting brews. The Taproom offers a casual vibe and two large patios with epic views of Lake Erie. The Taproom is also 100% dog-friendly and has an adjacent dog park next to us for the dogs to play and meet some friends.', 'https://i0.wp.com/ohiocraftbeer.org/wp-content/uploads/2017/08/Terrestrial.Interior.jpg?fit=800%2C533&ssl=1', 'https://www.porchdrinking.com/wp-content/uploads/2017/09/terrestrial-bc-logo2-680x325.jpg')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('The Cleveland Brewery', '777 E 185th St', 'Cleveland', 'Ohio', '44119-2170', 'https://theclevelandbrewery.com/', '2165346992', 'When a space opened up in our neighborhood, and the name was approved, the stars aligned for The Cleveland Brewery to start in October 2014. We initially sold to local restaurants for funding towards our tasting room which opened in 2015. Since then, John has brewed over 50 recipes and keeps the creativity coming. The tasty beer and our Cleveland spirit is why you fall in love with our spot.', 'https://res.cloudinary.com/bandwango/image/upload/c_crop,h_3057,w_4078,x_447,y_0/w_500,f_auto,q_auto/v1/partners/447/venue/38796/i9yey6j9t0irhcsgyksy.png', 'https://www.thisiscleveland.com/thisiscleveland/media/partnerdirectory/13646_30478.jpg?w=1200&h=630&mode=crop')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('The Jolly Scholar', '11111 Euclid Ave', 'Cleveland', 'Ohio', '44106-1715', 'https://theclevelandbrewery.com/', '2165346992', 'When a space opened up in our neighborhood, and the name was approved, the stars aligned for The Cleveland Brewery to start in October 2014. We initially sold to local restaurants for funding towards our tasting room which opened in 2015. Since then, John has brewed over 50 recipes and keeps the creativity coming. The tasty beer and our Cleveland spirit is why you fall in love with our spot.', 'https://observer.case.edu/wp-content/uploads/2016/02/JollyScholar_11-7_amh181_1MBJPEG_0003-900x600.jpg', 'https://www.thejollyscholar.com/wp-content/uploads/2018/07/Jolly-Scholar-Logo.png')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Working Class Brewery', '17448 Lorain Ave', 'Cleveland', 'Ohio', '44111-4028', 'http://www.workingclassbrewery.com', '2164175112', 'Working Class Brewery is a working class guy following a passion and dream to create great fresh local craft beer for hard working people.Located in the Kamm’s Corners area at 17448  Lorain Avenue, Cleveland, Ohio. Working Class Brewery has its own tap room where retail customers may come to view the operation of the brewery, purchase beer by the glass, beer to go, snacks, and retail items such as T-shirts, hats and glassware with our logo printed on them.', 'https://media-cdn.tripadvisor.com/media/photo-s/14/c1/72/5a/inside.jpg', 'https://pbs.twimg.com/profile_images/1130869525094764544/HMeZ9Dr9_400x400.png')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about, image, logo) VALUES ('Immigrant Son Brewing', '18120 Sloane Ave', 'Lakewood', 'Ohio', '44107', 'immigrantsonbrewing.com', '2166004483', 'Immigrant Son is not just about a place, a thing, or a single person, it is an ongoing tale about ALL of us as one coming to the table to break bread, share the best of ourselves and what we’ve learned along the way while toasting to the road ahead.', 'https://clevelandmagazine.azureedge.net/sitefinity/images/default-source/archive/immigrant-son-brewery-interior.jpg?sfvrsn=6e7ceb8c_1', 'https://media-exp1.licdn.com/dms/image/C4D0BAQHzAYxbiJbYzA/company-logo_200_200/0/1633837847647?e=2147483647&v=beta&t=F3OPZNNfVwxlhE6w69sXX57LaInYQ8dvFhFpUmE6JYg')


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
	(1004, 9, 'My go to spot before all Cavs and Guardians games. A wide variety of beers to choose from and the food is fantastic! I highly recommend the Albino Stout and Fried Chicken Sliders')



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

	--assigning reviews to useres
	INSERT INTO user_review (user_id, review_id) VALUES (1, 3000)
	INSERT INTO user_review (user_id, review_id) VALUES (3, 3001)


	--INSERT INTO beer_list (beer_name, type, abv) VALUES ('', '',)

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
	


	--SELECT * FROM brewery WHERE id = 1000

	--SELECT * FROM brewery

	--SELECT * fROM brewery JOIN brewery_tag on brewery_tag.brewery_id = brewery.id JOIN tag on tag.tag_id = brewery_tag.tag_id WHERE tag.tag_id = 2000

	

	--UPDATE brewery SET image = 'https://images.squarespace-cdn.com/content/v1/59e7b07a8dd04156df25edaf/1584376002697-CZR8WVKWUZ4H94ZLP3NA/_CRU8860.jpg?format=2500w' WHERE id = 1000

	--select * from users

	--select * from review
	--select * from beer_list
	--select name, id from brewery
	--select * from beer_brewery

	