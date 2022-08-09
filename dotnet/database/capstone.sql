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
	image varchar (100),
	hours varchar (30), 
	city varchar (50),
	state varchar (20),
	zip varchar (10)
	CONSTRAINT PK_brewery PRIMARY KEY (id)
)
CREATE TABLE review(
	review_id int IDENTITY (3000, 1) NOT NULL,
	brewery_id int,
	rating decimal (5) NOT NULL,
	content varchar (500) NOT NULL
	CONSTRAINT PK_review PRIMARY KEY (review_id),
	CONSTRAINT FK_brewery FOREIGN KEY (brewery_id) REFERENCES brewery (id)
)
CREATE TABLE tag (
	tag_id int IDENTITY (2000,1) NOT NULL,
	type varchar (20) NOT NULL,
	CONSTRAINT PK_tag PRIMARY KEY (tag_id)
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
	user_id int,
	review_id int,
	CONSTRAINT user_review_pk PRIMARY KEY (user_id, review_id),
	CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES users (user_id),
	CONSTRAINT review_id_fk FOREIGN KEY (review_id) REFERENCES review (review_id)
)


--populate default data
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin');


--   INSERT INTO brewery (name, address, city, state, zip, website, phone, about,) VALUES ('', '', '', '', '', '', '', '')

INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('Bookhouse Brewing, LLC.', '1526 W 25th St', 'Cleveland', 'Ohio', '44113-3104', 'http://www.bookhouse.beer', '4144264555', 'Innovative and approachable beers and ciders served in a cozy, historic taproom. The location originally housed the Jacob and Magdalena Baehr Brewery, founded in 1873. The owners of Bookhouse are in the process of restoring it to its original glory, and the original brick, wallpaper, and tin are visible throughout. Plants, warm lighting, and bookshelf-lined walls create an inviting atmosphere. The menu is always changing and has something for everyone, so stop in and check out the menu!')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('Boss Dog Brewing', '2179 Lee Rd', 'Cleveland', 'Ohio', '44118-2907', 'http://www.bossdogbrewing.com', '2163212337', 'A casual brewpub that serves up a variety of delicious fare. While Boss Dog may be a small outfit, they certainly bring a lot to the table. Featuring both a brunch and dinner food menu, as well as an extensive draft list, you are sure to find something you’ll enjoy. They even have a doggie menu for your furry friends! All of Boss Dog’s ingredients are locally sourced, and they offer full tours of their brewing facility, so if food transparency is your jam, this is the place to go.')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('BottleHouse Brewery', '13368 Madison Ave', 'Lakewood', 'Ohio', '44107-4840', 'http://www.thebottlehousebrewingcompany.com', '2162142120', 'A community-oriented brewery and mead hall. BottleHouse’s full-service food menu, board games, live music and more create an environment that’s more than a place to drink. If the drinks are what you’re here for, though, fret not– BottleHouse has won multiple national awards for its ciders and beers, and their meads are a local favorite. For a truly special experience, try their 5 course dinner, each course paired with a curated mead based drink.')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('Brick and Barrel', '1844 Columbus Rd', 'Cleveland', 'Ohio', '44113-2412', 'http://www.brickandbarrelbrewing.com', '5039270629', 'Brick and Barrel Brewing is committed to creating a beer experience that is unique in the Cleveland area. By design, they’re a small place where you can chat with the head brewer while tasting their brews and touring the facility. Of course, you can also just sit in the tap room and taste whats boiling only a few yards away. B&B also hosts frequent live events– from music, to tastings, to comedy and more. ')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('Cleveland Brewing Company @ Butcher and The Brewer', '2043 E 4th St', 'Cleveland', 'Ohio', '44115-1023', 'http://www.butcherandthebrewer.com/', '216-331-0805', 'Butcher and the Brewer encourages interaction and a sense of community through public house seating, progressive dining, and shared plates. The culinary team, which includes an in-house butcher, has created a farmhouse-inspired menu drawing on local ingredients, ethnic flavors, and artisan products. Their brewmaster uses a strong background in science, a formal education in classic brewing techniques, and their custom on-site brewery to brew a range of traditional and innovative beers.')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('Collision Bend Brewing Co', '1250 Old River Rd', 'Cleveland', 'Ohio', '44113-1243', 'http://www.collisionbendbrewery.com', '2162737879', 'Collision Bend Brewing Company, named for the narrow and crooked passages along the Cuyahoga River navigated by large commercial ships, is home to crafted artisanal beers and a menu inspired by Cleveland’s melting pot, offering a unique dining experience. Featuring a wood-burning pizza oven, three bars, outdoor seating with amazing riverfront views and a brewer’s room, Collision Bend is an excellent option for a party or family dinner. You can even dock your boat right alongside the patio!')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('Fat Heads Brewery & Saloon', '24581 Lorain Rd', 'North Olmsted', 'Ohio', '44070-2170', 'http://www.fatheadscleveland.com', '4408011001', 'Serves fresh, award winning beer, smokehouse wings, freshly made headwiches, burgers and stone oven pizza.')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('Forest City Brewery', '2135 Columbus Rd Ste A', 'Cleveland', 'Ohio', '44113-4243', 'http://www.forestcitybrewery.com', '2162289116', 'Recently named one of the top outdoor spaces in Cleveland by News Channel 5! Home of "Big Red" the tallest Red Mulberry tree in Ohio and our giant sycamore tree "Sycamore Sid" that dates back to the original space in 1865.')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('Goldhorn Brewery', '1361 E 55th St', 'Cleveland', 'Ohio', '44103-1301', 'https://goldhornbrewery.com/', '2163858677', 'Named for the famed mountain goat of Slovenian folklore in homage to our neighborhood roots. With a robust rotating draft list, hearty feel-good food, and private event spaces, we aim to be a community staple for visitors and residents alike.')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('Great Lakes Brewing Co', '2516 Market Ave', 'Cleveland', 'Ohio', '44113-3434', 'http://www.greatlakesbrewing.com', '2167714404', 'From our dog-friendly tree-lined patio to the cozy beer cellar and lively beer garden, the GLBC brewpub offers a variety of unique drinking and dining experiences.')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('Hansa Brewery', '2717 Lorain Ave', 'Cleveland', 'Ohio', '44113-3414', 'http://www.hansabrewery.com', '2166316585', 'We welcome you with open arms and cold beer to Clevelands newest, authentic Eastern European restaurant and brewery. PROST!')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('Hofbrauhaus Cleveland', '1550 Chester Ave', 'Cleveland', 'Ohio', '44114-3615', 'http://www.hofbrauhauscleveland.com', '2166212337', 'Welcome to Hofbräuhaus Cleveland, modeled after the legendary 400+ year-old Hofbräuhaus in Munich, Germany! Guests are now able to enjoy many of the traditions from Germany that have made Hofbräuhaus famous.')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('Market Garden Brewery', '1947 W 25th St', 'Cleveland', 'Ohio', '44113-3418', 'http://www.marketgardenbrewery.com', '2166214000', 'Market Garden Brewery was founded in 2011 by four friends with a passion for quality, craft beer. Our motto “Beer for People” reflects our mission to bring better beer to all. No pretense, no gimmicks, no hype - just great beer for the world!')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('Masthead Brewing Co', '1261 Superior Ave E', 'Cleveland', 'Ohio', '44114-3204', 'http://www.mastheadbrewingco.com', '4192604770', 'Masthead Brewing Company is located in the historic Bryant Building at 1261 Superior Avenue in downtown Cleveland. Our building was originally built in 1921 as an automotive dealership and is now listed on the National Register of Historic Places. The taproom features 300 seats, a 100’ long bar, and an additional 50 seat dog friendly patio with a view of downtown Cleveland.')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('Nano Brew Cleveland', '1859 W 25th St', 'Cleveland', 'Ohio', '44113', 'http://www.nanobrewcleveland.com', '2168626631', 'Nano Brew Cle is a friendly, bicycle-themed brewpub located in the historic Ohio City neighborhood of Cleveland, Ohio. Designed to celebrate American fare and all American craft beer, we feature 24 beers on draft and a menu of crave-worthy eats that can be enjoyed both at the inside bar and our lively, two-story patio.')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('Noble Beast Brewing Co.', '1470 Lakeside Ave E', 'Cleveland', 'Ohio', '44114-1137', 'http://noblebeastbeer.com', '7175859216', 'Hi. Were a small and family-owned business run by regular people. Shaun brews a mix of traditional and experimental beers, manages social media, and fixes the plumbing. His wife JoLyn runs operations, HR, and accounting and keeps everything by the book. Chef James creates a farm fresh and seasonal menu with an intensely creative eye that punches well above regular "brewery" food. They couldnt do it without a fantastic staff highlighted by GM Bill, Sous Chef Brittany, and Brewer Erik. ')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('Platform Beer Co', '4125 Lorain Ave', 'Cleveland', 'Ohio', '44113-3718', 'http://platformbeer.co', '2162021386', 'Platform was founded in 2014 on the premise that collaboration should be at the cornerstone of everything that we do. Whether it be with pro brewers, the home brewing world or a variety of other industries beer is special and should be shared. From humble beginnings brewing on a 3 bbl brewhouse in Cleveland Platform has expanded to a second tasting room in Columbus a production facility in Cleveland a Cincinnati tasting room named LOCOBA and a sour beer facility in Cleveland named Phunkenship. ')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('Rivals Sports Grille', '6710 Smith Rd', 'Middleburg Heights', 'Ohio', '44130-2656', 'https://www.rivals-cleveland.com', '2162670005', 'For years, Rivals has been a popular spot in the neighborhood for family and friends to enjoy each others company over food and drinks in the comfortable Rivals atmosphere. With a rich history in the Middleburg Heights community, Rivals is a home away from home for many. While Rivals is a part of the past, it is also a part of the future, looking to grow this home away from home for more to enjoy.')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('Rocky River Brewing Co', '21290 Center Ridge Rd', 'Rocky River', 'Ohio', '44116-3204', 'http://www.rockyriverbrewco.com', '4408952739', 'For more than 20 years, Rocky River Brewing Companys laid-back, family-friendly atmosphere and extensive melt-in-your-mouth menu selections and tantalizing handcrafted brews has been delighting families and friends. The food the beer our friendly and courteous staff, and our patrons all make visiting R.R.B.C. a fantastic and memorable experience. We welcome you to visit the “Brew Co.” with your family and friends to enjoy the the pleasant atmosphere, friendly people, fresh food and great beers.')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('Saucy Brew Works', '2885 Detroit Ave', 'Cleveland', 'Ohio', '44113-2765', 'http://www.saucybrewworks.com', '2166662568', 'At Saucy Brew Works, we don’t just brew beer. Since opening our doors in 2017, we’ve been dedicated to putting our minds and hearts into the process, using the finest ingredients and employing state of the art techniques. The result is a selection of enjoyable, elegant and authentic craft beers.')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('Sibling Revelry Brewing', '29305 Clemens Rd', 'Westlake', 'Ohio', '44145-1008', 'http://www.siblingrevelrybrewing.com', '4404718589', 'Our taproom is where family and friends meet to grab a brew, talk about Cleveland sports and relax after a long day at the office. Unwind at our bar and enjoy a view of our brewhouse, or relive your childhood and play a board game. Weather permitting, enjoy a cold brew on the outdoor patio, perfect for friends and pups alike. For the constantly-connected, we offer free Wi-Fi and USB wall plugs to charge all of your devices.')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('Southern Tier Brewing Co', '811 Prospect Ave E', 'Cleveland', 'Ohio', '44115-1111', 'https://taprooms.stbcbeer.com/southern-tier-brewery-cleveland-5b6c1b355dcb', '4404844045', 'The Southern Tier Brewing Company taproom in Cleveland is a state-of-the-art brewery and taproom, located in downtown Cleveland, OH. The Prospect Avenue venue, our second satellite taproom, is a short walk from Rocket Mortgage FieldHouse and Progressive Field, where we’re pouring fresh Southern Tier beers, serving a full, chef-created, beer-inspired food menu, and offering a selection of Southern Tier favorites to-go (in cans, bottles, and growler/crowler fills).')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('Terrestrial Brewing Company', '7524 Father Frascati Dr', 'Cleveland', 'Ohio', '44102-2087', 'https://terrestrialbrewing.com/', '2164659999', 'The brewery is located in the Battery Park neighborhood of Cleveland, Ohio. The tap list has two, mainstay beers, Canopy Crusher IPA and Public Pilsner, while the rest of the taps constantly rotate with new and exciting brews. The Taproom offers a casual vibe and two large patios with epic views of Lake Erie. The Taproom is also 100% dog-friendly and has an adjacent dog park next to us for the dogs to play and meet some friends.  ')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('The Cleveland Brewery', '777 E 185th St', 'Cleveland', 'Ohio', '44119-2170', 'https://theclevelandbrewery.com/', '2165346992', 'When a space opened up in our neighborhood, and the name was approved, the stars aligned for The Cleveland Brewery to start in October 2014. We initially sold to local restaurants for funding towards our tasting room which opened in 2015. Since then, John has brewed over 50 recipes and keeps the creativity coming. The tasty beer and our Cleveland spirit is why you fall in love with our spot.')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('The Jolly Scholar', '11111 Euclid Ave', 'Cleveland', 'Ohio', '44106-1715', 'https://theclevelandbrewery.com/', '2165346992', 'When a space opened up in our neighborhood, and the name was approved, the stars aligned for The Cleveland Brewery to start in October 2014. We initially sold to local restaurants for funding towards our tasting room which opened in 2015. Since then, John has brewed over 50 recipes and keeps the creativity coming. The tasty beer and our Cleveland spirit is why you fall in love with our spot.')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('Working Class Brewery', '17448 Lorain Ave', 'Cleveland', 'Ohio', '44111-4028', 'http://www.workingclassbrewery.com', '2164175112', 'Working Class Brewery is a working class guy following a passion and dream to create great fresh local craft beer for hard working people.Located in the Kamm’s Corners area at 17448  Lorain Avenue, Cleveland, Ohio. Working Class Brewery has its own tap room where retail customers may come to view the operation of the brewery, purchase beer by the glass, beer to go, snacks, and retail items such as T-shirts, hats and glassware with our logo printed on them.')
INSERT INTO brewery (name, address, city, state, zip, website, phone, about) VALUES ('Immigrant Son Brewing', '18120 Sloane Ave', 'Lakewood', 'Ohio', '44107', 'immigrantsonbrewing.com', '2166004483', 'Immigrant Son is not just about a place, a thing, or a single person, it is an ongoing tale about ALL of us as one coming to the table to break bread, share the best of ourselves and what we’ve learned along the way while toasting to the road ahead.')

INSERT INTO tag (type) VALUES ('Pet Friendly') --2000
INSERT INTO tag (type) VALUES ('Family Friendly') --2001
INSERT INTO tag (type) VALUES ('Budget') --2002
INSERT INTO tag (type) VALUES ('Patio') --2003




COMMIT


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

