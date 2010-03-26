/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50141
Source Host           : localhost:3306
Source Database       : ion26

Target Server Type    : MYSQL
Target Server Version : 50141
File Encoding         : 65001

Date: 2010-03-26 16:16:42
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `access_userrights`
-- ----------------------------
DROP TABLE IF EXISTS `access_userrights`;
CREATE TABLE `access_userrights` (
  `userright` varchar(50) NOT NULL,
  `role` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`userright`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of access_userrights
-- ----------------------------
INSERT INTO `access_userrights` VALUES ('fuse_login', '1');
INSERT INTO `access_userrights` VALUES ('fuse_hax', '4');

-- ----------------------------
-- Table structure for `catalog_pages`
-- ----------------------------
DROP TABLE IF EXISTS `catalog_pages`;
CREATE TABLE `catalog_pages` (
  `id` int(10) unsigned NOT NULL,
  `orderid` int(11) NOT NULL,
  `minrole` int(1) NOT NULL,
  `name_index` varchar(30) NOT NULL,
  `name_display` varchar(30) NOT NULL,
  `layout_class` varchar(15) NOT NULL,
  `layout_headline` varchar(100) NOT NULL,
  `layout_images` varchar(100) NOT NULL,
  `layout_description` varchar(100) NOT NULL,
  `layout_description_side` varchar(100) NOT NULL,
  `layout_extra` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of catalog_pages
-- ----------------------------
INSERT INTO `catalog_pages` VALUES ('1', '1', '1', 'purse', 'Purse', 'ctlg_purse', 'catal_fp_header', 'catal_fp_pic4,', 'Need some furni for your System room? Well, you\'re', 'Need some Funky Furni for your System', '');
INSERT INTO `catalog_pages` VALUES ('2', '2', '1', 'collectibles', 'Collectibles', 'ctlg_collectibl', 'catalog_collectibles_headline1', 'collectible_page,', 'Collect your way to the riches! Collectables are special furniture sold only for a limited period of', 'Find out what the latest collectible is >>', 't1:Find out what the latest Collectable is >>');
INSERT INTO `catalog_pages` VALUES ('3', '1', '1', 'spaces', 'Spaces', 'ctlg_spaces', 'catalog_spaces_headline1', '', 'Floors, wallpapers and landscapes - get a groovy new look for your room. Use our virtual room previe', 't7:Preview t4:Colour t1:Wall', 't5:Pattern\r\nt2:Floor\r\nt8:Pattern\r\nt11:Landscape\r\nt10:Floor\r\nt6:Colour\r\nt3:Pattern\r\nt9:Colour');
INSERT INTO `catalog_pages` VALUES ('4', '2', '1', 'windows', 'Windows', 'ctlg_layout2', 'ctlg_windows_headline1', 'ctlg_windows_teaser1', 'Slipp sola inn! Vinduene vÃ¥re kan kjÃ¸pes i forskjellige stilarter, slik at du kan gi rommet ditt e', 'Click on an item to see more details', 's: Ooh, new view!');
INSERT INTO `catalog_pages` VALUES ('5', '3', '1', 'accessories', 'Accessories', 'ctlg_layout2', 'catalog_extra_headline1', 'catalog_extra_teaser1,', 'Det er pyntetingene og de smÃ¥ finessene som forte', 'Klikk pÃ¥ en ting for flere detaljer', 's:2: I love my rabbit...');
INSERT INTO `catalog_pages` VALUES ('6', '4', '1', 'mode', 'Mode', 'ctlg_layout2', '', '', '', '', '');
INSERT INTO `catalog_pages` VALUES ('7', '5', '1', 'pura', 'Pura', 'ctlg_layout2', '', '', '', '', '');
INSERT INTO `catalog_pages` VALUES ('8', '6', '1', 'plants', 'Plants', 'ctlg_layout2', '', '', '', '', '');
INSERT INTO `catalog_pages` VALUES ('9', '7', '1', 'secret', 'Secret', 'ctlg_layout2', '', '', '', '', '');

-- ----------------------------
-- Table structure for `catalog_products`
-- ----------------------------
DROP TABLE IF EXISTS `catalog_products`;
CREATE TABLE `catalog_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pageid` int(10) NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  `cost` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of catalog_products
-- ----------------------------
INSERT INTO `catalog_products` VALUES ('1', '5', '1', '6');

-- ----------------------------
-- Table structure for `external_texts`
-- ----------------------------
DROP TABLE IF EXISTS `external_texts`;
CREATE TABLE `external_texts` (
  `xkey` varchar(50) NOT NULL,
  `xvalue` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of external_texts
-- ----------------------------
INSERT INTO `external_texts` VALUES ('poster_47_desc', 'Twinkle, twinkle');
INSERT INTO `external_texts` VALUES ('poster_3_name', 'Fish Plaque');
INSERT INTO `external_texts` VALUES ('poster_59_desc', 'Torch - it gives you some light');
INSERT INTO `external_texts` VALUES ('poster_43_name', 'Chains');
INSERT INTO `external_texts` VALUES ('poster_2001_name', 'Magic Carpet');
INSERT INTO `external_texts` VALUES ('poster_62_name', 'Save The Panda');
INSERT INTO `external_texts` VALUES ('poster_510_name', 'The Italian flag');
INSERT INTO `external_texts` VALUES ('poster_1006_name', 'Hoot Poster');
INSERT INTO `external_texts` VALUES ('poster_24_name', 'Three Wise Men Poster');
INSERT INTO `external_texts` VALUES ('poster_58_desc', 'Wishing you luck');
INSERT INTO `external_texts` VALUES ('poster_53_desc', 'whack that ball!');
INSERT INTO `external_texts` VALUES ('poster_1002_name', 'Queen Mum Poster');
INSERT INTO `external_texts` VALUES ('poster_1_desc', 'Is she smiling?');
INSERT INTO `external_texts` VALUES ('poster_30_name', 'Mistletoe');
INSERT INTO `external_texts` VALUES ('poster_2008_name', 'Habbo Leap Day Poster');
INSERT INTO `external_texts` VALUES ('poster_1004_desc', 'Celebrate with us');
INSERT INTO `external_texts` VALUES ('poster_506_name', 'The flag of Finland');
INSERT INTO `external_texts` VALUES ('poster_518_desc', 'A fiery dragon for your wall');
INSERT INTO `external_texts` VALUES ('poster_38_name', 'Smiling Headbangerz');
INSERT INTO `external_texts` VALUES ('poster_38_desc', 'For really TOUGH Habbos!');
INSERT INTO `external_texts` VALUES ('poster_25_name', 'Reindeer Poster');
INSERT INTO `external_texts` VALUES ('poster_511_desc', 'The flag of The Netherlands');
INSERT INTO `external_texts` VALUES ('poster_510_desc', 'The flag of Italy');
INSERT INTO `external_texts` VALUES ('poster_1000_name', 'Comedy Poster');
INSERT INTO `external_texts` VALUES ('poster_24_desc', 'Following the star');
INSERT INTO `external_texts` VALUES ('poster_32_name', 'Stocking');
INSERT INTO `external_texts` VALUES ('poster_2002_desc', 'Presidentin muotokuva');
INSERT INTO `external_texts` VALUES ('poster_1004_name', 'Eid Mubarak Poster');
INSERT INTO `external_texts` VALUES ('poster_20_desc', 'A new use for carrots!');
INSERT INTO `external_texts` VALUES ('poster_42_name', 'Spiderweb');
INSERT INTO `external_texts` VALUES ('poster_35_desc', 'The Hotel\'s girlband. Dream on!');
INSERT INTO `external_texts` VALUES ('poster_55_name', 'Tree of Time');
INSERT INTO `external_texts` VALUES ('poster_2003_name', 'Dodgy Geezer');
INSERT INTO `external_texts` VALUES ('poster_31_desc', 'Pure and unbridled nu-metal');
INSERT INTO `external_texts` VALUES ('poster_58_name', 'Red Knots');
INSERT INTO `external_texts` VALUES ('poster_17_desc', 'Beautiful reproduction butterfly');
INSERT INTO `external_texts` VALUES ('poster_16_name', 'Bars');
INSERT INTO `external_texts` VALUES ('poster_508_desc', 'The flag of Spain');
INSERT INTO `external_texts` VALUES ('poster_500_desc', 'The UK flag');
INSERT INTO `external_texts` VALUES ('poster_10_desc', 'Beautiful sunset');
INSERT INTO `external_texts` VALUES ('poster_6_desc', 'But is it the right way up?');
INSERT INTO `external_texts` VALUES ('poster_504_desc', 'The German flag');
INSERT INTO `external_texts` VALUES ('poster_1003_desc', 'get the lovely isles on your walls');
INSERT INTO `external_texts` VALUES ('poster_23_desc', 'The jolly fat man himself');
INSERT INTO `external_texts` VALUES ('poster_509_name', 'The Jamaican flag');
INSERT INTO `external_texts` VALUES ('poster_56_desc', 'Serious partying going on!');
INSERT INTO `external_texts` VALUES ('poster_1001_name', 'Prince Charles Poster');
INSERT INTO `external_texts` VALUES ('poster_29_name', 'Gold Tinsel Bundle');
INSERT INTO `external_texts` VALUES ('poster_2_name', 'Carrot Plaque');
INSERT INTO `external_texts` VALUES ('poster_49_desc', 'All that glitters...');
INSERT INTO `external_texts` VALUES ('poster_21_name', 'Angel Poster');
INSERT INTO `external_texts` VALUES ('poster_8_desc', 'Habbos come in all colours');
INSERT INTO `external_texts` VALUES ('poster_1003_name', 'UK Map');
INSERT INTO `external_texts` VALUES ('poster_57_name', 'Calligraphy poster');
INSERT INTO `external_texts` VALUES ('poster_503_name', 'The Swiss flag');
INSERT INTO `external_texts` VALUES ('poster_2006_desc', 'He is the magic Habbo');
INSERT INTO `external_texts` VALUES ('poster_2007_name', 'The Father Of Habbo');
INSERT INTO `external_texts` VALUES ('poster_33_desc', 'We can\'t bear to lose them');
INSERT INTO `external_texts` VALUES ('poster_6_name', 'Abstract Poster');
INSERT INTO `external_texts` VALUES ('poster_29_desc', '10 x Gold Tinsel');
INSERT INTO `external_texts` VALUES ('poster_28_name', 'Silver Tinsel Bundle');
INSERT INTO `external_texts` VALUES ('poster_2004_name', 'Rasta Poster');
INSERT INTO `external_texts` VALUES ('poster_509_desc', 'The flag of Jamaica');
INSERT INTO `external_texts` VALUES ('poster_2005_desc', 'The Special Infobus Poster');
INSERT INTO `external_texts` VALUES ('poster_32_desc', 'Hung yours up yet?');
INSERT INTO `external_texts` VALUES ('poster_54_name', 'Hockey Stick');
INSERT INTO `external_texts` VALUES ('poster_59_name', 'Torch');
INSERT INTO `external_texts` VALUES ('poster_508_name', 'The Spanish flag');
INSERT INTO `external_texts` VALUES ('poster_15_name', 'Himalayas Poster');
INSERT INTO `external_texts` VALUES ('poster_22_name', 'Winter Wonderland');
INSERT INTO `external_texts` VALUES ('poster_62_desc', 'We can\'t bear to lose them!');
INSERT INTO `external_texts` VALUES ('poster_26_desc', 'See that halo gleam!');
INSERT INTO `external_texts` VALUES ('poster_39_desc', 'The rock masters of virtual music');
INSERT INTO `external_texts` VALUES ('poster_505_name', 'The Maple Leaf');
INSERT INTO `external_texts` VALUES ('poster_520_name', 'The Rainbow Flag');
INSERT INTO `external_texts` VALUES ('poster_4_name', 'Bear Plaque');
INSERT INTO `external_texts` VALUES ('poster_19_desc', 'Trying to get in or out?');
INSERT INTO `external_texts` VALUES ('poster_523_name', 'India Flag');
INSERT INTO `external_texts` VALUES ('poster_501_desc', 'For pirates everywhere');
INSERT INTO `external_texts` VALUES ('poster_506_desc', 'To \'Finnish\' your decor...');
INSERT INTO `external_texts` VALUES ('poster_2008_desc', 'Once every four Habbo years!');
INSERT INTO `external_texts` VALUES ('poster_521_desc', 'Ordem e progresso');
INSERT INTO `external_texts` VALUES ('poster_517_desc', 'Where\'s your kilt?');
INSERT INTO `external_texts` VALUES ('poster_41_desc', 'For the best music-makers');
INSERT INTO `external_texts` VALUES ('poster_5_name', 'Duck Poster');
INSERT INTO `external_texts` VALUES ('poster_37_desc', 'The Hotels girlband. Dream on!');
INSERT INTO `external_texts` VALUES ('poster_42_desc', 'Not something you want to run into');
INSERT INTO `external_texts` VALUES ('poster_45_desc', 'Needs a few more Habburgers');
INSERT INTO `external_texts` VALUES ('poster_9_desc', 'Do your bit for the environment');
INSERT INTO `external_texts` VALUES ('poster_55_desc', 'Save our trees!');
INSERT INTO `external_texts` VALUES ('poster_47_name', 'Small silver star');
INSERT INTO `external_texts` VALUES ('poster_48_name', 'Large gold star');
INSERT INTO `external_texts` VALUES ('poster_33_name', 'Save the Panda');
INSERT INTO `external_texts` VALUES ('poster_517_name', 'The Scottish flag');
INSERT INTO `external_texts` VALUES ('poster_507_desc', 'The French flag');
INSERT INTO `external_texts` VALUES ('poster_500_name', 'Union Jack');
INSERT INTO `external_texts` VALUES ('poster_7_name', 'Hammer Cabinet');
INSERT INTO `external_texts` VALUES ('poster_2002_name', 'Urho Kaleva Kekkonen');
INSERT INTO `external_texts` VALUES ('poster_4_desc', 'Fake of course!');
INSERT INTO `external_texts` VALUES ('poster_16_desc', 'Added security');
INSERT INTO `external_texts` VALUES ('poster_14_desc', 'A cunning painting');
INSERT INTO `external_texts` VALUES ('poster_27_desc', 'Deck the halls!');
INSERT INTO `external_texts` VALUES ('poster_1_name', 'Lady Lisa');
INSERT INTO `external_texts` VALUES ('poster_516_desc', 'Eng-er-land');
INSERT INTO `external_texts` VALUES ('poster_18_name', 'Butterfly Cabinet 2');
INSERT INTO `external_texts` VALUES ('poster_18_desc', 'Beautiful reproduction butterfly');
INSERT INTO `external_texts` VALUES ('poster_2_desc', 'Take pride in your veg!');
INSERT INTO `external_texts` VALUES ('poster_3_desc', 'Smells fishy, looks cool');
INSERT INTO `external_texts` VALUES ('poster_513_name', 'The Australian flag');
INSERT INTO `external_texts` VALUES ('poster_514_name', 'The EU flag');
INSERT INTO `external_texts` VALUES ('poster_504_name', 'The Bundesflagge');
INSERT INTO `external_texts` VALUES ('poster_34_name', 'Scamme\'d');
INSERT INTO `external_texts` VALUES ('poster_522_desc', 'Land of the rising sun');
INSERT INTO `external_texts` VALUES ('poster_502_name', 'The Stars and Stripes');
INSERT INTO `external_texts` VALUES ('poster_27_name', 'Holly Bundle 3');
INSERT INTO `external_texts` VALUES ('poster_40_desc', 'The one and only. Adore her!');
INSERT INTO `external_texts` VALUES ('poster_515_desc', 'Waved by Swedes everywhere');
INSERT INTO `external_texts` VALUES ('poster_53_name', 'Hockey Stick');
INSERT INTO `external_texts` VALUES ('poster_36_desc', 'The Hotels girlband. Dream on!');
INSERT INTO `external_texts` VALUES ('poster_56_name', 'Disco Sign');
INSERT INTO `external_texts` VALUES ('poster_48_desc', 'All that glitters...');
INSERT INTO `external_texts` VALUES ('poster_61_desc', 'The Auspicious One');
INSERT INTO `external_texts` VALUES ('poster_44_name', 'Mummy');
INSERT INTO `external_texts` VALUES ('poster_1006_desc', 'The eyes follow you...');
INSERT INTO `external_texts` VALUES ('poster_37_name', 'The Habbo Babes 3');
INSERT INTO `external_texts` VALUES ('poster_83_name', 'PÃƒÂ¶llÃƒÂ¶ huhuilee');
INSERT INTO `external_texts` VALUES ('poster_36_name', 'The Habbo Babes 2');
INSERT INTO `external_texts` VALUES ('poster_513_desc', 'Aussies rule!');
INSERT INTO `external_texts` VALUES ('poster_503_desc', 'There\'s no holes in this...');
INSERT INTO `external_texts` VALUES ('poster_512_desc', 'The flag of Ireland');
INSERT INTO `external_texts` VALUES ('poster_8_name', 'Habbo Colours');
INSERT INTO `external_texts` VALUES ('poster_12_name', 'Lapland Poster');
INSERT INTO `external_texts` VALUES ('poster_34_desc', 'Habbo-punk for the never-agreeing');
INSERT INTO `external_texts` VALUES ('poster_61_name', 'Siva Poster');
INSERT INTO `external_texts` VALUES ('poster_19_name', 'Hole In The Wall');
INSERT INTO `external_texts` VALUES ('poster_1000_desc', 'The Noble and Silver Show');
INSERT INTO `external_texts` VALUES ('poster_54_desc', 'whack that ball!');
INSERT INTO `external_texts` VALUES ('poster_30_desc', 'Pucker up');
INSERT INTO `external_texts` VALUES ('poster_9_name', 'Rainforest Poster');
INSERT INTO `external_texts` VALUES ('poster_13_desc', 'Arty black and white');
INSERT INTO `external_texts` VALUES ('poster_522_name', 'Japan Flag');
INSERT INTO `external_texts` VALUES ('poster_25_desc', 'Doing a hard night\'s work');
INSERT INTO `external_texts` VALUES ('poster_11_name', 'Certificate');
INSERT INTO `external_texts` VALUES ('poster_20_name', 'Snowman Poster');
INSERT INTO `external_texts` VALUES ('poster_516_name', 'The English flag');
INSERT INTO `external_texts` VALUES ('poster_14_name', 'Fox Poster');
INSERT INTO `external_texts` VALUES ('poster_52_desc', 'whack that ball!');
INSERT INTO `external_texts` VALUES ('poster_2000_name', 'Suomen kartta');
INSERT INTO `external_texts` VALUES ('poster_518_name', 'The Welsh flag');
INSERT INTO `external_texts` VALUES ('poster_44_desc', 'Beware the curse...');
INSERT INTO `external_texts` VALUES ('poster_5_desc', 'Quacking good design!');
INSERT INTO `external_texts` VALUES ('poster_2000_desc', 'Suomen kartta');
INSERT INTO `external_texts` VALUES ('poster_1001_desc', 'even walls have ears');
INSERT INTO `external_texts` VALUES ('poster_10_name', 'Lapland Poster');
INSERT INTO `external_texts` VALUES ('poster_21_desc', 'See that halo gleam');
INSERT INTO `external_texts` VALUES ('poster_31_name', 'System of a Ban');
INSERT INTO `external_texts` VALUES ('poster_52_name', 'Hockey Stick');
INSERT INTO `external_texts` VALUES ('poster_2003_desc', 'Would you trust this man?');
INSERT INTO `external_texts` VALUES ('poster_7_desc', 'For emergencies only');
INSERT INTO `external_texts` VALUES ('poster_1002_desc', 'aw, bless...');
INSERT INTO `external_texts` VALUES ('poster_28_desc', '10 x Silver Tinsel');
INSERT INTO `external_texts` VALUES ('poster_502_desc', 'The US flag');
INSERT INTO `external_texts` VALUES ('poster_50_desc', 'flap, flap, screech, screech...');
INSERT INTO `external_texts` VALUES ('poster_515_name', 'The Swedish flag');
INSERT INTO `external_texts` VALUES ('poster_26_name', 'Angel Poster');
INSERT INTO `external_texts` VALUES ('poster_50_name', 'Bat Poster');
INSERT INTO `external_texts` VALUES ('poster_521_name', 'Flag of Brazil');
INSERT INTO `external_texts` VALUES ('poster_511_name', 'The Dutch flag');
INSERT INTO `external_texts` VALUES ('poster_501_name', 'Jolly Roger');
INSERT INTO `external_texts` VALUES ('poster_83_desc', 'PÃƒÂ¶llÃƒÂ¶ huhuilee, huhuu!');
INSERT INTO `external_texts` VALUES ('poster_2004_desc', 'irie!');
INSERT INTO `external_texts` VALUES ('poster_49_name', 'Large silver star');
INSERT INTO `external_texts` VALUES ('poster_520_desc', 'Every colour for everyone');
INSERT INTO `external_texts` VALUES ('poster_41_name', 'Habbo Golden Record');
INSERT INTO `external_texts` VALUES ('poster_45_name', 'Skeleton');
INSERT INTO `external_texts` VALUES ('poster_507_name', 'The French Tricolore');
INSERT INTO `external_texts` VALUES ('poster_35_name', 'The Habbo Babes 1');
INSERT INTO `external_texts` VALUES ('poster_51_desc', '2 points for every basket');
INSERT INTO `external_texts` VALUES ('poster_2005_name', 'Infobus');
INSERT INTO `external_texts` VALUES ('poster_1005_desc', 'The muscly movie hero');
INSERT INTO `external_texts` VALUES ('poster_46_name', 'Small gold star');
INSERT INTO `external_texts` VALUES ('poster_43_desc', 'Shake, rattle and roll');
INSERT INTO `external_texts` VALUES ('poster_23_name', 'Santa Poster');
INSERT INTO `external_texts` VALUES ('poster_2007_desc', 'The legendary founder of the Hotel');
INSERT INTO `external_texts` VALUES ('poster_505_desc', 'The Canadian flag');
INSERT INTO `external_texts` VALUES ('poster_13_name', 'BW Skyline Poster');
INSERT INTO `external_texts` VALUES ('poster_57_desc', 'chinese calligraphy');
INSERT INTO `external_texts` VALUES ('poster_2006_name', 'DJ Throne');
INSERT INTO `external_texts` VALUES ('poster_523_desc', 'The flag of India');
INSERT INTO `external_texts` VALUES ('poster_15_desc', 'Marvellous mountains');
INSERT INTO `external_texts` VALUES ('poster_39_name', 'Screaming Furnies');
INSERT INTO `external_texts` VALUES ('poster_12_desc', 'a beautiful sunset');
INSERT INTO `external_texts` VALUES ('poster_40_name', 'Bonnie Blonde');
INSERT INTO `external_texts` VALUES ('poster_2001_desc', 'Former servant of a great wizard!');
INSERT INTO `external_texts` VALUES ('poster_51_name', 'Basketball Hoop');
INSERT INTO `external_texts` VALUES ('poster_514_desc', 'Be proud to be in the Union!');
INSERT INTO `external_texts` VALUES ('poster_11_desc', 'I obey the Habbo way!');
INSERT INTO `external_texts` VALUES ('poster_1005_name', 'Johnny Squabble');
INSERT INTO `external_texts` VALUES ('poster_22_desc', 'A chilly snowy scene');
INSERT INTO `external_texts` VALUES ('poster_512_name', 'The Irish flag');
INSERT INTO `external_texts` VALUES ('poster_17_name', 'Butterfly Cabinet 1');
INSERT INTO `external_texts` VALUES ('poster_46_desc', 'Twinkle, twinkle');
INSERT INTO `external_texts` VALUES ('messenger.info', 'Choose a friend from Your online friend list and send an instant message or an invite.');
INSERT INTO `external_texts` VALUES ('messenger.error.offline', 'Your friend is not online.');
INSERT INTO `external_texts` VALUES ('messenger.error.sendermuted', 'Your message was not sent because you are muted.');
INSERT INTO `external_texts` VALUES ('messenger.notification.offline', 'Your friend went offline.');
INSERT INTO `external_texts` VALUES ('messenger.notification.online', 'Your friend came online.');
INSERT INTO `external_texts` VALUES ('messenger.title', 'Chat');
INSERT INTO `external_texts` VALUES ('messenger.moderationinfo', 'Sharing your password or personal details online is dangerous. The moderators might monitor these conversations for your safety.');
INSERT INTO `external_texts` VALUES ('messenger.invitation', 'Your friend sent you an invitation:');
INSERT INTO `external_texts` VALUES ('messenger.error.receivermuted', 'Your friend is muted and cannot reply.');
INSERT INTO `external_texts` VALUES ('messenger.error.busy', 'Your friend is busy.');
INSERT INTO `external_texts` VALUES ('messenger.followfriend.tooltip', 'Go to room your friend is currently in');
INSERT INTO `external_texts` VALUES ('messenger.error.notfriend', 'Receiver is not your friend anymore.');
INSERT INTO `external_texts` VALUES ('messenger.minimail.tooltip', 'Send minimail to your friend');
INSERT INTO `external_texts` VALUES ('notifications.text.buyfurni', '%furni_name% bought and delivered to your inventory!');
INSERT INTO `external_texts` VALUES ('notifications.text.friend.online', '%user_name% came online.');
INSERT INTO `external_texts` VALUES ('notifications.text.pixels', '%change% pixels received, you now have %count%.');
INSERT INTO `external_texts` VALUES ('notifications.text.respect.1', 'Respect! You were respected.');
INSERT INTO `external_texts` VALUES ('notifications.text.purchase.ok', 'You successfully purchased a %productName%!');
INSERT INTO `external_texts` VALUES ('notifications.text.receivedcredits', 'You received %count% credits.');
INSERT INTO `external_texts` VALUES ('notifications.text.hcdays', 'You now have %count% days of Habbo Club left.');
INSERT INTO `external_texts` VALUES ('notifications.text.respect.2', 'You now have %count% respect points.');
INSERT INTO `external_texts` VALUES ('notifications.text.achievement', 'You reached level %level% on %badge%. Click here to see your new badge.');
INSERT INTO `external_texts` VALUES ('notifications.text.friend.offline', '%user_name% went offline.');
INSERT INTO `external_texts` VALUES ('connection.error.id.desc', 'Something went wrong when talking with the game server. Received error: %id%');
INSERT INTO `external_texts` VALUES ('connection.login.name', 'Name');
INSERT INTO `external_texts` VALUES ('connection.login.password', 'Password');
INSERT INTO `external_texts` VALUES ('connection.login.title', 'Login');
INSERT INTO `external_texts` VALUES ('connection.login.login', 'Login');
INSERT INTO `external_texts` VALUES ('connection.login.error.-400.desc', 'Connecting to the server failed');
INSERT INTO `external_texts` VALUES ('connection.login.useTicket', 'Use SSO Ticket');
INSERT INTO `external_texts` VALUES ('connection.error.id.title', 'Error');
INSERT INTO `external_texts` VALUES ('connection.login.error.-3.desc', 'Authentication failed');
INSERT INTO `external_texts` VALUES ('generic.ok', 'Ok');
INSERT INTO `external_texts` VALUES ('generic.close', 'Close');
INSERT INTO `external_texts` VALUES ('generic.cancel', 'Cancel');
INSERT INTO `external_texts` VALUES ('generic.back', 'Back');
INSERT INTO `external_texts` VALUES ('generic.search', 'Search');
INSERT INTO `external_texts` VALUES ('catalog.purchase.confirmation.dialog.remaining', 'You will have %remaining% in your Purse after purchasing this.');
INSERT INTO `external_texts` VALUES ('catalog.purchase.confirmation.dialog.costs', '%offer_name% costs %price%.');
INSERT INTO `external_texts` VALUES ('ctlg_spaces_wall', 'Wall');
INSERT INTO `external_texts` VALUES ('purse_coins', 'Credits');
INSERT INTO `external_texts` VALUES ('catalog.alert.published.title', 'Refresh your catalogue and open it again.');
INSERT INTO `external_texts` VALUES ('catalog.purchase.confirmation.dialog.amount', 'You have %amount%.');
INSERT INTO `external_texts` VALUES ('catalog.voucher.empty.title', 'Voucher code missing');
INSERT INTO `external_texts` VALUES ('catalog_selectproduct', 'Select an item');
INSERT INTO `external_texts` VALUES ('catalog.alert.notenough.title', 'Not enough credits');
INSERT INTO `external_texts` VALUES ('cancel', 'Cancel');
INSERT INTO `external_texts` VALUES ('shopping_asagift', 'Gift this to another user');
INSERT INTO `external_texts` VALUES ('catalog.purchase.price.pixels', '%pixels% pixels');
INSERT INTO `external_texts` VALUES ('catalog.alert.voucherredeem.ok.title', 'Voucher processed');
INSERT INTO `external_texts` VALUES ('purse_buy_coins', 'Buy Credits');
INSERT INTO `external_texts` VALUES ('ctlg_spaces_colour', 'Colour');
INSERT INTO `external_texts` VALUES ('catalog.purchase.confirmation.dialog.buyasgift.gre', 'Type your greetings here (don\'t forget to put your name!):');
INSERT INTO `external_texts` VALUES ('ctlg_spaces_floor', 'Floor');
INSERT INTO `external_texts` VALUES ('catalog_giftfor', 'Gift recipient');
INSERT INTO `external_texts` VALUES ('catalog.purchase.price.credits+pixels', '%credits% credit(s) + %pixels% pixels');
INSERT INTO `external_texts` VALUES ('catalog.alert.purchaseerror.title', 'There was an error with your purchase. Try again.');
INSERT INTO `external_texts` VALUES ('ctlg_spaces_preview', 'Preview');
INSERT INTO `external_texts` VALUES ('catalog.alert.notenough.pixels.description', 'You don\'t have enough pixels.');
INSERT INTO `external_texts` VALUES ('catalog.alert.voucherredeem.error.description', 'We could not process your voucher code. Please retry and check the spelling extra carefully.');
INSERT INTO `external_texts` VALUES ('catalog.purchase.confirmation.dialog.price.none', 'Nothing');
INSERT INTO `external_texts` VALUES ('catalog.alert.published.description', 'Something new has been added to the catalogue.');
INSERT INTO `external_texts` VALUES ('purse_voucherbutton', 'Redeem Credits');
INSERT INTO `external_texts` VALUES ('catalog.purchase.price.none', 'Free!');
INSERT INTO `external_texts` VALUES ('catalog.alert.notenough.credits.description', 'You do not have enough credits to purchase this item.');
INSERT INTO `external_texts` VALUES ('ctlg_spaces_landscape', 'Landscape');
INSERT INTO `external_texts` VALUES ('catalog.alert.voucherredeem.ok.description', 'Voucher process succeeded! Credit balance updated.');
INSERT INTO `external_texts` VALUES ('catalog.voucher.empty.desc', 'You didn\'t seem to enter a voucher code');
INSERT INTO `external_texts` VALUES ('buy', 'Buy');
INSERT INTO `external_texts` VALUES ('catalog_typeurname', 'Please type your name');
INSERT INTO `external_texts` VALUES ('catalog.alert.external.link.title', 'Link to the website');
INSERT INTO `external_texts` VALUES ('catalog.alert.purchasenotallowed.hc.description', 'You have to be in the Habbo Club to be able to buy this.');
INSERT INTO `external_texts` VALUES ('catalog.purchase.price.credits', '%credits% credit(s)');
INSERT INTO `external_texts` VALUES ('credits', 'Credits');
INSERT INTO `external_texts` VALUES ('catalog.purchase.confirmation.dialog.price.pixels', '%pixels% pixels');
INSERT INTO `external_texts` VALUES ('catalog.alert.notenough.creditsandpixels.descripti', 'You don\'t have enough credits and pixels to purchase this item.');
INSERT INTO `external_texts` VALUES ('redeem', 'Redeem');
INSERT INTO `external_texts` VALUES ('buy_andwear', 'Buy and wear');
INSERT INTO `external_texts` VALUES ('catalog.alert.external.link.desc', 'Link opens to a webpage');
INSERT INTO `external_texts` VALUES ('catalog.alert.voucherredeem.error.title', 'Error processing voucher');
INSERT INTO `external_texts` VALUES ('catalog.purchase.confirmation.dialog.price.credits', '%credits% credit(s) + %pixels% pixels');
INSERT INTO `external_texts` VALUES ('catalog.purchase.confirmation.dialog.price.credits', '%credits% credit(s)');
INSERT INTO `external_texts` VALUES ('catalog.alert.purchasenotallowed.title', 'Sorry, this item cannot be bought.');
INSERT INTO `external_texts` VALUES ('purse_youhave', 'You have');
INSERT INTO `external_texts` VALUES ('catalog.alert.purchasenotallowed.unknown.descripti', 'Sorry, but you are doing something illegal.');
INSERT INTO `external_texts` VALUES ('catalog.alert.purchaseerror.description', 'There was a problem processing your purchase. Please retry.');
INSERT INTO `external_texts` VALUES ('catalog.purchase.confirmation.dialog.buyasgift.che', 'This is a gift for:');
INSERT INTO `external_texts` VALUES ('ctlg_spaces_pattern', 'Pattern');
INSERT INTO `external_texts` VALUES ('friendlist.search.friendscaption', 'Friends (%cnt%)  :');
INSERT INTO `external_texts` VALUES ('friendlist.tip.remove', 'Remove friend');
INSERT INTO `external_texts` VALUES ('friendlist.requests.acceptall', 'Accept all');
INSERT INTO `external_texts` VALUES ('friendlist.tip.mail', 'Send minimail');
INSERT INTO `external_texts` VALUES ('friendlist.friends.offlinecaption', 'Offline Friends');
INSERT INTO `external_texts` VALUES ('friendlist.tip.home', 'Home page');
INSERT INTO `external_texts` VALUES ('friendlist.invite.summary', 'Inviting %count% people to this room.');
INSERT INTO `external_texts` VALUES ('friendlist.weblinkinfo', 'Link opened to web page');
INSERT INTO `external_texts` VALUES ('friendlist.request.accepted', 'Accepted');
INSERT INTO `external_texts` VALUES ('friendlist.alert.title', 'Notice!');
INSERT INTO `external_texts` VALUES ('friendlist.followerror.notfriend', 'The user you tried to follow is not on your friend list anymore, so you cannot follow him/her.');
INSERT INTO `external_texts` VALUES ('friendlist.tip.follow', 'Follow');
INSERT INTO `external_texts` VALUES ('friendlist.friendrequestsent.title', 'Notice!');
INSERT INTO `external_texts` VALUES ('friendlist.tip.preferences', 'Edit categories');
INSERT INTO `external_texts` VALUES ('friendlist.tip.compose', 'Send minimail');
INSERT INTO `external_texts` VALUES ('friendlist.followerror.hotelview', 'Your friend is currently not in any room, so you cannot follow him/her.');
INSERT INTO `external_texts` VALUES ('friendlist.removefriendconfirm.title', 'Confirm remove');
INSERT INTO `external_texts` VALUES ('friendlist.settings', 'Settings');
INSERT INTO `external_texts` VALUES ('friendlist.followerror.offline', 'Your friend is offline.');
INSERT INTO `external_texts` VALUES ('friendlist.tip.invite', 'Invite friends');
INSERT INTO `external_texts` VALUES ('friendlist.tip.addfriend', 'Send friend request');
INSERT INTO `external_texts` VALUES ('friendlist.tip.decline', 'Decline');
INSERT INTO `external_texts` VALUES ('friendlist.friendrequestsent.text', '%user_name% has been sent your Friend Request. (S)he will be added into your Friends List if (s)he accepts it.');
INSERT INTO `external_texts` VALUES ('friendlist.tip.declineall', 'Decline all');
INSERT INTO `external_texts` VALUES ('friendlist.invite.send', 'Send');
INSERT INTO `external_texts` VALUES ('friendlist.tip.im', 'Send a message');
INSERT INTO `external_texts` VALUES ('friendlist.requests.dismissall', 'Decline all');
INSERT INTO `external_texts` VALUES ('friendlist.invite.emptyalert.text', 'Invite friends to this room:');
INSERT INTO `external_texts` VALUES ('friendlist.request.declined', 'Declined');
INSERT INTO `external_texts` VALUES ('friendlist.tip.tab.2', 'Friend requests');
INSERT INTO `external_texts` VALUES ('friendlist.tip.searchstr', 'Enter search');
INSERT INTO `external_texts` VALUES ('friendlist.tab.friendrequests', 'Friend Requests');
INSERT INTO `external_texts` VALUES ('friendlist.avatarpopup.lastaccess', 'Last visit: %last_access%');
INSERT INTO `external_texts` VALUES ('friendlist.tip.inbox', 'Minimail inbox');
INSERT INTO `external_texts` VALUES ('friendlist.friends', 'Friends');
INSERT INTO `external_texts` VALUES ('friendlist.tip.search', 'Search users');
INSERT INTO `external_texts` VALUES ('friendlist.search.noothersfound', 'No users found');
INSERT INTO `external_texts` VALUES ('friendlist.requests.norequests', 'No friend requests');
INSERT INTO `external_texts` VALUES ('friendlist.invite.note', 'Make sure you can be followed.');
INSERT INTO `external_texts` VALUES ('friendlist.followerror.prevented', 'Your friend has prevented others from following him/her.');
INSERT INTO `external_texts` VALUES ('friendlist.listfull.title', 'Notice!');
INSERT INTO `external_texts` VALUES ('friendlist.tip.accept', 'Accept');
INSERT INTO `external_texts` VALUES ('friendlist.search.nofriendsfound', 'No friends found');
INSERT INTO `external_texts` VALUES ('friendlist.avatarpopup.online', 'Online');
INSERT INTO `external_texts` VALUES ('friendlist.listfull.text', 'Your friend list contains the maximum of %mylimit% Habbos, so you cannot add any more friends to the list. Members of Habbo Club can have up to %clublimit% friends in their list.');
INSERT INTO `external_texts` VALUES ('friendlist.tip.tab.1', 'Your friends');
INSERT INTO `external_texts` VALUES ('friendlist.search.otherscaption', 'Other Habbos (%cnt%) :');
INSERT INTO `external_texts` VALUES ('friendlist.removefriendconfirm.userlist', 'Remove friends: %user_names%?');
INSERT INTO `external_texts` VALUES ('friendlist.invite.title', 'Invitation');
INSERT INTO `external_texts` VALUES ('friendlist.tip.acceptall', 'Accept all');
INSERT INTO `external_texts` VALUES ('friendlist.invite.emptyalert.title', 'Notice!');
INSERT INTO `external_texts` VALUES ('friendlist.request.failed', 'Failed');
INSERT INTO `external_texts` VALUES ('friendlist.tip.tab.3', 'Search for Habbos');
INSERT INTO `external_texts` VALUES ('toolbar.icon.tooltip.help', 'Help');
INSERT INTO `external_texts` VALUES ('toolbar.icon.tooltip.roominfo', 'Information of the room you are currently in');
INSERT INTO `external_texts` VALUES ('toolbar.icon.tooltip.catalogue', 'Catalogue for shopping with your credits and pixels');
INSERT INTO `external_texts` VALUES ('toolbar.icon.tooltip.friendlist', 'View and follow your friends');
INSERT INTO `external_texts` VALUES ('toolbar.icon.tooltip.memenu', 'Dance, wave, use effects, show badges, change clothes and check your rooms');
INSERT INTO `external_texts` VALUES ('toolbar.icon.tooltip.settings', 'Settings');
INSERT INTO `external_texts` VALUES ('toolbar.icon.tooltip.inventory', 'Your furniture, effects, badges and achievements');
INSERT INTO `external_texts` VALUES ('toolbar.icon.tooltip.zoom', 'Zoom the room view in and out');
INSERT INTO `external_texts` VALUES ('toolbar.icon.tooltip.navigator', 'Rooms and events');
INSERT INTO `external_texts` VALUES ('toolbar.icon.tooltip.messenger', 'Send messages to your friends');
INSERT INTO `external_texts` VALUES ('widget.furni.ecotronbox.open', 'Open the Ecotron box');
INSERT INTO `external_texts` VALUES ('widgets.memenu.effects.active.timeleft', '%time_left%');
INSERT INTO `external_texts` VALUES ('widget.memenu.moreeffects', 'Buy more');
INSERT INTO `external_texts` VALUES ('widget.memenu.activeeffects', 'Activate and use effects');
INSERT INTO `external_texts` VALUES ('widget.furni.ecotronbox.title', 'Ecotron box');
INSERT INTO `external_texts` VALUES ('widget.memenu.dance4', 'The Rollie');
INSERT INTO `external_texts` VALUES ('widget.memenu.back', 'Back');
INSERT INTO `external_texts` VALUES ('widgets.chatinput.mode.speak', ':speak');
INSERT INTO `external_texts` VALUES ('widgets.furniture.credit.redeem.value', 'This bag or bar contains %value% credits, you can redeem it now.');
INSERT INTO `external_texts` VALUES ('widgets.chatinput.mode.whisper', ':tell');
INSERT INTO `external_texts` VALUES ('widget.memenu.myrooms', 'My Rooms');
INSERT INTO `external_texts` VALUES ('widgets.doorbell.title', 'Doorbell');
INSERT INTO `external_texts` VALUES ('widget.memenu.clothes.add', 'Save outfits in the clothes editor and they\'ll appear here');
INSERT INTO `external_texts` VALUES ('widget.memenu.dance', 'Dance');
INSERT INTO `external_texts` VALUES ('widget.furni.present.open', 'Open the present');
INSERT INTO `external_texts` VALUES ('widget.memenu.editavatar', 'Change clothes');
INSERT INTO `external_texts` VALUES ('widget.memenu.dance3', 'Duck Funk');
INSERT INTO `external_texts` VALUES ('widget.furni.trophy.title', 'Trophy');
INSERT INTO `external_texts` VALUES ('widget.memenu.myclothes', 'My Clothes');
INSERT INTO `external_texts` VALUES ('widget.memenu.wave', 'Wave');
INSERT INTO `external_texts` VALUES ('widget.memenu.effects.info', 'You don\'t have any active effects.\r\n');
INSERT INTO `external_texts` VALUES ('widgets.chatinput.mode.shout', ':shout');
INSERT INTO `external_texts` VALUES ('widget.memenu.effects', 'My effects');
INSERT INTO `external_texts` VALUES ('widget.memenu.dance.stop', 'Stop Dancing');
INSERT INTO `external_texts` VALUES ('widget.memenu.dance.clubinfo', 'Join Habbo Club to get more dance moves.');
INSERT INTO `external_texts` VALUES ('widget.memenu.dance1', 'Dance');
INSERT INTO `external_texts` VALUES ('widget.memenu.dance2', 'Pogo Mogo');
INSERT INTO `external_texts` VALUES ('widget.memenu.badges', 'My badges');
INSERT INTO `external_texts` VALUES ('widget.memenu.clothes.info', 'Join Habbo Club to quickly choose outfits in this menu.');
INSERT INTO `external_texts` VALUES ('widget.furni.present.title', 'Present');
INSERT INTO `external_texts` VALUES ('widgets.chatinput.default', 'Click here to chat...');
INSERT INTO `external_texts` VALUES ('widgets.doorbell.info', 'Following users are ringing the doorbell:');
INSERT INTO `external_texts` VALUES ('roomevent_type_2', 'Trading');
INSERT INTO `external_texts` VALUES ('roomevent_default_name', 'Event name..');
INSERT INTO `external_texts` VALUES ('roomevent_not_available', 'Sorry, no events available');
INSERT INTO `external_texts` VALUES ('roomevent_type_0', 'Hottest Events');
INSERT INTO `external_texts` VALUES ('roomevent_type_6', 'Grand Openings');
INSERT INTO `external_texts` VALUES ('roomevent_default_description', 'Come and check out my event!');
INSERT INTO `external_texts` VALUES ('roomevent_type_5', 'Debates & Discussion');
INSERT INTO `external_texts` VALUES ('roomevent_default_desc', 'Event description..');
INSERT INTO `external_texts` VALUES ('roomevent_quit', 'End event');
INSERT INTO `external_texts` VALUES ('roomevent_type_1', 'Parties & Music');
INSERT INTO `external_texts` VALUES ('roomevent_browser_title', 'Events');
INSERT INTO `external_texts` VALUES ('roomevent_create', 'Create');
INSERT INTO `external_texts` VALUES ('roomevent_create_name', 'Type the name of your event');
INSERT INTO `external_texts` VALUES ('roomevent_type_9', 'Group Events');
INSERT INTO `external_texts` VALUES ('roomevent_type_8', 'Jobs');
INSERT INTO `external_texts` VALUES ('roomevent_host', 'Host:');
INSERT INTO `external_texts` VALUES ('roomevent_type_11', 'Helpdesk');
INSERT INTO `external_texts` VALUES ('roomevent_type_7', 'Dating');
INSERT INTO `external_texts` VALUES ('roomevent_type_10', 'Performance');
INSERT INTO `external_texts` VALUES ('roomevent_type_3', 'Games');
INSERT INTO `external_texts` VALUES ('roomevent_browser_create', 'Host an event');
INSERT INTO `external_texts` VALUES ('roomevent_starttime', 'Started at:');
INSERT INTO `external_texts` VALUES ('interface_icon_events', 'Open the room event browser');
INSERT INTO `external_texts` VALUES ('roomevent_invalid_input', 'You must give your event a name and a description.');
INSERT INTO `external_texts` VALUES ('roomevent_create_description', 'Describe your event');
INSERT INTO `external_texts` VALUES ('roomevent_edit', 'Edit');
INSERT INTO `external_texts` VALUES ('roomevent_type_4', 'Habbo Guides\' Events');
INSERT INTO `external_texts` VALUES ('chat.history.drag.tooltip', 'Drag this to display chat history');
INSERT INTO `external_texts` VALUES ('chat.input.alert.flood', 'You\'re typing too fast, don\'t flood the room! - %time% seconds remaining');
INSERT INTO `external_texts` VALUES ('infostand.button.rotate', 'Rotate');
INSERT INTO `external_texts` VALUES ('widgets.memenu.effects.activate', 'Activate');
INSERT INTO `external_texts` VALUES ('infostand.button.friend', 'Ask to be a friend');
INSERT INTO `external_texts` VALUES ('widgets.memenu.effects.active.timeleft', '%time_left%');
INSERT INTO `external_texts` VALUES ('infostand.button.removerights', 'Remove rights');
INSERT INTO `external_texts` VALUES ('infostand.button.move', 'Move');
INSERT INTO `external_texts` VALUES ('infostand.button.pickup', 'Pick up');
INSERT INTO `external_texts` VALUES ('infostand.button.ignore', 'Shut up');
INSERT INTO `external_texts` VALUES ('infostand.button.trade', 'Trade');
INSERT INTO `external_texts` VALUES ('infostand.button.giverights', 'Give rights');
INSERT INTO `external_texts` VALUES ('infostand.button.respect', 'Give respect (%count%)');
INSERT INTO `external_texts` VALUES ('infostand.button.ban', 'Ban');
INSERT INTO `external_texts` VALUES ('infostand.text.xp', 'Monthly XP: %xp%');
INSERT INTO `external_texts` VALUES ('infostand.button.kick', 'Kick');
INSERT INTO `external_texts` VALUES ('infostand.button.unignore', 'Listen');
INSERT INTO `external_texts` VALUES ('badge_desc_XMA', 'Penguin Competition winner 2008!');
INSERT INTO `external_texts` VALUES ('badge_name_HX7', 'Habbo eXpert');
INSERT INTO `external_texts` VALUES ('badge_name_AC2', 'Bensalem Tribe Member');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_EmailVerification1', 'For activating your email address and for making it easier to return your password. Worth 200 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_Login1', 'Traveler');
INSERT INTO `external_texts` VALUES ('badge_desc_WH6', 'Awarded to competition winners during Habboween 2008.');
INSERT INTO `external_texts` VALUES ('badge_name_XM1', 'Rasta Santa');
INSERT INTO `external_texts` VALUES ('badge_desc_HF1', 'I was a member of the Habbo Dream Team 2006!');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_GamePlayed10', 'Battle Royal X');
INSERT INTO `external_texts` VALUES ('badge_name_Z04', 'Save Polar Bears');
INSERT INTO `external_texts` VALUES ('badge_name_HX5', 'Habbo eXpert');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_AllTimeHotelPresence9', 'Level 9 - spending total of 1152 hours in hotel. Worth 20 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_DK6', 'Camp Rock Guitar Green');
INSERT INTO `external_texts` VALUES ('badge_desc_Z51', 'Winner of a 17 Again competition');
INSERT INTO `external_texts` VALUES ('badge_desc_WH4', 'Habboween competition /event winner.');
INSERT INTO `external_texts` VALUES ('badge_name_U02', 'Idea Agency competition winner!');
INSERT INTO `external_texts` VALUES ('badge_name_WH8', 'HABBOTICS Pharm.');
INSERT INTO `external_texts` VALUES ('badge_name_HX3', 'Habbo eXpert');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_GamePlayed5', 'Level 5 - For playing and winning Snow Storm or for the game of Battle Ball 100 times. Worth 100 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_Z65', 'Charlie Girl Chic Sleepover competition winner');
INSERT INTO `external_texts` VALUES ('badge_desc_CY3', 'Awarded to owners of trials that MeiLing failed. CNY 2009');
INSERT INTO `external_texts` VALUES ('badge_desc_Z58', 'Official Habbo Museum security guard');
INSERT INTO `external_texts` VALUES ('badge_name_NEC', 'HMF Golden Glitterball');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_AllTimeHotelPresence9', 'Online time IX-Tornado');
INSERT INTO `external_texts` VALUES ('badge_name_KO1', 'Koala Face');
INSERT INTO `external_texts` VALUES ('badge_desc_UKH', 'Dark is Rising sign of stone. 2007.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_AIPerformanceVote4', 'Noteworthy');
INSERT INTO `external_texts` VALUES ('badge_desc_Z32', 'I took a stand against knife crime');
INSERT INTO `external_texts` VALUES ('badge_desc_UK2', 'The sole champion of the Always Salon in 2006.');
INSERT INTO `external_texts` VALUES ('badge_desc_PIR', 'Arrr! Pirate competition winner May 2006.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_Student1', 'Habbo Student');
INSERT INTO `external_texts` VALUES ('badge_name_Z29', 'Blue Insider');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_Login8', 'Level 8 - For logging in 80 days in a row. Sensational. Worth 200 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_NEI', 'HMF:Neon Epic Party Winner');
INSERT INTO `external_texts` VALUES ('badge_desc_HM1', 'Built a room for the Habbo Mall 2009');
INSERT INTO `external_texts` VALUES ('badge_desc_UKF', 'Dark is Rising sign of iron. 2007.');
INSERT INTO `external_texts` VALUES ('badge_name_Z20', 'IGOR TEST TUBES');
INSERT INTO `external_texts` VALUES ('badge_name_VA7', 'Small Shalimar');
INSERT INTO `external_texts` VALUES ('badge_name_Z64', 'Official BETA tester');
INSERT INTO `external_texts` VALUES ('badge_desc_Z30', 'Awarded to all winners and runners up of the pumpkin design competition. October 2008.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_GamePlayed1', 'Level 1 - For playing and winning Snow Storm or for the game of Battle Ball. Worth 10 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_OL2', 'Habbolympic Silver');
INSERT INTO `external_texts` VALUES ('badge_desc_Z18', 'Against cervical cancer campaign supporter.');
INSERT INTO `external_texts` VALUES ('badge_name_WTM', 'Safe Surfer');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_Motto1', 'Master of Words');
INSERT INTO `external_texts` VALUES ('badge_desc_UK4', 'Habbo Council member. The Habbo Council postponed all future meetings from June 2006.');
INSERT INTO `external_texts` VALUES ('badge_name_DU1', 'Gold Habbowealth');
INSERT INTO `external_texts` VALUES ('badge_name_UKA', 'Summer Resort');
INSERT INTO `external_texts` VALUES ('badge_name_ST3', 'Energy Analyst');
INSERT INTO `external_texts` VALUES ('badge_name_CL1', 'Idea Agency competition runner-up!');
INSERT INTO `external_texts` VALUES ('badge_desc_UKD', 'Adventure Story competition winner 2007.');
INSERT INTO `external_texts` VALUES ('badge_desc_Z35', 'Friday\'s Official Friend');
INSERT INTO `external_texts` VALUES ('badge_desc_HJ5', 'Winner of the Harajuku Lovers quest');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RespectGiven1', 'For giving respect 100 times.  Worth 20 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_UKC', 'Habbo Journalist');
INSERT INTO `external_texts` VALUES ('badge_desc_AR2', 'Alhambra Prize Winner 2008');
INSERT INTO `external_texts` VALUES ('badge_name_HX9', 'Habbo eXpert');
INSERT INTO `external_texts` VALUES ('badge_name_UKQ', 'St Trinian\'s Head Boy');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_MGM9', 'Level 9 - For creating your own fellowship - party of 16.  For inviting two more real life friends to Habbo. Worth 180 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_ST2', 'You need Science and Maths skills for this job!');
INSERT INTO `external_texts` VALUES ('badge_desc_VIP', 'Celebrity guests and special visitors.');
INSERT INTO `external_texts` VALUES ('badge_name_Z58', 'Museum Security');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_GamePlayed7', 'Level 7 - For playing and winning Snow Storm or game of Battle Ball 200 times. Worth 150 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_HX9', 'X Leader');
INSERT INTO `external_texts` VALUES ('badge_desc_DN2', 'Roadtrip USA 5 Points 2008.');
INSERT INTO `external_texts` VALUES ('badge_name_EC4', 'HabboSphere Contributor');
INSERT INTO `external_texts` VALUES ('badge_desc_UKQ', 'Winner of St Trinians Head Boy competition.');
INSERT INTO `external_texts` VALUES ('badge_name_UK6', 'Billboard Designer');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_MGM7', 'Housewarming');
INSERT INTO `external_texts` VALUES ('badge_desc_HX7', 'Gold Tech eXpert');
INSERT INTO `external_texts` VALUES ('badge_name_XM3', 'Xmas Reindeer');
INSERT INTO `external_texts` VALUES ('badge_desc_DN4', 'Roadtrip USA 5 Points 2008.');
INSERT INTO `external_texts` VALUES ('badge_desc_Z02', 'Earth week competition winner.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RegistrationDuration10', 'Level 10 - For true Habbos who have been members of the community for 5 years. Worth 200 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_FRG', 'Ultimate Bobba Champ');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_Login7', 'Space dust on your shoes');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_AllTimeHotelPresence7', 'Level 7 - spending total of 288 hours in hotel. Worth 20 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_EC2', 'Melting Ice Caps Survivor');
INSERT INTO `external_texts` VALUES ('badge_desc_SB7', 'Winner of a Habbo Hood gang competition. September 2008');
INSERT INTO `external_texts` VALUES ('badge_name_UKO', 'Habbo Seeker');
INSERT INTO `external_texts` VALUES ('badge_name_HX1', 'Habbo eXpert');
INSERT INTO `external_texts` VALUES ('badge_desc_Z16', 'My Spy Family quest 3 winner.');
INSERT INTO `external_texts` VALUES ('badge_name_UK8', 'NSPCC');
INSERT INTO `external_texts` VALUES ('badge_name_Z18', 'HPV');
INSERT INTO `external_texts` VALUES ('badge_name_ST5', 'Sports Technologist');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_MGM9', 'Fiesta');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_Login3', 'Frequent Resident');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RoomEntry7', 'Level 7 - For hanging out in 120 Guest Rooms  that you do not own .Gold digger. 20 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_AllTimeHotelPresence5', 'Level 5 - spending total of 48 hours in hotel. Worth 20 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_NEI', 'HMF: Neon Club Winner');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RespectEarned2', 'Been respected 6 times.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_AllTimeHotelPresence3', 'Online time III-Dust Devil');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_AllTimeHotelPresence3', 'Level 3 - spending total of 8 hours in hotel. Worth 20 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_HJ4', 'Harajuku Lovers Love');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_GamePlayed9', 'Level 9 - For playing and winning Snow Storm or the game of Battle Ball 360 times. Worth 280 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_GamePlayed3', 'Level 3 - For playing and winning Snow Storm or for the game of Battle Ball 20 times. Worth 50 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_SB3', 'Shabbolins gang member on the Streets Of Bobba September 2006.');
INSERT INTO `external_texts` VALUES ('badge_desc_Z28', 'Awarded to The Insiders poll and quest winners. October 2008.');
INSERT INTO `external_texts` VALUES ('badge_name_HBA', 'Gold Hobba');
INSERT INTO `external_texts` VALUES ('badge_name_UKK', 'Fantastic4 Bronze');
INSERT INTO `external_texts` VALUES ('badge_desc_UKZ', 'Awarded to fashion designers during Fashion Week 2008.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_TraderPass1', 'Trader\'s Pass');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_Graduate1', 'For completing your confusing Habbo newbie experience. Worth 20 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RespectEarned4', 'Been respected 66 times.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RoomEntry5', 'Vacationer');
INSERT INTO `external_texts` VALUES ('badge_name_CO5', 'YTH Village Owner');
INSERT INTO `external_texts` VALUES ('badge_name_VA2', 'Valentine Heart');
INSERT INTO `external_texts` VALUES ('badge_desc_YAK', 'Awarded for competitions during Japanese Sushi campaign.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_MGM8', 'Level 8 - For creating your own fellowship - party of 14.  For For inviting two more real life friends to Habbo. Worth 170 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_Z36', 'Hotel For Dogs 1* Resort Owner');
INSERT INTO `external_texts` VALUES ('badge_desc_UKB', 'Murder mystery play writing competition winner 2007.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RegistrationDuration8', 'Level 8 - For true Habbos who have been members of the community for 3 years. Worth 200 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_Login4', 'Level 4 - For logging in 28 days in a row. Scary. Worth 150 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_UKS', 'Perfect Prefect');
INSERT INTO `external_texts` VALUES ('badge_name_Z31', 'HMF: Neon Artist');
INSERT INTO `external_texts` VALUES ('badge_desc_VA3', 'Awarded to competition winners during Valentine\'s 2008.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RoomEntry3', 'Ultimate Room Raider');
INSERT INTO `external_texts` VALUES ('badge_desc_TC1', 'BattleBall Challenge involved being in the top 20 highscores for 15 weeks in a row!');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_MGM6', 'Level 6 - For creating your own fellowship - party of 10. For inviting two more real life friends to Habbo. Worth 150 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_FAN', 'Official Fansite Staff');
INSERT INTO `external_texts` VALUES ('badge_desc_Z14', 'My Spy Family quest 2 winner.');
INSERT INTO `external_texts` VALUES ('badge_desc_U06', 'Winning a Habbo Raceway Grand Prix.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RegistrationDuration6', 'Level 6 - For true Habbos who have been members of the community for a year. Worth 200 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RegistrationDuration4', '40 % True Habbo');
INSERT INTO `external_texts` VALUES ('badge_name_Z38', 'Hotel For Dogs 3* Resort Owner');
INSERT INTO `external_texts` VALUES ('badge_name_UKU', 'Theme Park Clown');
INSERT INTO `external_texts` VALUES ('badge_name_GLF', 'Lynx');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_AllTimeHotelPresence5', 'Online time V- Haze');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_HappyHour1', 'Happy Hour');
INSERT INTO `external_texts` VALUES ('badge_name_SB2', 'Bobbaschi');
INSERT INTO `external_texts` VALUES ('badge_name_Z32', 'It Doesn\'t Have To Happen');
INSERT INTO `external_texts` VALUES ('badge_desc_SU2', 'Lvl2 Tiki Competition winner. Middle award. Summer 2008.');
INSERT INTO `external_texts` VALUES ('badge_name_UKM', 'Fantastic4 Gold');
INSERT INTO `external_texts` VALUES ('badge_name_SU2', 'Medium Tiki Mana');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_GamePlayed4', 'Battle Royal IV');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RegistrationDuration2', 'Level 2 - For true Habbos who have been members of the community for 3 weeks. Worth 60 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RegistrationDuration10', '100% True Habbo');
INSERT INTO `external_texts` VALUES ('badge_desc_FRG', 'Ultimate Bobba Wrestling Champion 2008. Kick Wars competition.');
INSERT INTO `external_texts` VALUES ('badge_name_U06', 'Habbo Raceway GP');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RoomEntry9', 'Level 9 - For hanging out in 160 Guest Rooms  that you do not own. Spaceman. Worth 30 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RespectEarned6', 'Level 6 - For earning respect a further 200 times.  Worth 200 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_AllTimeHotelPresence1', 'Online time I-Thunderstorm');
INSERT INTO `external_texts` VALUES ('badge_name_WH6', 'Virus Ooze');
INSERT INTO `external_texts` VALUES ('badge_desc_DU1', 'Habbowealth Games 2005.');
INSERT INTO `external_texts` VALUES ('badge_desc_DSX', 'Roadtrip USA Room Winner 2008.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_AllTimeHotelPresence1', 'Level 1 - spending total of 1 hour in hotel. Worth 30 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_WTM', 'Way too much information!');
INSERT INTO `external_texts` VALUES ('badge_desc_WH2', 'Habboween competition /event winner.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RespectEarned8', 'Level 8 - For earning respect a further 200 times.  Worth 200 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_Z63', 'Helped shape the new Habbo June 2009');
INSERT INTO `external_texts` VALUES ('badge_name_Z60', 'The Golden Tablet');
INSERT INTO `external_texts` VALUES ('badge_desc_ST5', 'You need Science and Maths skills for this job!');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RegistrationDuration6', '60 % True Habbo');
INSERT INTO `external_texts` VALUES ('badge_name_AF1', 'April Fools Day 2009');
INSERT INTO `external_texts` VALUES ('badge_desc_AC4', 'Used the inner Spirit Eagle to find the Lost Tribe of Bensalem');
INSERT INTO `external_texts` VALUES ('badge_name_SNW', 'SnowStorm HOF');
INSERT INTO `external_texts` VALUES ('badge_name_UKX', 'St Trinian\'s Quiz');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RespectEarned4', 'Level 4 - For earning respect a further 50 times.  Worth 50 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_UKI', 'Water Sign');
INSERT INTO `external_texts` VALUES ('badge_name_NWB', 'Silver Hobba');
INSERT INTO `external_texts` VALUES ('badge_name_UKE', 'Bronze Sign');
INSERT INTO `external_texts` VALUES ('badge_name_MD1', 'Meet Dave Quiz');
INSERT INTO `external_texts` VALUES ('badge_name_Z17', 'Hairspray Talent');
INSERT INTO `external_texts` VALUES ('badge_name_HJ2', 'Harajuku Lovers G');
INSERT INTO `external_texts` VALUES ('badge_desc_UKS', 'Winner of the St Trinians perfect prefect competition.');
INSERT INTO `external_texts` VALUES ('badge_desc_Z24', 'Official evil scientist! Maximum level. October 2008.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_GamePlayed6', 'Battle Royal VI');
INSERT INTO `external_texts` VALUES ('badge_desc_AC2', 'Initiated through the Totem bases of fire GREEN');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_Login5', 'A Piece Of The Furniture');
INSERT INTO `external_texts` VALUES ('badge_name_UKG', 'Fire Sign');
INSERT INTO `external_texts` VALUES ('badge_remove', 'Clear');
INSERT INTO `external_texts` VALUES ('badge_desc_Z45', 'HAFTAS Winner 2007');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RegistrationDuration4', 'Level 4 - For true Habbos who have been members of the community for 16 weeks. Worth 120 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_FAN', 'Official Fansite representative. Check out the Official fansite rooms on the upper floors of the Habbo Mall.');
INSERT INTO `external_texts` VALUES ('badge_name_Z15', 'Evil Bot Affair');
INSERT INTO `external_texts` VALUES ('badge_desc_GRR', 'The Gorillaz visited Habbo in 2005!');
INSERT INTO `external_texts` VALUES ('badge_desc_MD2', 'Awarded to winners of the Meet Dave body building competition. 2008.');
INSERT INTO `external_texts` VALUES ('badge_name_HJ6', 'Harajuku Lovers Lil\' Angel');
INSERT INTO `external_texts` VALUES ('badge_desc_Z01', 'Habbo Fashion Week 2008 competition winner.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_AllTimeHotelPresence7', 'Online time VII-  Cyclone');
INSERT INTO `external_texts` VALUES ('badge_name_XXX', 'Habbo eXpert');
INSERT INTO `external_texts` VALUES ('badge_name_DN3', 'Green Fuel Flag');
INSERT INTO `external_texts` VALUES ('badge_desc_HJ3', 'Harajuku Lovers Baby');
INSERT INTO `external_texts` VALUES ('badge_desc_UKW', 'Theme Park team competition winner. 2008');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_HappyHour1', 'For spending a Happy moment in Habbo! Log in on Happy Hour to receive this achievement. Worth 100 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_HC2', 'HC Club membership II');
INSERT INTO `external_texts` VALUES ('badge_name_DS7', 'Green Tea Elemental');
INSERT INTO `external_texts` VALUES ('badge_desc_CO4', 'On the spot prize from the Mayor of Yukka Tree Hill.');
INSERT INTO `external_texts` VALUES ('badge_name_HC5', 'HC Club membership  V');
INSERT INTO `external_texts` VALUES ('badge_name_Z12', 'HBB Champion');
INSERT INTO `external_texts` VALUES ('badge_name_Z49', 'Bionicle Quiz Winner');
INSERT INTO `external_texts` VALUES ('badge_name_UKZ', 'Fashion Designer');
INSERT INTO `external_texts` VALUES ('badge_desc_Z49', 'I showed the intelligence of a Bionicle glatorian!');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RespectEarned3', 'Level 3 - For earning respect a further 10 times. Worth 20 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_DN5', 'Red Fuel Flag');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_AvatarLooks1', 'Looks that Kill');
INSERT INTO `external_texts` VALUES ('badge_desc_AF1', 'You got pranked on April Fools Day 2009');
INSERT INTO `external_texts` VALUES ('badge_name_GLI', 'Eagle');
INSERT INTO `external_texts` VALUES ('badge_name_BE2', 'Valued BETA tester');
INSERT INTO `external_texts` VALUES ('badge_desc_NEB', 'HMF:Neon Fan Club Winner');
INSERT INTO `external_texts` VALUES ('badge_desc_Z41', 'HABWrecked Ducks Fan 2009');
INSERT INTO `external_texts` VALUES ('badge_desc_EC4', 'Trying to make Habbo a greener place');
INSERT INTO `external_texts` VALUES ('badge_name_Z47', 'Bionicle Quest Winner');
INSERT INTO `external_texts` VALUES ('badge_desc_AP1', 'The HABprentice Boardroom Table Member');
INSERT INTO `external_texts` VALUES ('badge_desc_KO1', 'For creating the perfect Koala habitat. November 2008.');
INSERT INTO `external_texts` VALUES ('badge_desc_SB1', 'Bouncing Queens gang member on the Streets Of Bobba September 2006.');
INSERT INTO `external_texts` VALUES ('badge_name_DSX', 'Tourist Expert');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RespectEarned10', 'Level 10 - For earning respect a further 200 times.  Worth 400 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_UKK', 'Fantastic Four Bronze Medallion. 2007.');
INSERT INTO `external_texts` VALUES ('badge_name_OL3', 'Habbolympic Bronze');
INSERT INTO `external_texts` VALUES ('badge_name_Z45', 'HAFTAS Winner 2007');
INSERT INTO `external_texts` VALUES ('badge_desc_VA5', 'Awarded to paired Habbos during Valentine\'s each year.');
INSERT INTO `external_texts` VALUES ('badge_name_YAK', 'Black Dragon');
INSERT INTO `external_texts` VALUES ('badge_name_AC3', 'Bensalem Tribe Member');
INSERT INTO `external_texts` VALUES ('badge_desc_VA8', 'For making a winning Bollywood Movie. 2009.');
INSERT INTO `external_texts` VALUES ('badge_desc_UKU', 'Theme Park entertainment winner. 2008');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_GamePlayed2', 'Battle Royal II');
INSERT INTO `external_texts` VALUES ('badge_desc_EXH', 'Hobba volunteer mod until 2006.');
INSERT INTO `external_texts` VALUES ('badge_desc_RU3', 'SafeSid Competition Winner');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RespectEarned8', 'Been respected 766 times.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RegistrationDuration1', '10 % True Habbo');
INSERT INTO `external_texts` VALUES ('badge_desc_DU2', 'Habbowealth Games 2005.');
INSERT INTO `external_texts` VALUES ('badge_name_Z10', 'Underage Festival');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_MGM2', 'Luau');
INSERT INTO `external_texts` VALUES ('badge_desc_Z26', 'Road Trip USA King badge winner. Awarded to anyone who exchanged 25 Fuel Points. 2008');
INSERT INTO `external_texts` VALUES ('badge_desc_XXX', 'Habbo eXperts are experienced Habbos who answer your questions on Habbo.');
INSERT INTO `external_texts` VALUES ('badge_desc_GLE', 'Level 5 - The clever one - is swift of thought and foot. For being a Habbo guide -  Here to help.  Worth 285 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_EXH', 'Hobba Medal');
INSERT INTO `external_texts` VALUES ('badge_name_SB7', 'Habbo Hood Big Flame');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RoomEntry8', 'Sightseer');
INSERT INTO `external_texts` VALUES ('badge_name_TC1', 'BattleBall Champ');
INSERT INTO `external_texts` VALUES ('badge_name_CL3', 'Idea Agency competition winner!');
INSERT INTO `external_texts` VALUES ('badge_desc_HC5', 'Level 5 - For 48 months of Habbo Club membership. Worth 500 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_TC3', 'SnowStorm Challenge involved being in the top 20 highscores for 15 weeks in a row!');
INSERT INTO `external_texts` VALUES ('badge_desc_SU3', 'Lvl3 Tiki Competition winner. Highest award. Summer 2008.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_TraderPass1', 'Level 1 - Achieved by verifying your email, owning Habbo account for at least 3 days and being online at least 1 h.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_Login5', 'Level 5 - For logging in 35 days in a row. Amazing. Worth 200 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_Z26', 'Road Trip King');
INSERT INTO `external_texts` VALUES ('badge_name_SB5', 'Habbo Hood Small Flame');
INSERT INTO `external_texts` VALUES ('badge_name_DU3', 'Bronze Habbowealth');
INSERT INTO `external_texts` VALUES ('badge_desc_SB5', 'Selected member of a Habbo Hood Group. September 2008');
INSERT INTO `external_texts` VALUES ('badge_name_AC5', 'The Spirit Squid');
INSERT INTO `external_texts` VALUES ('badge_desc_Z47', 'I showed the guile of a Bionicle glatorian!');
INSERT INTO `external_texts` VALUES ('selected_badges', 'Currently wearing:');
INSERT INTO `external_texts` VALUES ('badge_desc_U05', 'Having a Course featured in a Habbo Raceway Grand Prix.');
INSERT INTO `external_texts` VALUES ('badge_desc_OL2', 'Awarded to members of the 2nd Habbolympic team 2008.');
INSERT INTO `external_texts` VALUES ('badge_desc_HX5', 'Gold Host eXpert');
INSERT INTO `external_texts` VALUES ('badge_name_SU3', 'High Tiki Mana');
INSERT INTO `external_texts` VALUES ('badge_desc_DS7', 'Elementals Vs Warriors 2007.');
INSERT INTO `external_texts` VALUES ('badge_name_DN2', 'Blue Fuel Flag');
INSERT INTO `external_texts` VALUES ('badge_desc_Z11', 'Contestant of Habbo Big Brother series1 in July 2008.');
INSERT INTO `external_texts` VALUES ('badge_desc_DS1', 'Warriors Vs Elementals 2007.');
INSERT INTO `external_texts` VALUES ('badge_desc_GLK', 'Level X - The eXperienced one with the knowledge to show the way.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_Login9', 'Habbo Stayer');
INSERT INTO `external_texts` VALUES ('badge_name_AP1', 'The HABprentice Finalist');
INSERT INTO `external_texts` VALUES ('badge_desc_WH8', 'You received the cure to the virus Habboween 2008');
INSERT INTO `external_texts` VALUES ('badge_name_Z24', 'IGOR EVIL SCIENTIST\'S COAT');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RegistrationDuration8', '80 % True Habbo');
INSERT INTO `external_texts` VALUES ('badge_name_NEJ', 'Flynn500 Winner');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_MGM2', 'Level 2 - For creating your own fellowship - party of 3.  For inviting  one real life friend to Habbo. Worth 55 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_GLK', 'Head Guide (Wolf)');
INSERT INTO `external_texts` VALUES ('badge_name_Z57', 'Smithsonian Supporter');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RoomEntry2', 'Level 2 - For hanging out in 15 guest rooms that you do not own.  Worth 10 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_UK7', 'Awarded to experts at creating their own quests.');
INSERT INTO `external_texts` VALUES ('badge_name_XM2', 'Xmas Elf');
INSERT INTO `external_texts` VALUES ('badge_name_DS1', 'Grey Pixel Warrior');
INSERT INTO `external_texts` VALUES ('badge_desc_GLI', 'Level 9 - The sharp eyed one - flying to your aid from afar. For being a Habbo guide -  Here to help.  Worth 920 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_Z41', 'Team Ducks Supporter');
INSERT INTO `external_texts` VALUES ('badge_name_TC3', 'SnowStorm Champ');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_MGM5', 'Slumber Party');
INSERT INTO `external_texts` VALUES ('badge_name_CY3', 'High Yin Yang');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RespectEarned1', 'Level 1 - For earning respect your first time. Worth 20 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_Student1', 'For being guided by a Habbo Guide and to be confused no more.  Worth 20 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_WH2', 'Evil Smile');
INSERT INTO `external_texts` VALUES ('badge_desc_DK5', 'Camp Rock Winner 2008');
INSERT INTO `external_texts` VALUES ('badge_name_Z28', 'Silver Insider');
INSERT INTO `external_texts` VALUES ('badge_desc_GLA', 'Level 1 - The speedy one - simple facts and information. For being a Habbo guide -  Here to help.  Worth 15 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_AP2', 'The HABprentice: Design Edition Boardroom Table Member');
INSERT INTO `external_texts` VALUES ('badge_desc_CL1', 'Idea Agency brief runner-up!');
INSERT INTO `external_texts` VALUES ('badge_name_WH4', 'Smelly Brain');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_Graduate1', 'The Graduate');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_AllTimeHotelPresence10', 'Online time X - F5 Tornado');
INSERT INTO `external_texts` VALUES ('badge_desc_HX2', 'Safety eXpert');
INSERT INTO `external_texts` VALUES ('badge_desc_Z39', 'Tracked the scent and made it to the Hotel');
INSERT INTO `external_texts` VALUES ('badge_name_Z01', 'Habbo Model');
INSERT INTO `external_texts` VALUES ('badge_desc_NWB', 'Hobbas were volunteer moderators.');
INSERT INTO `external_texts` VALUES ('badge_name_XM4', 'Xmas Tree');
INSERT INTO `external_texts` VALUES ('badge_name_Z07', 'Gold Graffiti');
INSERT INTO `external_texts` VALUES ('badge_desc_AC6', 'Used the inner Angry Spirit Ape to find the Lost Tribe of Bensalem');
INSERT INTO `external_texts` VALUES ('badge_desc_BE2', 'Helped shape the new Habbo June 2009');
INSERT INTO `external_texts` VALUES ('badge_desc_Z37', 'Hotel For Dogs 2* Resort Owner');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_MGM4', 'Level 4 - For creating your own fellowship - party of 6. For inviting two more real life friends to Habbo. Worth 130 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_LC3', 'Completed the quest of Lemuria 02/09');
INSERT INTO `external_texts` VALUES ('badge_name_MB2', 'Madball Yellow Card');
INSERT INTO `external_texts` VALUES ('badge_desc_CL3', 'Idea Agency Golden brief winner!');
INSERT INTO `external_texts` VALUES ('badge_desc_XM4', 'Awarded to everyone who visited Habbo during December 2006. Happy Christmas!');
INSERT INTO `external_texts` VALUES ('badge_desc_UKO', 'Awarded to anyone who successfully collected all Dark Is Rising Badges. 2007');
INSERT INTO `external_texts` VALUES ('badge_desc_Z07', '1st place in the Step Up 2 The Streets dance competition.');
INSERT INTO `external_texts` VALUES ('badge_name_GLC', 'Otter');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_MGM3', 'Block party');
INSERT INTO `external_texts` VALUES ('badge_desc_Z20', 'You have reached LEVEL5. October 2008.');
INSERT INTO `external_texts` VALUES ('badge_name_AR2', 'Alhambra Sword');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_GamePlayed7', 'Battle Royal VII');
INSERT INTO `external_texts` VALUES ('badge_desc_U01', 'Idea Agency brief runner-up!');
INSERT INTO `external_texts` VALUES ('badge_desc_Z43', 'HABWrecked Contestant 2009');
INSERT INTO `external_texts` VALUES ('badge_desc_MB2', 'Competition winners during Habbo Madball 2008.');
INSERT INTO `external_texts` VALUES ('badge_name_UK3', 'Frank Bus');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_AvatarTags1', '5 words of wisdom');
INSERT INTO `external_texts` VALUES ('badge_desc_HC3', 'Level 3 - For 24 months of Habbo Club membership. Worth 300 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_U03', 'Idea Agency Golden brief winner!');
INSERT INTO `external_texts` VALUES ('badge_desc_HX3', 'Tech eXpert');
INSERT INTO `external_texts` VALUES ('badge_name_HWB', 'Evil Smile');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RoomEntry4', 'Level 4 - For hanging out in 50 Guest Rooms that you do not own. Backpacker. Worth 15 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_HC1', 'Level 1 - For joining the Habbo Club. Worth 100 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_VA5', 'Wedding Ring');
INSERT INTO `external_texts` VALUES ('badge_name_Z09', 'Underage Festival');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RespectEarned6', 'Been respected 366 times.');
INSERT INTO `external_texts` VALUES ('badge_name_Z22', 'IGOR HELMET');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_Login1', 'Level 1 - For logging in 5 days in a row. Try it if you dare. Worth 50 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_GLC', 'Level 3 - The one who will not let you sink under pressure.  For being a Habbo guide -  Here to help.  Worth 34 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_GLE', 'Fox');
INSERT INTO `external_texts` VALUES ('badge_desc_UKM', 'Fantastic Four Gold Medallion. 2007.');
INSERT INTO `external_texts` VALUES ('badge_desc_Z22', 'You have reached LEVEL6. October 2008.');
INSERT INTO `external_texts` VALUES ('badge_name_Z43', 'HABWrecked Contestant 2009');
INSERT INTO `external_texts` VALUES ('badge_name_Z65', 'Charlie\'s Best Friend');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_GamePlayed9', 'Battle Royal IX');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_AllTimeHotelPresence8', 'Online time VIII- Meso Cyclone');
INSERT INTO `external_texts` VALUES ('badge_desc_Z57', 'Attended the Smithsonian Centre launch - May 2009');
INSERT INTO `external_texts` VALUES ('badge_desc_WH5', 'Musically gifted Habbo!');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_Login4', 'High Roller');
INSERT INTO `external_texts` VALUES ('badge_name_HC3', 'HC Club membership III');
INSERT INTO `external_texts` VALUES ('badge_name_VA4', 'Habborella Crew');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_MGM10', 'Level 10 - For creating your own fellowship - party of 18. For inviting two more real life friends to Habbo. Worth 200 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_CY2', 'Awarded to owners of trials that MeiLing defeated. CNY 2009');
INSERT INTO `external_texts` VALUES ('badge_name_HX8', 'Habbo eXpert');
INSERT INTO `external_texts` VALUES ('badge_name_Z05', 'Habbo X Medal');
INSERT INTO `external_texts` VALUES ('badge_name_WAR', 'Peace Protest 2008');
INSERT INTO `external_texts` VALUES ('badge_desc_Z05', 'Habbo eXperts were volunteer helpers between 2006 and 2008.');
INSERT INTO `external_texts` VALUES ('badge_name_UKF', 'Iron Sign');
INSERT INTO `external_texts` VALUES ('badge_desc_WH7', 'Awarded to competition winners during Habboween 2008.');
INSERT INTO `external_texts` VALUES ('badge_desc_UKG', 'Dark is Rising sign of fire. 2007.');
INSERT INTO `external_texts` VALUES ('badge_name_UKP', 'Perfect Prefect');
INSERT INTO `external_texts` VALUES ('badge_name_Z63', 'Valued BETA tester');
INSERT INTO `external_texts` VALUES ('badge_name_ST6', 'Climate Scientist');
INSERT INTO `external_texts` VALUES ('badge_name_AR1', 'Alhambra Genie');
INSERT INTO `external_texts` VALUES ('badge_desc_UKA', 'Battle of the Resorts Summer 2007');
INSERT INTO `external_texts` VALUES ('badge_name_Z03', 'Stop Pollution');
INSERT INTO `external_texts` VALUES ('badge_name_Z51', 'Zac Efron Fan');
INSERT INTO `external_texts` VALUES ('badge_name_UKH', 'Stone Sign');
INSERT INTO `external_texts` VALUES ('badge_name_UKD', 'Adventure Story');
INSERT INTO `external_texts` VALUES ('badge_desc_Z09', 'Competition winner at the Habbo Underage Festival 2008.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RegistrationDuration1', 'Level 1 - For true Habbos who have been members of the community for 3 days. Worth 30 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_UK3', 'Frank Bus moderator.');
INSERT INTO `external_texts` VALUES ('badge_desc_Z17', 'Hairspray The Musical talent show competition winner! 2008');
INSERT INTO `external_texts` VALUES ('badge_name_HX4', 'Habbo eXpert');
INSERT INTO `external_texts` VALUES ('badge_desc_WH3', 'Habboween competition /event winner.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_GamePlayed4', 'Level 4 - For playing and winning Snow Storm or for the game of Battle Ball 50 times. Worth 80 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_Login7', 'Level 7 - For logging in 70 days in a row. Awesome. Worth 200 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_UKY', 'Awarded to Quest Guild members. You must submit a Quest to enter the guild.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_Login2', 'Preferred Guest');
INSERT INTO `external_texts` VALUES ('badge_name_ADM', 'Habbo Staff');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_Login10', 'Phoenix');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_Login9', 'Level 9 - For logging in 90 days in a row. Extraordinary. Worth 200 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_DN1', 'Diner Room Winner 2008.');
INSERT INTO `external_texts` VALUES ('badge_name_OL1', 'Habbolympic Gold');
INSERT INTO `external_texts` VALUES ('badge_desc_HJ6', 'Attended the Harajuku Lovers Hub launch party!');
INSERT INTO `external_texts` VALUES ('badge_name_WBL', 'Wobble Squabble HOF');
INSERT INTO `external_texts` VALUES ('badge_name_HM1', 'Mall Builder');
INSERT INTO `external_texts` VALUES ('badge_desc_HWB', 'Habboween competition badge.');
INSERT INTO `external_texts` VALUES ('badge_name_UK5', 'Comic Creator');
INSERT INTO `external_texts` VALUES ('badge_desc_WBL', 'Hall of Fame member. Awarded to the top 25 Wobble Squabble players.');
INSERT INTO `external_texts` VALUES ('badge_desc_HW1', 'Winning Director of a Habbowood movie. Habbowood ran in both 2006 and 2007.');
INSERT INTO `external_texts` VALUES ('badge_name_CO6', 'YTH Champion Villager');
INSERT INTO `external_texts` VALUES ('badge_name_ST4', 'Cosmetics Specialist');
INSERT INTO `external_texts` VALUES ('badge_desc_Z64', 'Helped shape the new Habbo June 2009');
INSERT INTO `external_texts` VALUES ('badge_desc_CL2', 'Idea Agency Silver brief winner!');
INSERT INTO `external_texts` VALUES ('badge_name_NEB', 'Official EPIC Party Host');
INSERT INTO `external_texts` VALUES ('badge_name_UKR', 'St Trinian\'s Head Girl');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_AllTimeHotelPresence6', 'Level 6 - spending total of 144 hours in hotel. Worth 20 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_MGM10', 'Prom');
INSERT INTO `external_texts` VALUES ('badge_name_HX2', 'Habbo eXpert');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RoomEntry6', 'House Guest');
INSERT INTO `external_texts` VALUES ('badge_name_WH1', 'Evil Eye');
INSERT INTO `external_texts` VALUES ('badge_desc_UK5', 'Habbo comic creator. Comics were displayed on the homepage for 2 weeks during 2007.');
INSERT INTO `external_texts` VALUES ('badge_desc_GLG', 'Level 7 - The strong one - the one you can depend on.  For being a Habbo guide -  Here to help.  Worth 660 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_GLA', 'Bunny');
INSERT INTO `external_texts` VALUES ('badge_name_LC3', 'Lemuria Adventurer');
INSERT INTO `external_texts` VALUES ('badge_desc_UK9', 'Japanese quest winner 2007.');
INSERT INTO `external_texts` VALUES ('badge_desc_Z03', 'Earth week competition winner.');
INSERT INTO `external_texts` VALUES ('badge_desc_DN3', 'Roadtrip USA 15 Points 2008.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_AllTimeHotelPresence8', 'Level 8 - spending total of 576 hours in hotel. Worth 20 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_Z31', 'Official Habbo Music Festival Artist');
INSERT INTO `external_texts` VALUES ('badge_name_UK7', 'Quest Builder');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_MGM8', 'Ball');
INSERT INTO `external_texts` VALUES ('badge_name_VA3', 'Habborella Cruise');
INSERT INTO `external_texts` VALUES ('badge_desc_HX8', 'Gold Game eXpert');
INSERT INTO `external_texts` VALUES ('badges_tab_title', 'My badges');
INSERT INTO `external_texts` VALUES ('badge_name_AC1', 'Bensalem Tribe Member');
INSERT INTO `external_texts` VALUES ('badge_name_EC5', 'Official Habbo Tree-Planter');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_AvatarLooks1', 'For finally putting some fresh clothes on. Worth 50 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_ST3', 'You need Science and Maths skills for this job!');
INSERT INTO `external_texts` VALUES ('badge_name_SB1', 'Bouncing Queens');
INSERT INTO `external_texts` VALUES ('badge_name_ST2', 'Digital Designer');
INSERT INTO `external_texts` VALUES ('badge_name_Z59', 'History Buff');
INSERT INTO `external_texts` VALUES ('badge_desc_Z66', 'Entered an ultimate sleepover room to Charlie');
INSERT INTO `external_texts` VALUES ('badge_name_UKB', 'Play Writer');
INSERT INTO `external_texts` VALUES ('badge_name_Z42', 'Team Otters Supporter');
INSERT INTO `external_texts` VALUES ('badge_name_HW1', 'Habbowood Director');
INSERT INTO `external_texts` VALUES ('badge_name_Z35', 'Hotel For Dogs Quest Winner');
INSERT INTO `external_texts` VALUES ('badge_desc_AC1', 'Initiated through the Totem bases of fire PINK');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RoomEntry10', 'Level 10 - For hanging out in 200 Guest Rooms that you do not own. Time traveler. Worth 40 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RegistrationDuration7', 'Level 7 - For true Habbos who have been members of the community for 2 years. Worth 200 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_UKT', 'Candy Floss');
INSERT INTO `external_texts` VALUES ('badge_name_CO4', 'YTH Prize Winner');
INSERT INTO `external_texts` VALUES ('badge_name_UKL', 'Fantastic4 Silver');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RoomEntry4', 'Day tripper');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_AllTimeHotelPresence4', 'Level 4 - spending total of 16 hours in hotel. Worth 20 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_GamePlayed5', 'Battle Royal V');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_TraderPass2', 'Trader\'s Pass');
INSERT INTO `external_texts` VALUES ('badge_name_RU3', 'SafeSid Competition Winner');
INSERT INTO `external_texts` VALUES ('badge_desc_Z13', 'Runner Up of Habbo Big Brother series1 in July 2008.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_GamePlayed8', 'Level 8 - For playing and winning Snow Storm or the game of Battle Ball 280 times. Worth 220 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RegistrationDuration5', 'Level 5 - For true Habbos who have been members of the community for 24 weeks. Worth 160 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_MGM7', 'Level 7 - For creating your own fellowship - party of 12. For inviting two more real life friends to Habbo. Worth 160 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RespectEarned1', 'Been respected once.');
INSERT INTO `external_texts` VALUES ('badge_name_Z33', 'It Doesn\'t Have To Happen');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RoomEntry8', 'Level 8 - For hanging out in 140 Guest Rooms  that you do not own. Orion. Worth 30 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_XM2', 'Elf Vs Reindeer Christmas 2005');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_Login8', 'Rotten tomato');
INSERT INTO `external_texts` VALUES ('badge_desc_SU1', 'Lvl1 Tiki Competition winner. Lowest award. Summer 2008.');
INSERT INTO `external_texts` VALUES ('badge_desc_SB2', 'Bobbaschi gang member on the Streets Of Bobba September 2006.');
INSERT INTO `external_texts` VALUES ('badge_desc_BTB', 'Hall of Fame member. Awarded to the top 25 BattleBall players.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_GamePlayed2', 'Level 2 - For playing and winning  Snow Storm or for the game of Battle Ball 5 times. Worth 30 pixels');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RespectEarned9', 'Level 9 - For earning respect a further 200 times.  Worth 200 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_Login3', 'Level 3 - For logging in 15 days in a row. Strange. Worth 120 pixels.');
INSERT INTO `external_texts` VALUES ('badges_window_title', 'Badges');
INSERT INTO `external_texts` VALUES ('badge_name_UK9', 'Japanese Statue');
INSERT INTO `external_texts` VALUES ('badge_name_JF2', 'Japanese Sushi');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RoomEntry6', 'Level 6 - For hanging out in 80 Guest Rooms  that you do not own. Out of towner. Worth 20 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_CO6', 'Villager at the largest village in Yukka Tree Hill.');
INSERT INTO `external_texts` VALUES ('badge_name_Z39', 'Hotel For Dogs Maze Winner');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_AllTimeHotelPresence10', 'Level 10 - spending total of 2304 hours in hotel. Worth 20 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_Z40', 'Habbo UK is 8!');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_AllTimeHotelPresence2', 'Online time II - Drizzle');
INSERT INTO `external_texts` VALUES ('badge_name_SB3', 'Shabbolins');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RespectGiven1', 'Nice as pie!');
INSERT INTO `external_texts` VALUES ('badge_name_GLG', 'Buffalo');
INSERT INTO `external_texts` VALUES ('badge_name_HJ3', 'Designed Gwen Stefani an outfit with Harajuku Lovers');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RespectEarned7', 'Level 7 - For earning respect a further 200 times.  Worth 200 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_UKC', 'Habbo submitted news stories.');
INSERT INTO `external_texts` VALUES ('badge_name_UKV', 'Gold Rollercoaster');
INSERT INTO `external_texts` VALUES ('badge_desc_VA7', 'For making a really good Bollywood Movie. 2009.');
INSERT INTO `external_texts` VALUES ('badge_name_BTB', 'BattleBall HOF');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_AllTimeHotelPresence6', 'Online time VI- Jet Stream');
INSERT INTO `external_texts` VALUES ('badge_name_UKJ', 'Wood Sign');
INSERT INTO `external_texts` VALUES ('badge_desc_Z33', 'Play Director and Reviewer extraordinaire');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_GamePlayed6', 'Level 6 - For playing and winning Snow Storm or the game of Battle Ball 160 times. Worth 120 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RespectEarned3', 'Been respected 16 times.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_AllTimeHotelPresence2', 'Level 2 - spending total of 3 hours in hotel. Worth 20 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_VA1', 'Superlove Heart');
INSERT INTO `external_texts` VALUES ('badge_desc_CAC', 'Landscape Room Winner 2008.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RoomEntry2', 'Running Room Raider');
INSERT INTO `external_texts` VALUES ('badge_name_PIR', 'Pirate Necklace');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RegistrationDuration3', '30 % True Habbo');
INSERT INTO `external_texts` VALUES ('badge_desc_ST4', 'You need Science and Maths skills for this job!');
INSERT INTO `external_texts` VALUES ('badge_desc_MD1', 'Awarded to winners of the Meet Dave quiz competition. 2008.');
INSERT INTO `external_texts` VALUES ('badge_name_UKW', 'Silver Rollercoaster');
INSERT INTO `external_texts` VALUES ('badge_name_SU1', 'Low Tiki Mana');
INSERT INTO `external_texts` VALUES ('badge_desc_Z29', 'Awarded to The Insiders prank competition winners. October 2008.');
INSERT INTO `external_texts` VALUES ('badge_desc_UKE', 'Dark is Rising sign of bronze. 2007.');
INSERT INTO `external_texts` VALUES ('badge_desc_ADM', 'Habbo Employees including London office staff. If their Habbo name has MOD in it, then they are Moderators.');
INSERT INTO `external_texts` VALUES ('badge_name_U01', 'Idea Agency competition runner-up!');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_EmailVerification1', 'True You');
INSERT INTO `external_texts` VALUES ('badge_desc_EC2', 'Won a Love The Earth event');
INSERT INTO `external_texts` VALUES ('badge_name_CL2', 'Idea Agency competition winner!');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_Login6', 'Covered with moss');
INSERT INTO `external_texts` VALUES ('badge_desc_AC3', 'Initiated through the Totem bases of fire BLUE');
INSERT INTO `external_texts` VALUES ('badge_name_WH7', 'Virus Blood');
INSERT INTO `external_texts` VALUES ('badge_desc_Z27', 'Road Trip USA Queen badge winner. Awarded to anyone who exchanged 25 Fuel Points. 2008');
INSERT INTO `external_texts` VALUES ('badge_desc_HJ2', 'I\'m an official Harajuku Lovers girl');
INSERT INTO `external_texts` VALUES ('badge_name_Z14', 'Briefcase Affair');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_GamePlayed3', 'Battle Royal III');
INSERT INTO `external_texts` VALUES ('badge_desc_Z19', 'You have reached LEVEL4. October 2008.');
INSERT INTO `external_texts` VALUES ('badge_name_DK5', 'Camp Rock Guitar Blue');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RespectEarned5', 'Level 5 - For earning respect a further 100 times.  Worth 100 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_HJ4', 'Member of the Cool Japan Quiz winning team');
INSERT INTO `external_texts` VALUES ('badge_desc_Z60', 'Built a Museum room to house a replica tablet');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_AllTimeHotelPresence4', 'Online time IV - Blizzard');
INSERT INTO `external_texts` VALUES ('badge_name_Z16', 'Newspaper Affair');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_Motto1', 'For editing your motto & letting us know how you\'re feeling. Worth 10 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_Z66', 'Charlie Girl Chic Competitor');
INSERT INTO `external_texts` VALUES ('badge_name_U03', 'Idea Agency competition winner!');
INSERT INTO `external_texts` VALUES ('badge_desc_Z59', 'Master of the history quest');
INSERT INTO `external_texts` VALUES ('badge_name_Z37', 'Hotel For Dogs 2* Resort Owner');
INSERT INTO `external_texts` VALUES ('badge_name_HX6', 'Habbo eXpert');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RegistrationDuration3', 'Level 3 - For true Habbos who have been members of the community for 8 weeks. Worth 90 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_MD2', 'Meet Dave Body');
INSERT INTO `external_texts` VALUES ('badge_desc_WH1', 'Habboween competition /event winner.');
INSERT INTO `external_texts` VALUES ('badge_desc_UKR', 'Winner of St Trinians Head Girl competition.');
INSERT INTO `external_texts` VALUES ('badge_desc_Z15', 'My Spy Family quest 1 winner.');
INSERT INTO `external_texts` VALUES ('badge_name_HJ5', 'Harajuku Lovers Music');
INSERT INTO `external_texts` VALUES ('badge_name_U05', 'Habbo Raceway Course');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_MGM1', 'Baby Shower');
INSERT INTO `external_texts` VALUES ('badge_name_GLH', 'Bear');
INSERT INTO `external_texts` VALUES ('badge_name_Z46', 'HAFTAS Winner 2009');
INSERT INTO `external_texts` VALUES ('bage_name_XMA', 'Christmas 2008 comp winner');
INSERT INTO `external_texts` VALUES ('badge_name_HF1', 'Golden Football Boot');
INSERT INTO `external_texts` VALUES ('badge_name_Z13', 'HBB Runner Up');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RoomEntry10', 'Pilgrim');
INSERT INTO `external_texts` VALUES ('badge_desc_UKJ', 'Dark is Rising sign of wood. 2007.');
INSERT INTO `external_texts` VALUES ('achievements_desc', 'Achievements are tasks that you can do in Habbo Hotel. For each Achievement you receive a badge and some pixels');
INSERT INTO `external_texts` VALUES ('badge_desc_Z42', 'HABWrecked Otters Fan 2009');
INSERT INTO `external_texts` VALUES ('badge_name_UKY', 'Quest Guild');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RegistrationDuration5', '50 % True Habbo');
INSERT INTO `external_texts` VALUES ('badge_desc_VA1', 'Awarded to the two superlove champions Valentine\'s 2006.');
INSERT INTO `external_texts` VALUES ('badge_desc_UKX', 'Winner at the St Trinian\'s Quiz competiton 2008.');
INSERT INTO `external_texts` VALUES ('badge_name_Z48', 'Bionicle Kick Wars Winner');
INSERT INTO `external_texts` VALUES ('badge_desc_UKV', 'Theme Park team competition champion. 2008');
INSERT INTO `external_texts` VALUES ('badge_name_DN4', 'Pink Fuel Flag');
INSERT INTO `external_texts` VALUES ('badge_desc_SNW', 'Hall of Fame member. Awarded to the top 25 SnowStorm players.');
INSERT INTO `external_texts` VALUES ('badge_desc_HC4', 'Level 4 - For 36 months of Habbo Club membership. Worth 400 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_Z25', 'You have reached LEVEL1. October 2008.');
INSERT INTO `external_texts` VALUES ('badge_desc_ATW', 'Globetrekker competition winner. Country room is in our Globetrekker Tour Guide 2008.');
INSERT INTO `external_texts` VALUES ('badge_desc_NEC', 'Official HMF:Neon Best New Artist Supporter');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_GamePlayed1', 'Battle Royal I');
INSERT INTO `external_texts` VALUES ('badge_desc_UKT', 'Theme Park creative competition winner. 2008');
INSERT INTO `external_texts` VALUES ('badge_desc_UKN', 'Awarded to winners of the 2007 HAFTAs where rooms were built based on films.');
INSERT INTO `external_texts` VALUES ('badge_desc_ST6', 'You need Science and Maths skills for this job!');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_Login10', 'Level 10 - For logging in 100 days in a row. Breathtaking. Worth 200 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_CO5', 'Owner of a Yukka Tree Hill Village.');
INSERT INTO `external_texts` VALUES ('badge_desc_EC5', 'Loved The Earth and bought a tree for a friend');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RoomEntry1', 'Room Raider');
INSERT INTO `external_texts` VALUES ('badge_name_AC4', 'The Spirit Eagle');
INSERT INTO `external_texts` VALUES ('badge_desc_Z44', 'HABWrecked Overall Winner 2009');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RegistrationDuration2', '20 % True Habbo');
INSERT INTO `external_texts` VALUES ('badge_name_HC1', 'HC Club membership I');
INSERT INTO `external_texts` VALUES ('badge_desc_DU3', 'Habbowealth Games 2005.');
INSERT INTO `external_texts` VALUES ('badge_name_CY2', 'Low Yin Yang');
INSERT INTO `external_texts` VALUES ('badge_name_XM9', 'Arctic Snowballers!');
INSERT INTO `external_texts` VALUES ('badge_desc_SB4', 'Furnihilists gang member on the Streets Of Bobba September 2006.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_Login6', 'Level 6 - For logging in 60 days in a row. Phenomenal. Worth 200 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_XM3', 'Reindeer Vs Elf Christmas 2005');
INSERT INTO `external_texts` VALUES ('badge_desc_HX4', 'Game eXpert');
INSERT INTO `external_texts` VALUES ('badge_name_SB4', 'Furnihilists');
INSERT INTO `external_texts` VALUES ('badge_name_DN1', 'Diner Expert');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RoomEntry9', 'HabituÃƒÂ©');
INSERT INTO `external_texts` VALUES ('badge_name_Z11', 'HBB Contestant');
INSERT INTO `external_texts` VALUES ('badge_name_Z30', 'Pumpkin Design');
INSERT INTO `external_texts` VALUES ('badge_desc_VA4', 'Habborella cruise ship staff Valentine\'s 2008.');
INSERT INTO `external_texts` VALUES ('badge_name_UKN', 'HAFTAs Award');
INSERT INTO `external_texts` VALUES ('badge_desc_UK8', 'NSPCC campaign badge. Stop Bullying. Full stop.');
INSERT INTO `external_texts` VALUES ('badge_desc_UKP', 'Winner of the St Trinians perfect prefect competition.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RoomEntry7', 'Traveler');
INSERT INTO `external_texts` VALUES ('badge_name_KIR', 'Keep It Real');
INSERT INTO `external_texts` VALUES ('badge_desc_Z40', 'I celebrated Habbo UK\'s 8th birthday, 17/1/2009');
INSERT INTO `external_texts` VALUES ('badge_name_Z25', 'IGOR GOGGLES');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RegistrationDuration7', '70 % True Habbo');
INSERT INTO `external_texts` VALUES ('badge_desc_TC2', 'Wobble Squabble Challenge involved being in the top 20 highscores for 15 weeks in a row!');
INSERT INTO `external_texts` VALUES ('badge_desc_HBA', 'Hobbas were volunteer moderators.');
INSERT INTO `external_texts` VALUES ('badge_desc_VA2', 'Awarded to competition winners during Valentine\'s week each year.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RoomEntry5', 'Level 5 - For hanging out in 60 Guest Rooms  that you do not own. Globetrotter.Worth 15 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_OL3', 'Awarded to members of the 3rd Habbolympic team 2008.');
INSERT INTO `external_texts` VALUES ('badge_desc_Z10', 'Competition winner at the Habbo Underage Festival 2008.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RespectEarned10', 'Been respected 1166 times.');
INSERT INTO `external_texts` VALUES ('badge_desc_Z46', 'HAFTAS Winner 2009');
INSERT INTO `external_texts` VALUES ('badge_desc_Z23', 'You have reached LEVEL2. October 2008.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RegistrationDuration9', 'Level 9 - For true Habbos who have been members of the community for 4 years. Worth 200 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RegistrationDuration9', '90 % True Habbo');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_TraderPass2', 'Level 2 - Achieved if you have been busy trading your stuff. Keep it up!');
INSERT INTO `external_texts` VALUES ('badge_desc_Z48', 'I showed the strength of a Bionicle glatorian!');
INSERT INTO `external_texts` VALUES ('badge_desc_XM1', 'Rasta Santa was awarded during Christmas 2005. He visited the hotel December 2006.');
INSERT INTO `external_texts` VALUES ('badge_desc_Z04', 'Earth week competition winner.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_MGM6', 'Reunion');
INSERT INTO `external_texts` VALUES ('badge_name_WH3', 'Vampire Fangs');
INSERT INTO `external_texts` VALUES ('badge_name_Z02', 'Help Our Planet');
INSERT INTO `external_texts` VALUES ('badge_name_Z56', 'The Buzz Brain of Habbo');
INSERT INTO `external_texts` VALUES ('badge_name_Z27', 'Road Trip Queen');
INSERT INTO `external_texts` VALUES ('slots_full', '5 badges worn!');
INSERT INTO `external_texts` VALUES ('badge_desc_KIR', 'Keep It Real competition winner. Don\'t forget to keep it 100% Habbo!');
INSERT INTO `external_texts` VALUES ('badge_desc_U02', 'Idea Agency Silver brief winner!');
INSERT INTO `external_texts` VALUES ('badge_desc_AP3', 'A winner or runner-up in the HABprentice: Designer Edition tasks');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_GamePlayed10', 'Level 10 - For playing and winning Snow Storm or the game of Battle Ball 440 times. Worth 340 pixels.');
INSERT INTO `external_texts` VALUES ('badge_wear', 'Wear');
INSERT INTO `external_texts` VALUES ('badge_name_TC2', 'Wobble Squabble Champ');
INSERT INTO `external_texts` VALUES ('badge_save', 'Save');
INSERT INTO `external_texts` VALUES ('badge_desc_WAR', 'Awarded for attending the Peace Protest in 2008 or responding correctly to the Peace Poll.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RespectEarned2', 'Level 2 - For earning respect a further 5 times. Worth 20 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_DK6', 'Camp Rock Winner 2008');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RoomEntry3', 'Level 3 - For hanging out in 30 guest rooms that you do not own.  Worth 15 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_UK6', 'Billboard design winner. Billboards were displayed in the Gallery Cafe for 2 weeks during 2007!');
INSERT INTO `external_texts` VALUES ('badge_name_GLJ', 'Owl');
INSERT INTO `external_texts` VALUES ('badge_desc_Z08', '2nd place in the Step Up 2 The Streets dance competition.');
INSERT INTO `external_texts` VALUES ('badge_desc_OL1', 'Awarded to members of the 1st Habbolympic team 2008.');
INSERT INTO `external_texts` VALUES ('badge_desc_GLH', 'Level 8 - The friendly one - kind and always there.  For being a Habbo guide -  Here to help.  Worth 735 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_HX6', 'Gold Safety eXpert');
INSERT INTO `external_texts` VALUES ('badge_name_AP2', 'Official HABprentice Designer 2009');
INSERT INTO `external_texts` VALUES ('badge_desc_BE1', 'Helped shape the new Habbo June 2009');
INSERT INTO `external_texts` VALUES ('badge_desc_DN5', 'Roadtrip USA 10 Points 2008.');
INSERT INTO `external_texts` VALUES ('badge_name_Z19', 'IGOR BUBBLING BEAKER');
INSERT INTO `external_texts` VALUES ('badge_name_ST1', 'Sound Engineer');
INSERT INTO `external_texts` VALUES ('badge_name_CAC', 'Landscape Expert');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_MGM1', 'Level 1 - For creating your own fellowship - party of 2. For inviting  one real life friend to Habbo. Worth 50 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_AC6', 'The Angry Spirit Ape');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_GamePlayed8', 'Battle Royal VIII');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_RoomEntry1', 'Level 1 - For hanging out in 5 guest rooms that you do not own.  Worth 5 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_GLJ', 'Level 10 - The old and wise one - loyal, with a heart of gold. For being a Habbo guide -  Here to help.  Worth 1000 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_AvatarTags1', 'For tagging yourself with 5 tags. Use your words wisely. Describe yourself for a wicked match! Worth 50 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_MGM3', 'Level 3 - For creating your own fellowship - party of 4. For inviting  one real life friend to Habbo. Worth 60 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_WH5', 'Purple Guitar');
INSERT INTO `external_texts` VALUES ('badge_desc_AR1', 'Alhambra Prize Winner 2008');
INSERT INTO `external_texts` VALUES ('badge_name_GRR', 'Gorillaz Celeb Visit');
INSERT INTO `external_texts` VALUES ('badge_desc_GLD', 'Level 4 - The digger one - has information you cannot find. For being a Habbo guide -  Here to help.  Worth 90 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RespectEarned9', 'Been respected 966 times.');
INSERT INTO `external_texts` VALUES ('badge_name_Z08', 'Silver Graffiti');
INSERT INTO `external_texts` VALUES ('badge_desc_XM9', 'For Arctic Maze survivors!');
INSERT INTO `external_texts` VALUES ('badge_desc_AC5', 'Used the inner Spirit Squid to find the Lost Tribe of Bensalem');
INSERT INTO `external_texts` VALUES ('badge_name_DU2', 'Silver Habbowealth');
INSERT INTO `external_texts` VALUES ('badge_name_GLB', 'Bambi');
INSERT INTO `external_texts` VALUES ('badge_name_UK2', 'Always Salon Champ');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_MGM5', 'Level 5 - For creating your own fellowship - party of 8. For inviting two more real life friends to Habbo. Worth 140 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_VIP', 'VIP Pass');
INSERT INTO `external_texts` VALUES ('badge_desc_Z06', '3rd place in the Step Up 2 The Streets dance competition.');
INSERT INTO `external_texts` VALUES ('badge_desc_GLB', 'Level 2 - The loving one - makes you wanna help others.  For being a Habbo guide -  Here to help.  Worth 32 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_UK4', 'Habbo Council');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_MGM4', 'Dance Party');
INSERT INTO `external_texts` VALUES ('badge_desc_HX1', 'Host eXpert');
INSERT INTO `external_texts` VALUES ('badge_desc_Z21', 'You have reached LEVEL3. October 2008.');
INSERT INTO `external_texts` VALUES ('badge_name_MB1', 'Madball Red Card');
INSERT INTO `external_texts` VALUES ('achievements_tab_title', 'Achievements');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RespectEarned7', 'Been respected 566 times.');
INSERT INTO `external_texts` VALUES ('badge_name_ATW', 'Globetrekker');
INSERT INTO `external_texts` VALUES ('badge_desc_HC2', 'Level 2 - For 12 months of Habbo Club membership.  Worth 200 pixels.');
INSERT INTO `external_texts` VALUES ('badge_desc_Z36', 'Hotel For Dogs 1* Resort Owner');
INSERT INTO `external_texts` VALUES ('badge_name_VA8', 'Large Shalimar');
INSERT INTO `external_texts` VALUES ('badge_desc_JF2', 'Awarded to everyone who opened a Sushi Parlour that was visited and endorsed by Kitsune. 2008');
INSERT INTO `external_texts` VALUES ('badge_name_ACH_RespectEarned5', 'Been respected 166 times.');
INSERT INTO `external_texts` VALUES ('badge_name_BE1', 'Official BETA tester');
INSERT INTO `external_texts` VALUES ('badge_name_Z06', 'Bronze Graffiti');
INSERT INTO `external_texts` VALUES ('badge_desc_UKI', 'Dark is Rising sign of water. 2007.');
INSERT INTO `external_texts` VALUES ('badge_name_Z23', 'IGOR BUNSEN BURNER');
INSERT INTO `external_texts` VALUES ('badge_desc_Z12', 'Winner of Habbo Big Brother series1 in July 2008.');
INSERT INTO `external_texts` VALUES ('badge_desc_ACH_Login2', 'Level 2 - For logging in 8 days in a row. Weird. Worth 80 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_GLD', 'Badger');
INSERT INTO `external_texts` VALUES ('badge_desc_Z56', 'I\'ve got the biggest brain in all of Habbo!');
INSERT INTO `external_texts` VALUES ('badge_desc_GLF', 'Level 6 - The hunter - stalks down the answers.  For being a Habbo guide -  Here to help.  Worth 600 pixels.');
INSERT INTO `external_texts` VALUES ('badge_name_Z44', 'HABWrecked Winner 2009');
INSERT INTO `external_texts` VALUES ('badge_name_HC4', 'HC Club membership IV');
INSERT INTO `external_texts` VALUES ('badge_desc_Z38', 'Hotel For Dogs 3* Resort Owner');
INSERT INTO `external_texts` VALUES ('badge_desc_UKL', 'Fantastic Four Silver Medallion. 2007.');
INSERT INTO `external_texts` VALUES ('badge_desc_MB1', 'Overall champions of Habbo Madball 2008.');
INSERT INTO `external_texts` VALUES ('badge_desc_ST1', 'You need Science and Maths skills for this job!');
INSERT INTO `external_texts` VALUES ('badge_name_Z21', 'IGOR PINCERS');
INSERT INTO `external_texts` VALUES ('fx_12_desc', 'Ice cold!');
INSERT INTO `external_texts` VALUES ('fx_18', 'UFO in yellow');
INSERT INTO `external_texts` VALUES ('fx_4_desc', 'Twinkle like the star you are.');
INSERT INTO `external_texts` VALUES ('object_displayer_fx', '%fx (%t)');
INSERT INTO `external_texts` VALUES ('fx_19', 'BluesMobile');
INSERT INTO `external_texts` VALUES ('fx_5', 'Torch');
INSERT INTO `external_texts` VALUES ('fx_bubbles', 'Forever blowing bubbles!');
INSERT INTO `external_texts` VALUES ('fx_26', 'totem_mix_name');
INSERT INTO `external_texts` VALUES ('fx_18_desc', 'Unidentified yellow flying object.');
INSERT INTO `external_texts` VALUES ('fx_17_desc', 'Fly away with this UFO of love.');
INSERT INTO `external_texts` VALUES ('fx_20_desc', 'How can I help?');
INSERT INTO `external_texts` VALUES ('fx_16', 'Microphone');
INSERT INTO `external_texts` VALUES ('fx_25', 'totem_eagle_name');
INSERT INTO `external_texts` VALUES ('fx_22_desc', 'This is black sunshine!');
INSERT INTO `external_texts` VALUES ('fx_11_desc', 'X-Rayed');
INSERT INTO `external_texts` VALUES ('fx_explosion', 'Explosions');
INSERT INTO `external_texts` VALUES ('fx15', 'Hover board');
INSERT INTO `external_texts` VALUES ('fx_flare', 'Flares!');
INSERT INTO `external_texts` VALUES ('fx_4', 'Twinkle');
INSERT INTO `external_texts` VALUES ('fx_20', 'HelpMobile');
INSERT INTO `external_texts` VALUES ('fx_12', 'Frozen');
INSERT INTO `external_texts` VALUES ('fx_1_desc', 'Shine the light on me!');
INSERT INTO `external_texts` VALUES ('fx_9', 'Love');
INSERT INTO `external_texts` VALUES ('fx_9_desc', 'Love is in the air.');
INSERT INTO `external_texts` VALUES ('fx_11', 'X-Ray');
INSERT INTO `external_texts` VALUES ('fx_7', 'Butterfly effect');
INSERT INTO `external_texts` VALUES ('fx_8', 'Fireflies');
INSERT INTO `external_texts` VALUES ('fx_8_desc', 'Light my fire');
INSERT INTO `external_texts` VALUES ('fx_6', 'HRJP-3000');
INSERT INTO `external_texts` VALUES ('fx_24_desc', 'totem_merdragon_desc');
INSERT INTO `external_texts` VALUES ('fx_17', 'UFO in pink');
INSERT INTO `external_texts` VALUES ('fx_24', 'totem_merdragon_name');
INSERT INTO `external_texts` VALUES ('fx_21', 'RebelMobile');
INSERT INTO `external_texts` VALUES ('fx_3_desc', 'Help, I\'m being abducted.');
INSERT INTO `external_texts` VALUES ('fx_19_desc', 'We\'re on a mission from god.');
INSERT INTO `external_texts` VALUES ('fx_16_desc', 'Habbo Dragonfly microphone');
INSERT INTO `external_texts` VALUES ('fx_26_desc', 'totem_mix_desc');
INSERT INTO `external_texts` VALUES ('fx15_desc', 'The future of transportation in yellow.');
INSERT INTO `external_texts` VALUES ('fx_6_desc', 'Habbo Rocket Jet Pack.');
INSERT INTO `external_texts` VALUES ('fx_15', 'Yellow hover board');
INSERT INTO `external_texts` VALUES ('fx_10_desc', 'Get a shower!');
INSERT INTO `external_texts` VALUES ('fx_2', 'Hover board');
INSERT INTO `external_texts` VALUES ('fx_21_desc', 'Drive like lightning, crash like thunder!');
INSERT INTO `external_texts` VALUES ('fx_23_desc', 'totem_man_desc');
INSERT INTO `external_texts` VALUES ('fx_13_desc', 'Spooky');
INSERT INTO `external_texts` VALUES ('fx14_desc', 'The future of transportation in pink.');
INSERT INTO `external_texts` VALUES ('fx_3', 'UFO');
INSERT INTO `external_texts` VALUES ('fx_10', 'Flies');
INSERT INTO `external_texts` VALUES ('fx_13', 'Ghost');
INSERT INTO `external_texts` VALUES ('fx_25_desc', 'totem_eagle_desc');
INSERT INTO `external_texts` VALUES ('fx_14_desc', 'See the world on pink hover board.');
INSERT INTO `external_texts` VALUES ('fx14', 'Hover board');
INSERT INTO `external_texts` VALUES ('fx_1', 'Spotlight');
INSERT INTO `external_texts` VALUES ('fx_23', 'totem_man_name');
INSERT INTO `external_texts` VALUES ('fx_5_desc', 'Light the dark corners of your existence.');
INSERT INTO `external_texts` VALUES ('fx_7_desc', 'Let the butterflies flap their wings.');
INSERT INTO `external_texts` VALUES ('fx_22', 'BadMobile');
INSERT INTO `external_texts` VALUES ('fx_14', 'Pink hover board');
INSERT INTO `external_texts` VALUES ('fx_2_desc', 'The future of transportation.');
INSERT INTO `external_texts` VALUES ('fx_15_desc', 'As yellow as a submarine.');
INSERT INTO `external_texts` VALUES ('navigator.frontpage.staticsearch.1', 'Popular Rooms');
INSERT INTO `external_texts` VALUES ('navigator.roominfo.removefromfavourites', 'Remove from favorites');
INSERT INTO `external_texts` VALUES ('navigator.password.button.try', 'Try password');
INSERT INTO `external_texts` VALUES ('navigator.roominfo.addtofavourites', 'Add to favorites');
INSERT INTO `external_texts` VALUES ('navigator.roomownercaption', 'Owner:');
INSERT INTO `external_texts` VALUES ('navigator.tab.3', 'Friends');
INSERT INTO `external_texts` VALUES ('navigator.cannotcreateevent.error.5', 'Room already has an event.');
INSERT INTO `external_texts` VALUES ('navigator.roomsettings.deleteroom.confirm.message', 'Are you sure you want to delete %room_name%? YOU WILL PERMANENTLY LOOSE ALL FURNITURE IN THIS ROOM. They will be gone forever!');
INSERT INTO `external_texts` VALUES ('navigator.createevent', 'Create event');
INSERT INTO `external_texts` VALUES ('navigator.loading', 'Loading...');
INSERT INTO `external_texts` VALUES ('navigator.tab.4', 'Search');
INSERT INTO `external_texts` VALUES ('navigator.roomrating', 'Rating:');
INSERT INTO `external_texts` VALUES ('navigator.createroom.hcpromo.text', 'You get more room options if you join the Habbo Club, the Club of most active Habbos');
INSERT INTO `external_texts` VALUES ('navigator.password.retryinfo', 'Wrong password. Please retry, or cancel entering the room.');
INSERT INTO `external_texts` VALUES ('navigator.thumbeditor.selectpos', 'Define place:');
INSERT INTO `external_texts` VALUES ('navigator.removefavourite', 'Remove Favourite');
INSERT INTO `external_texts` VALUES ('navigator.thumbeditor.nextobj', 'Next');
INSERT INTO `external_texts` VALUES ('navigator.roomsettings.doormode.password', 'Require a password to enter room');
INSERT INTO `external_texts` VALUES ('navigator.eventsettings.nameerr', 'You must choose a name for you event');
INSERT INTO `external_texts` VALUES ('navigator.roomsettings.save', 'Save settings');
INSERT INTO `external_texts` VALUES ('navigator.usercounttooltip.friends', 'Amount of friends are in this room');
INSERT INTO `external_texts` VALUES ('navigator.moreroomscaption', 'Want more rooms?');
INSERT INTO `external_texts` VALUES ('navigator.rateroom', 'Rate this room');
INSERT INTO `external_texts` VALUES ('navigator.favouritesfull.body', 'Your favourite list is full. You must remove some favourite rooms before adding more.');
INSERT INTO `external_texts` VALUES ('navigator.roomsettings.doormode.open', 'Open, anyone can enter');
INSERT INTO `external_texts` VALUES ('navigator.search.info', 'Type your searchwords here...');
INSERT INTO `external_texts` VALUES ('navigator.navibutton.1', 'Popular Rooms');
INSERT INTO `external_texts` VALUES ('navigator.roominfo.makehome', 'Make home room');
INSERT INTO `external_texts` VALUES ('navigator.password.enter', 'Enter password');
INSERT INTO `external_texts` VALUES ('navigator.eventsettings.edit', 'Edit');
INSERT INTO `external_texts` VALUES ('navigator.roomsettings.unacceptablewords', 'Unacceptable words!');
INSERT INTO `external_texts` VALUES ('navigator.roomsettings.passwordismandatory', 'You must enter a valid password');
INSERT INTO `external_texts` VALUES ('navigator.remove', 'Remove');
INSERT INTO `external_texts` VALUES ('navigator.roominfo.sethomeroom', 'Home');
INSERT INTO `external_texts` VALUES ('navigator.doorbell.title', 'Doorbell');
INSERT INTO `external_texts` VALUES ('navigator.roomsettings.basiccaption', 'Basic room settings');
INSERT INTO `external_texts` VALUES ('navigator.thumbeditor.bgtab', 'Background image');
INSERT INTO `external_texts` VALUES ('navigator.cannotcreateevent.error.2', 'Only room owner can create events.');
INSERT INTO `external_texts` VALUES ('navigator.frontpage.staticsearch.9', 'Tag Search');
INSERT INTO `external_texts` VALUES ('navigator.thumbeditor.save', 'Save');
INSERT INTO `external_texts` VALUES ('navigator.roomsettings.flatctrls.info', 'Choose users from the list above and then click \"remove\" to take away their rights to this room. Click on Remove All to remove rights from all users.');
INSERT INTO `external_texts` VALUES ('navigator.roomsettings.delete', 'Delete this room');
INSERT INTO `external_texts` VALUES ('navigator.doorbell.info', 'This room is locked. You need to ring the doorbell to enter. If you ring the doorbell, you will have to exit this room.');
INSERT INTO `external_texts` VALUES ('navigator.thumbeditor.caption.bg', 'Select background image');
INSERT INTO `external_texts` VALUES ('navigator.create', 'Create');
INSERT INTO `external_texts` VALUES ('navigator.roominfo.clearhome', 'Remove home');
INSERT INTO `external_texts` VALUES ('navigator.roominfo.clearhome.tooltip', 'This room is your Home Room. Click here to remove your Home Room setting.');
INSERT INTO `external_texts` VALUES ('navigator.createroom.hcpromo.link', 'Click here to read more >>');
INSERT INTO `external_texts` VALUES ('navigator.roomsettings.doormode.doorbell', 'Visitors have to ring the doorbell');
INSERT INTO `external_texts` VALUES ('navigator.thumbeditor.objtab', 'Icons');
INSERT INTO `external_texts` VALUES ('navigator.thumbeditor.prevobj', 'Prev');
INSERT INTO `external_texts` VALUES ('navigator.usercounttooltip.staticsearch', 'Amount of users in rooms that match this search');
INSERT INTO `external_texts` VALUES ('navigator.tab.2', 'Me');
INSERT INTO `external_texts` VALUES ('navigator.frontpage.staticsearch.5', 'My Rooms');
INSERT INTO `external_texts` VALUES ('navigator.roomsettings.advancedcaption', 'Advanced room settings');
INSERT INTO `external_texts` VALUES ('navigator.frontpage.staticsearch.6', 'Favourite Rooms');
INSERT INTO `external_texts` VALUES ('navigator.title', 'Navigator');
INSERT INTO `external_texts` VALUES ('navigator.cannotcreateevent.error.1', 'You must be in a room to start an event.');
INSERT INTO `external_texts` VALUES ('navigator.cannotcreateevent.title', 'Cannot Create event.');
INSERT INTO `external_texts` VALUES ('navigator.roomsettings.tobasicsettings', 'Basic settings');
INSERT INTO `external_texts` VALUES ('navigator.createroom', 'Create room');
INSERT INTO `external_texts` VALUES ('navigator.thumbeditor.caption.obj', 'Select image for the top');
INSERT INTO `external_texts` VALUES ('navigator.doorbell.no.answer', 'No answer.');
INSERT INTO `external_texts` VALUES ('navigator.eventsettings.descerr', 'Event description is mandatory');
INSERT INTO `external_texts` VALUES ('navigator.frontpage.staticsearch.4', 'Where are my friends?');
INSERT INTO `external_texts` VALUES ('navigator.tab.1', 'Everyone');
INSERT INTO `external_texts` VALUES ('navigator.navibutton.9', 'By Category');
INSERT INTO `external_texts` VALUES ('navigator.favouritedeleted', 'Favourite %room_name% deleted!');
INSERT INTO `external_texts` VALUES ('navigator.frontpage.officialrooms', 'Official Habbo Rooms');
INSERT INTO `external_texts` VALUES ('navigator.roomsettings.removeallflatctrls', 'Remove all');
INSERT INTO `external_texts` VALUES ('navigator.editroom', 'Edit Room');
INSERT INTO `external_texts` VALUES ('navigator.error.nosuchflat.title', 'Could not delete room');
INSERT INTO `external_texts` VALUES ('navigator.roomsettings.invalidconfirm', 'The passwords don\'t match');
INSERT INTO `external_texts` VALUES ('navigator.thumbeditor.caption', 'Edit Navigator room icon');
INSERT INTO `external_texts` VALUES ('navigator.navibutton.3', 'My Friends\' Rooms');
INSERT INTO `external_texts` VALUES ('navigator.createroom.tilesize', 'tiles');
INSERT INTO `external_texts` VALUES ('navigator.usercounttooltip.users', 'Amount users currently in this room');
INSERT INTO `external_texts` VALUES ('navigator.noroomsfound', 'No rooms found');
INSERT INTO `external_texts` VALUES ('navigator.createroom.title', 'Room creation');
INSERT INTO `external_texts` VALUES ('navigator.eventsettings.name', 'Event name');
INSERT INTO `external_texts` VALUES ('navigator.eventsettings.editcaption', 'Edit event');
INSERT INTO `external_texts` VALUES ('navigator.favouritesfull.title', 'Cannot add favorite');
INSERT INTO `external_texts` VALUES ('navigator.ratingcaption', 'Rating:');
INSERT INTO `external_texts` VALUES ('navigator.password.info', 'This room is locked with a password. If you want to try to insert a password, you will be moved from this room.');
INSERT INTO `external_texts` VALUES ('navigator.roomsettings.desc', 'Add a description');
INSERT INTO `external_texts` VALUES ('navigator.searchusers', 'Search users');
INSERT INTO `external_texts` VALUES ('navigator.roomsettings.roominfo', 'Room info');
INSERT INTO `external_texts` VALUES ('navigator.info.doorbell', 'Room door is locked. Owner may open the door from inside.');
INSERT INTO `external_texts` VALUES ('navigator.doorbell.waiting', 'The doorbell is ringing, waiting for someone to open the door...');
INSERT INTO `external_texts` VALUES ('navigator.cannotcreateevent.error.4', 'Room event feature is currently disabled.');
INSERT INTO `external_texts` VALUES ('navigator.roomsettings.roomnameismandatory', 'You must enter a name for your room');
INSERT INTO `external_texts` VALUES ('navigator.roomsettings', 'Room settings');
INSERT INTO `external_texts` VALUES ('navigator.navibutton.2', 'Highest Score');
INSERT INTO `external_texts` VALUES ('navigator.createroom.error', 'Cannot create room');
INSERT INTO `external_texts` VALUES ('navigator.cannotcreateevent.error.3', 'The door of the room must be open to create an event. You can change the door mode in room settings.');
INSERT INTO `external_texts` VALUES ('navigator.thumbeditor.caption.top', 'Select image for the top');
INSERT INTO `external_texts` VALUES ('navigator.roomsettings.editthumbnail', 'Edit navigator icon');
INSERT INTO `external_texts` VALUES ('navigator.thumbeditor.toptab', 'Top layer');
INSERT INTO `external_texts` VALUES ('navigator.frontpage', 'Front page');
INSERT INTO `external_texts` VALUES ('navigator.textsearchresults', 'Found %room_count% rooms');
INSERT INTO `external_texts` VALUES ('navigator.createroom.limitreached', 'You are not allowed to own more than %limit% rooms.');
INSERT INTO `external_texts` VALUES ('navigator.eventsettings.desc', 'Event description');
INSERT INTO `external_texts` VALUES ('navigator.search.tags', '...or select tag below');
INSERT INTO `external_texts` VALUES ('navigator.notagsfound', 'No popular tags found');
INSERT INTO `external_texts` VALUES ('navigator.cannonaddfavourite.exists', 'This room is already in your favourites.');
INSERT INTO `external_texts` VALUES ('navigator.password.title', 'Password');
INSERT INTO `external_texts` VALUES ('navigator.createroom.nameerr', 'Room name is mandatory!');
INSERT INTO `external_texts` VALUES ('navigator.doorbell.button.ring', 'Ring doorbell');
INSERT INTO `external_texts` VALUES ('navigator.roomsettings.toadvancedsettings', 'Advanced settings');
INSERT INTO `external_texts` VALUES ('navigator.usercounttooltip.populartag', 'Amount of users in rooms that have this tag');
INSERT INTO `external_texts` VALUES ('navigator.tagsearchresults', 'Found %room_count% rooms matching %tag_name%');
INSERT INTO `external_texts` VALUES ('navigator.roomsettings.doormode', 'Access to this room:');
INSERT INTO `external_texts` VALUES ('navigator.roomname', 'Room name');
INSERT INTO `external_texts` VALUES ('navigator.navibutton.4', 'Where Are They?');
INSERT INTO `external_texts` VALUES ('navigator.roominfo.editevent', 'Edit event');
INSERT INTO `external_texts` VALUES ('navigator.navibutton.5', 'My Rooms');
INSERT INTO `external_texts` VALUES ('navigator.category', 'Category');
INSERT INTO `external_texts` VALUES ('navigator.error.nosuchflat.message', 'Could not delete the room, since it doesn\'t exist or you are not the owner.');
INSERT INTO `external_texts` VALUES ('navigator.undofavouritedeletion', 'Undo');
INSERT INTO `external_texts` VALUES ('navigator.createroom.chooselayoutcaption', 'Choose room layout');
INSERT INTO `external_texts` VALUES ('navigator.info.password', 'Password in required when entering this room.');
INSERT INTO `external_texts` VALUES ('navigator.back', 'Back');
INSERT INTO `external_texts` VALUES ('navigator.roominfo.makehome.tooltip', 'Set this room as your Home Room. You automatically enter your Home Room when you enter Habbo.');
INSERT INTO `external_texts` VALUES ('navigator.frontpage.staticsearch.8', 'Text Search');
INSERT INTO `external_texts` VALUES ('navigator.roomsettings.password', 'Password for the room:');
INSERT INTO `external_texts` VALUES ('navigator.cannotcreateevent.error.6', 'You already have an ongoing event in some other room.');
INSERT INTO `external_texts` VALUES ('navigator.roomsettings.flatctrls.caption', '%cnt% users have rights to this room');
INSERT INTO `external_texts` VALUES ('navigator.navibutton.7', 'Visited rooms');
INSERT INTO `external_texts` VALUES ('navigator.createroom.create', 'Create room');
INSERT INTO `external_texts` VALUES ('navigator.tags', 'Tags');
INSERT INTO `external_texts` VALUES ('navigator.roomsettings.deleteroom.confirm.title', 'Confirm room deletion');
INSERT INTO `external_texts` VALUES ('navigator.roomsettings.passwordconfirm', 'Re-type password:');
INSERT INTO `external_texts` VALUES ('navigator.info.tradingallowed', 'Trading is allowed in this room.');
INSERT INTO `external_texts` VALUES ('navigator.cannonaddfavourite.full', 'Your favourite list is full.');
INSERT INTO `external_texts` VALUES ('navigator.createroom.chooselayout', 'Choose');
INSERT INTO `external_texts` VALUES ('navigator.doorbell.button.cancel.entering', 'Cancel entering the room');
INSERT INTO `external_texts` VALUES ('navigator.eventsettings.end', 'End');
INSERT INTO `external_texts` VALUES ('navigator.navibutton.6', 'My Favourites');
INSERT INTO `external_texts` VALUES ('navigator.createroom.roomnameinfo', 'Room name');
INSERT INTO `external_texts` VALUES ('inventory.furni.item.landscape.name', 'Landscape');
INSERT INTO `external_texts` VALUES ('inventory.trading.info.already_open', 'You are already trading with someone and you cannot start a new trade.');
INSERT INTO `external_texts` VALUES ('inventory.badges.wearbadge', 'Wear badge');
INSERT INTO `external_texts` VALUES ('inventory.furni', 'Furniture');
INSERT INTO `external_texts` VALUES ('inventory.trading.minimized.trade_in_progress', 'Trade in progress');
INSERT INTO `external_texts` VALUES ('inventory.trading.accept', 'Accept trade');
INSERT INTO `external_texts` VALUES ('inventory.trading.info.waiting', 'Waiting for other user to confirm the trade.');
INSERT INTO `external_texts` VALUES ('inventory.trading.notification.title', 'Trading Notification');
INSERT INTO `external_texts` VALUES ('inventory.trading.minimized.continue_trade', 'Continue');
INSERT INTO `external_texts` VALUES ('inventory.furni.tab.wall', 'Wall');
INSERT INTO `external_texts` VALUES ('inventory.trading.modify', 'Modify trade');
INSERT INTO `external_texts` VALUES ('inventory.furni.placetoroom', 'Place to room');
INSERT INTO `external_texts` VALUES ('inventory.effects.inactive', 'This effect is not yet activated. One item last for %duration%, once activated. You have %itemcount% pieces of these.');
INSERT INTO `external_texts` VALUES ('inventory.trading.areoffering', 'are offering');
INSERT INTO `external_texts` VALUES ('inventory.furni.item.wallpaper.name', 'Wallpaper');
INSERT INTO `external_texts` VALUES ('inventory.trading.offer', 'Offer');
INSERT INTO `external_texts` VALUES ('inventory.effects.defaultdescription', 'No effect is selected. Buy effects from the catalogue and activate them here. Then you can select which one to use from the Me Menu.');
INSERT INTO `external_texts` VALUES ('inventory.furni.item.wallpaper.desc', 'Set this to the current room');
INSERT INTO `external_texts` VALUES ('inventory.purse.creditbalance', 'Credits: %balance%');
INSERT INTO `external_texts` VALUES ('inventory.achievements', 'Achievements');
INSERT INTO `external_texts` VALUES ('inventory.title', 'Inventory');
INSERT INTO `external_texts` VALUES ('inventory.badges.savebadges', 'Save settings');
INSERT INTO `external_texts` VALUES ('inventory.effects.active', 'This effect is activated. Time left %timeleft%/%duration%. You have %itemcount% pieces of these.');
INSERT INTO `external_texts` VALUES ('inventory.trading.isoffering', 'is offering');
INSERT INTO `external_texts` VALUES ('inventory.furni.item.floor.desc', 'Set this to the current room');
INSERT INTO `external_texts` VALUES ('inventory.trading.info.confirm', 'These are the final offers. Please confirm the trade.');
INSERT INTO `external_texts` VALUES ('inventory.purse.pixelbalance', 'Pixels: %balance%');
INSERT INTO `external_texts` VALUES ('inventory.trading.info.add', 'Add items to box.');
INSERT INTO `external_texts` VALUES ('inventory.trading.other', 'Other');
INSERT INTO `external_texts` VALUES ('inventory.trading.warning.both_accounts_disabled', 'Trading is not in use for either of you, check your trading settings.');
INSERT INTO `external_texts` VALUES ('inventory.trading.confirm', 'Confirm');
INSERT INTO `external_texts` VALUES ('inventory.purse.clubdays', 'Habbo Club: %months%m %days%d');
INSERT INTO `external_texts` VALUES ('inventory.badges.clearbadge', 'Clear badge');
INSERT INTO `external_texts` VALUES ('inventory.badges.inactivebadges', 'My badges');
INSERT INTO `external_texts` VALUES ('inventory.furni.item.landscape.desc', 'Set this to the current room');
INSERT INTO `external_texts` VALUES ('inventory.trading.warning.other_not_offering', 'The other Habbo has not put anything into trade. This might be a scamming attempt!');
INSERT INTO `external_texts` VALUES ('inventory.trading.warning.own_account_disabled', 'This account does not have trading in use. You can receive items from other users but cannot give them anything. Check your trading settings and make sure your email-address is activated.');
INSERT INTO `external_texts` VALUES ('inventory.trading.countdown', 'Please wait... %counter%');
INSERT INTO `external_texts` VALUES ('inventory.trading.warning.others_account_disabled', 'This user does not have trading in use. You can give him/her items but he can\'t give you anything in return.');
INSERT INTO `external_texts` VALUES ('inventory.effects', 'Effects');
INSERT INTO `external_texts` VALUES ('inventory.trading.you', 'You');
INSERT INTO `external_texts` VALUES ('inventory.badges', 'Badges');
INSERT INTO `external_texts` VALUES ('inventory.furni.tab.floor', 'Floor');
INSERT INTO `external_texts` VALUES ('inventory.badges.defaultdescription', 'Here are your badges. Select the ones that you want to wear and then save the selection.');
INSERT INTO `external_texts` VALUES ('inventory.furni.item.floor.name', 'Floor');
INSERT INTO `external_texts` VALUES ('inventory.badges.activebadges', 'Wearing');
INSERT INTO `external_texts` VALUES ('inventory.trading.info.closed', 'Other user cancelled the trade.');

-- ----------------------------
-- Table structure for `external_variables`
-- ----------------------------
DROP TABLE IF EXISTS `external_variables`;
CREATE TABLE `external_variables` (
  `xkey` varchar(50) NOT NULL,
  `xvalue` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of external_variables
-- ----------------------------
INSERT INTO `external_variables` VALUES ('cast.entry.39', 'hh_human_50_acc_face');
INSERT INTO `external_variables` VALUES ('cast.entry.33', 'hh_human_acc_face');
INSERT INTO `external_variables` VALUES ('client.fatal.error.url', 'http://www.habbo.co.uk/client_error');
INSERT INTO `external_variables` VALUES ('cast.entry.11', 'hh_human_hair');
INSERT INTO `external_variables` VALUES ('link.format.userpage', 'http://%predefined%//rd/%ID%');
INSERT INTO `external_variables` VALUES ('room.rating.enable', '1');
INSERT INTO `external_variables` VALUES ('interface.cmds.active.ctrl', '[\"move\",\"rotate\"]');
INSERT INTO `external_variables` VALUES ('cast.entry.28', 'hh_recycler');
INSERT INTO `external_variables` VALUES ('avatar.editor.character.update.url', 'http://%predefined%/profile/characterupdate');
INSERT INTO `external_variables` VALUES ('cast.entry.14', 'hh_human_shoe');
INSERT INTO `external_variables` VALUES ('cast.entry.16', 'hh_pets_common');
INSERT INTO `external_variables` VALUES ('cast.entry.6', 'hh_human');
INSERT INTO `external_variables` VALUES ('link.format.collectibles', 'http://%predefined%/credits/collectibles');
INSERT INTO `external_variables` VALUES ('room.cast.11', 'hh_human_fx');
INSERT INTO `external_variables` VALUES ('interstitial.max.displays', '5');
INSERT INTO `external_variables` VALUES ('room.cast.1', 'hh_soundmachine');
INSERT INTO `external_variables` VALUES ('interface.cmds.item.ctrl', '[]');
INSERT INTO `external_variables` VALUES ('cast.entry.40', 'hh_human_50_acc_head');
INSERT INTO `external_variables` VALUES ('cast.entry.32', 'hh_human_acc_eye');
INSERT INTO `external_variables` VALUES ('cast.entry.34', 'hh_human_acc_head');
INSERT INTO `external_variables` VALUES ('interface.cmds.user.owner', '[\"take_rights\",\"give_rights\",\"kick\",\"friend\",\"trade\",\"ignore\",\"unignore\",\"userpage\"]');
INSERT INTO `external_variables` VALUES ('cast.entry.15', 'hh_kiosk_room');
INSERT INTO `external_variables` VALUES ('room.recommendations', '1');
INSERT INTO `external_variables` VALUES ('room.cast.10', 'hh_roomdimmer');
INSERT INTO `external_variables` VALUES ('link.format.friendlist.pref', 'http://%predefined%/profile/friendsmanagement?tab');
INSERT INTO `external_variables` VALUES ('cast.entry.41', 'hh_human_50_body');
INSERT INTO `external_variables` VALUES ('cast.entry.10', 'hh_human_hats');
INSERT INTO `external_variables` VALUES ('room.cast.5', 'hh_human_50_leg');
INSERT INTO `external_variables` VALUES ('cast.entry.30', 'hh_tutorial');
INSERT INTO `external_variables` VALUES ('cast.entry.4', 'hh_interface');
INSERT INTO `external_variables` VALUES ('cast.entry.31', 'hh_entry_init');
INSERT INTO `external_variables` VALUES ('interface.cmds.user.ctrl', '[\"kick\",\"friend\",\"trade\",\"ignore\",\"unignore\",\"userpage\"]');
INSERT INTO `external_variables` VALUES ('cast.entry.19', 'hh_furni_classes');
INSERT INTO `external_variables` VALUES ('interface.cmds.photo.owner', '[\"pick\",\"delete\"]');
INSERT INTO `external_variables` VALUES ('cast.entry.21', 'hh_club');
INSERT INTO `external_variables` VALUES ('displayer.tag.expiration.time', '600000');
INSERT INTO `external_variables` VALUES ('swimjump.key.list', '[#run1:\"A\", #run2:\"D\", #dive1:\"W\", #dive2:\"E\", #dive3:\"A\", #dive4:\"S\", #dive5:\"D\", #dive6:\"Z\", #dive7:\"X\", #jump:\"SPACE\"]');
INSERT INTO `external_variables` VALUES ('link.format.credits', 'http://%predefined%/credits');
INSERT INTO `external_variables` VALUES ('cast.entry.17', 'hh_room_utils');
INSERT INTO `external_variables` VALUES ('cast.entry.44', 'hh_ig');
INSERT INTO `external_variables` VALUES ('navigator.cache.duration', '30');
INSERT INTO `external_variables` VALUES ('cast.entry.35', 'hh_human_50_face');
INSERT INTO `external_variables` VALUES ('cast.entry.45', 'hh_ig_interface');
INSERT INTO `external_variables` VALUES ('cast.entry.20', 'hh_room');
INSERT INTO `external_variables` VALUES ('room.cast.4', 'hh_human_50_shirt');
INSERT INTO `external_variables` VALUES ('room.cast.3', 'hh_human_acc_waist');
INSERT INTO `external_variables` VALUES ('interface.cmds.photo.ctrl', '[]');
INSERT INTO `external_variables` VALUES ('cast.entry.18', 'hh_room_ui');
INSERT INTO `external_variables` VALUES ('cast.entry.47', 'hh_guide');
INSERT INTO `external_variables` VALUES ('club.subscription.disabled', '1');
INSERT INTO `external_variables` VALUES ('cast.entry.12', 'hh_human_shirt');
INSERT INTO `external_variables` VALUES ('cast.entry.48', 'hh_badges');
INSERT INTO `external_variables` VALUES ('interface.cmds.user.friend', '[\"friend\",\"trade\",\"ignore\",\"unignore\",\"userpage\"]');
INSERT INTO `external_variables` VALUES ('room.cast.2', 'hh_human_acc_chest');
INSERT INTO `external_variables` VALUES ('cast.entry.24', 'hh_cat_new');
INSERT INTO `external_variables` VALUES ('link.format.mailpage', 'http://%predefined%/me#mail/compose/%recipientid%');
INSERT INTO `external_variables` VALUES ('text.render.compatibility.mode', '2');
INSERT INTO `external_variables` VALUES ('interface.cmds.active.owner', '[\"move\",\"rotate\",\"pick\"]');
INSERT INTO `external_variables` VALUES ('cast.entry.43', 'hh_instant_messenger');
INSERT INTO `external_variables` VALUES ('group.badge.url', '%predefined%/habbo-imaging/badge/%imagerdata%.gif');
INSERT INTO `external_variables` VALUES ('cast.entry.1', 'hh_entry_uk');
INSERT INTO `external_variables` VALUES ('hh.cast.11', 'hh_badges');
INSERT INTO `external_variables` VALUES ('cast.entry.7', 'hh_human_body');
INSERT INTO `external_variables` VALUES ('cast.entry.13', 'hh_human_leg');
INSERT INTO `external_variables` VALUES ('client.full.refresh.period', '5000');
INSERT INTO `external_variables` VALUES ('cast.entry.42', 'hh_friend_list');
INSERT INTO `external_variables` VALUES ('cast.entry.2', 'hh_entry_base');
INSERT INTO `external_variables` VALUES ('room.cast.9', 'hh_human_50_acc_waist');
INSERT INTO `external_variables` VALUES ('text.crap.fixing', '1');
INSERT INTO `external_variables` VALUES ('cast.entry.26', 'hh_buffer');
INSERT INTO `external_variables` VALUES ('client.version.id', '401');
INSERT INTO `external_variables` VALUES ('cast.entry.27', 'hh_dynamic_downloader');
INSERT INTO `external_variables` VALUES ('moderator.cmds', '[\":alert x\",\":ban x\",\":kick x\",\":superban x\",\":shutup x\",\":unmute x\",\":transfer x\",\":softkick x\"]');
INSERT INTO `external_variables` VALUES ('rosetta.warning.page.url', 'http://%predefined%/client_popup/rosetta_info');
INSERT INTO `external_variables` VALUES ('link.format.mail.inbox', 'http://%predefined%/me#mail');
INSERT INTO `external_variables` VALUES ('link.format.user.search', 'http://%predefined%/me#habbo-search');
INSERT INTO `external_variables` VALUES ('room.cast.6', 'hh_human_50_shoe');
INSERT INTO `external_variables` VALUES ('cast.entry.36', 'hh_human_50_hats');
INSERT INTO `external_variables` VALUES ('room.cast.8', 'hh_human_50_acc_chest');
INSERT INTO `external_variables` VALUES ('avatar.editor.url', '%predefined%/profile');
INSERT INTO `external_variables` VALUES ('cast.entry.22', 'hh_photo');
INSERT INTO `external_variables` VALUES ('link.format.habboclub', 'http://%predefined%/credits/habboclub');
INSERT INTO `external_variables` VALUES ('link.format.club', 'http://%predefined%/credits/habboclub');
INSERT INTO `external_variables` VALUES ('cast.entry.23', 'hh_navigator');
INSERT INTO `external_variables` VALUES ('castload.retry.delay', '20000');
INSERT INTO `external_variables` VALUES ('link.format.mail.compose', 'http://%predefined%/me#mail/compose/%recipientid%/%random%/');
INSERT INTO `external_variables` VALUES ('interface.cmds.item.owner', '[\"pick\"]');
INSERT INTO `external_variables` VALUES ('link.format.pets', 'http://%predefined%/hotel/pets');
INSERT INTO `external_variables` VALUES ('interface.cmds.user.personal', '[\"badge\",\"dance\",\"wave\",\"hcdance\",\"userpage\"]');
INSERT INTO `external_variables` VALUES ('paalu.key.list', '[#bal1:\"Q\", #bal2:\"E\", #push1:\"A\", #push2:\"D\", #move1:\"N\", #move2:\"M\", #stabilise:\"SPACE\"]');
INSERT INTO `external_variables` VALUES ('pixels.enabled', 'true');
INSERT INTO `external_variables` VALUES ('link.format.tag.search', 'http://%predefined%//tag/search?tag');
INSERT INTO `external_variables` VALUES ('room.cast.small.1', 'hh_pets_50');
INSERT INTO `external_variables` VALUES ('cast.entry.25', 'hh_cat_gfx_all');
INSERT INTO `external_variables` VALUES ('cast.entry.5', 'hh_patch_uk');
INSERT INTO `external_variables` VALUES ('cast.entry.9', 'hh_human_item');
INSERT INTO `external_variables` VALUES ('room.cast.12', 'hh_human_50_fx');
INSERT INTO `external_variables` VALUES ('cast.entry.37', 'hh_human_50_hair');
INSERT INTO `external_variables` VALUES ('cast.entry.38', 'hh_human_50_acc_eye');
INSERT INTO `external_variables` VALUES ('cast.entry.8', 'hh_human_face');
INSERT INTO `external_variables` VALUES ('room.cast.private', '[\"hh_room_private\", \"hh_room_landscapes\"]');
INSERT INTO `external_variables` VALUES ('cast.entry.46', 'hh_pets');
INSERT INTO `external_variables` VALUES ('client.flood.timeout', '300000');
INSERT INTO `external_variables` VALUES ('cast.entry.29', 'hh_poll');
INSERT INTO `external_variables` VALUES ('room.cast.7', 'hh_human_50_item');
INSERT INTO `external_variables` VALUES ('cast.entry.3', 'hh_shared');
INSERT INTO `external_variables` VALUES ('friend_request_options', 'Advanced options.');
INSERT INTO `external_variables` VALUES ('char.conversion.mac', '[128:219,130:226,131:196,132:227,133:201,134:160,135:224,136:246,137:228,139:220,140:206,145:212,146:213,147:210,148:211,149:165,150:208,151:209,152:247,153:170,155:221,156:207,159:217,161:193,165:180,167:164,168:172,170:187,171:199,172:194,173:208,174:168,176:161,180:171,182:166,183:225,184:252,186:188,187:200,191:192,192:203,193:231,194:229,195:204,196:128,197:129,198:174,199:130,200:233,201:131,202:230,203:232,204:237,205:234,206:235,207:236,209:132,210:241,211:238,212:239,213:205,214:133,216:175,217:244,218:242,219:243,220:134,223:167,224:136,225:135,226:137,227:139,228:138,229:140,230:190,231:141,232:143,233:142,234:144,235:145,236:147,237:146,238:148,239:149,241:150,242:152,243:151,244:153,246:154,247:214,248:191,249:157,250:156,251:158,252:159,255:216]');
INSERT INTO `external_variables` VALUES ('profile.events.enabled', 'false');
INSERT INTO `external_variables` VALUES ('console_request_massoperation_instruction', 'Use the options below to accept or decline ALL friend requests you have waiting.');
INSERT INTO `external_variables` VALUES ('friend_request_declined', 'Declined!');
INSERT INTO `external_variables` VALUES ('profile.fields.enabled', 'false');
INSERT INTO `external_variables` VALUES ('friend_request_accepted', 'Accepted!');
INSERT INTO `external_variables` VALUES ('profiler.enabled', 'false');
INSERT INTO `external_variables` VALUES ('profile.core.enabled', 'false');
INSERT INTO `external_variables` VALUES ('profile.network.enabled', 'false');
INSERT INTO `external_variables` VALUES ('friend_request_failed', 'Failed!');
INSERT INTO `external_variables` VALUES ('friend_request_massoperation_cancel', 'Back to request list.');
INSERT INTO `external_variables` VALUES ('console_select_requests', 'Following users have asked to be your friend. Please accept or decline.');
INSERT INTO `external_variables` VALUES ('friend_request_accept_all', 'Accept all requests.');
INSERT INTO `external_variables` VALUES ('friend_request_decline_all', 'Decline all requests.');
INSERT INTO `external_variables` VALUES ('console_request_massoperation_title', 'You have %messageCount% friend requests waiting.');
INSERT INTO `external_variables` VALUES ('client.use.invites', '1');
INSERT INTO `external_variables` VALUES ('external.figurepartlist.txt', 'http://www.habbohotel.co.uk/gamedata/figuredata');
INSERT INTO `external_variables` VALUES ('productdata.load.url', 'http://www.habbohotel.co.uk/gamedata/productdata?hash');
INSERT INTO `external_variables` VALUES ('hotelview.banner.url', 'http://$sitename$/gamedata/banner');
INSERT INTO `external_variables` VALUES ('purse.transactions.active', '1');
INSERT INTO `external_variables` VALUES ('client.textdata.utf8', '1');
INSERT INTO `external_variables` VALUES ('furnidata.load.url', 'http://www.habbohotel.co.uk/gamedata/furnidata?hash');
INSERT INTO `external_variables` VALUES ('dynamic.download.name.template', '%revision%/hh_furni_xx_%typeid%.cct');
INSERT INTO `external_variables` VALUES ('navigator.visible.public.root', '3');
INSERT INTO `external_variables` VALUES ('room.default.wall', '201');
INSERT INTO `external_variables` VALUES ('figure.draworder.xml.secure', 'https://www.habbo.co.uk/gamedata/figurepartconfig/draworder');
INSERT INTO `external_variables` VALUES ('navigator.private.default', '4');
INSERT INTO `external_variables` VALUES ('client.window.title', 'Habbo Hotel');
INSERT INTO `external_variables` VALUES ('room.default.floor', '111');
INSERT INTO `external_variables` VALUES ('struct.font.tooltip', '[#font:\"v\", #fontSize:9,#lineHeight:10,#color:rgb(\"#000000\"),#ilk:#struct,#fontStyle:[#plain]]');
INSERT INTO `external_variables` VALUES ('navigator.public.default', '3');
INSERT INTO `external_variables` VALUES ('stats.tracking.javascript.template', '/TCODE');
INSERT INTO `external_variables` VALUES ('struct.font.link', '[#font:\"v\", #fontSize:9,#lineHeight:10,#color:rgb(\"#000000\"),#ilk:#struct,#fontStyle:[#underline]]');
INSERT INTO `external_variables` VALUES ('flash.dynamic.download.url', 'http://images.habbohotel.co.uk/dcr/hof_furni/');
INSERT INTO `external_variables` VALUES ('flash.dynamic.download.name.template', '%revision%/%typeid%.swf');
INSERT INTO `external_variables` VALUES ('fuse.project.id', 'habbo_uk');
INSERT INTO `external_variables` VALUES ('figure.animation.xml', 'http://www.habbohotel.co.uk/gamedata/figurepartconfig/animation');
INSERT INTO `external_variables` VALUES ('private.image.library.url', 'http://images-webtool.varoke.net/c_images/');
INSERT INTO `external_variables` VALUES ('dynamic.download.url', 'http://images.habbohotel.co.uk/dcr/hof_furni/');
INSERT INTO `external_variables` VALUES ('figure.partsets.xml', 'http://www.habbohotel.co.uk/gamedata/figurepartconfig/partsets');
INSERT INTO `external_variables` VALUES ('tutorial.name.new_user_flow', 'NUF_mini');
INSERT INTO `external_variables` VALUES ('navigator.visible.private.root', '4');
INSERT INTO `external_variables` VALUES ('external.figurepartlist.txt.secure', 'https://www.habbo.co.uk/gamedata/figuredata');
INSERT INTO `external_variables` VALUES ('struct.font.italic', '[#font:\"v\", #fontSize:9,#lineHeight:10,#color:rgb(\"#000000\"),#ilk:#struct,#fontStyle:[#italic]]');
INSERT INTO `external_variables` VALUES ('language', 'en');
INSERT INTO `external_variables` VALUES ('image.library.url', 'http://images.habbohotel.co.uk/c_images/');
INSERT INTO `external_variables` VALUES ('struct.font.plain', '[#font:\"v\", #fontSize:9,#lineHeight:10,#color:rgb(\"#000000\"),#ilk:#struct,#fontStyle:[#plain]]');
INSERT INTO `external_variables` VALUES ('navigator.default.view', 'public');
INSERT INTO `external_variables` VALUES ('security.cast.load.url', 'http://www.habbohotel.co.uk/gamedata/sec.cct?t');
INSERT INTO `external_variables` VALUES ('figure.draworder.xml', 'http://www.habbohotel.co.uk/gamedata/figurepartconfig/draworder');
INSERT INTO `external_variables` VALUES ('stats.tracking.javascript', 'google');
INSERT INTO `external_variables` VALUES ('struct.font.bold', '[#font:\"vb\",#fontSize:9,#lineHeight:10,#color:rgb(\"#000000\"),#ilk:#struct,#fontStyle:[#plain]]');
INSERT INTO `external_variables` VALUES ('struct.font.grey', '[#font:\"v\", #fontSize:9,#lineHeight:10,#color:rgb(\"#666666\"),#ilk:#struct,#fontStyle:[#italic]]');
INSERT INTO `external_variables` VALUES ('permitted.name.chars', '1234567890qwertyuiopasdfghjklzxcvbnm-');
INSERT INTO `external_variables` VALUES ('dynamic.download.samples.template', '%revision%/%typeid%.cct');

-- ----------------------------
-- Table structure for `furniture_templates`
-- ----------------------------
DROP TABLE IF EXISTS `furniture_templates`;
CREATE TABLE `furniture_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sprite` varchar(20) NOT NULL,
  `type` int(1) unsigned NOT NULL,
  `name` varchar(25) NOT NULL,
  `description` varchar(30) NOT NULL,
  `color` varchar(20) NOT NULL,
  `length` int(2) unsigned NOT NULL,
  `width` int(2) unsigned NOT NULL,
  `heigth` int(2) unsigned NOT NULL,
  `tradeable` int(1) NOT NULL,
  `recycleable` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of furniture_templates
-- ----------------------------
INSERT INTO `furniture_templates` VALUES ('1', 'hologram', '1', 'Holo boy', 'He loves turtles', '0,0,0', '1', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for `messenger_buddies_categories`
-- ----------------------------
DROP TABLE IF EXISTS `messenger_buddies_categories`;
CREATE TABLE `messenger_buddies_categories` (
  `userid` int(10) unsigned NOT NULL,
  `categoryid` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of messenger_buddies_categories
-- ----------------------------

-- ----------------------------
-- Table structure for `messenger_buddylist`
-- ----------------------------
DROP TABLE IF EXISTS `messenger_buddylist`;
CREATE TABLE `messenger_buddylist` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `buddyid` int(10) unsigned NOT NULL,
  `accepted` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of messenger_buddylist
-- ----------------------------
INSERT INTO `messenger_buddylist` VALUES ('1', '3', '2', '');
INSERT INTO `messenger_buddylist` VALUES ('2', '1', '3', '');
INSERT INTO `messenger_buddylist` VALUES ('3', '2', '1', '');
INSERT INTO `messenger_buddylist` VALUES ('4', '3', '1', '');
INSERT INTO `messenger_buddylist` VALUES ('5', '1', '2', '');

-- ----------------------------
-- Table structure for `messenger_categories`
-- ----------------------------
DROP TABLE IF EXISTS `messenger_categories`;
CREATE TABLE `messenger_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `owner` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of messenger_categories
-- ----------------------------

-- ----------------------------
-- Table structure for `room_categories`
-- ----------------------------
DROP TABLE IF EXISTS `room_categories`;
CREATE TABLE `room_categories` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The ID of the category',
  `parent` int(5) unsigned NOT NULL DEFAULT '4' COMMENT 'The parent category of the category',
  `name` varchar(38) NOT NULL COMMENT 'The name of the category',
  `type` enum('2','0') NOT NULL COMMENT 'The type of rooms in the category. (0 = guestroom, 2 = publicroom)',
  `trading` int(1) NOT NULL COMMENT 'Determines if trading is allowed in this category',
  `minrank_create` int(2) NOT NULL DEFAULT '1' COMMENT 'The minimum rank an user must have to create a room in this category',
  `minrank_view` int(2) NOT NULL DEFAULT '1' COMMENT 'The minimum rank an user must have to view this category',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of room_categories
-- ----------------------------
INSERT INTO `room_categories` VALUES ('3', '0', 'Public rooms', '0', '0', '7', '1');
INSERT INTO `room_categories` VALUES ('4', '0', 'Guestrooms', '2', '0', '7', '1');
INSERT INTO `room_categories` VALUES ('0', '0', 'No category', '2', '0', '1', '1');
INSERT INTO `room_categories` VALUES ('1', '4', 'Cool category', '2', '1', '1', '1');
INSERT INTO `room_categories` VALUES ('2', '1', 'Another cool category', '2', '0', '1', '1');
INSERT INTO `room_categories` VALUES ('5', '2', 'The best category in the world |||||||', '2', '1', '1', '1');
INSERT INTO `room_categories` VALUES ('6', '3', 'Welcome louges', '0', '0', '7', '1');
INSERT INTO `room_categories` VALUES ('7', '4', 'Test category 2', '2', '1', '1', '1');

-- ----------------------------
-- Table structure for `room_ratings`
-- ----------------------------
DROP TABLE IF EXISTS `room_ratings`;
CREATE TABLE `room_ratings` (
  `roomid` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `value` enum('+','-') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of room_ratings
-- ----------------------------

-- ----------------------------
-- Table structure for `rooms`
-- ----------------------------
DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` int(10) unsigned NOT NULL,
  `name` varchar(40) NOT NULL,
  `description` varchar(100) NOT NULL,
  `category` int(10) unsigned NOT NULL,
  `type` enum('2','0') NOT NULL,
  `accesstype` enum('2','1','0') NOT NULL DEFAULT '0',
  `password` varchar(30) NOT NULL,
  `maxvisitors` int(3) unsigned NOT NULL,
  `shockwavefiles` varchar(100) NOT NULL,
  `model` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rooms
-- ----------------------------
INSERT INTO `rooms` VALUES ('4', '1', 'Test lock', 'This room is locked', '4', '0', '1', '', '1', '', 'a');
INSERT INTO `rooms` VALUES ('1', '1', 'Welcome louge', 'welcome_lounge', '6', '2', '0', '', '1', 'welcome_lounge', 'newbie_lobby');
INSERT INTO `rooms` VALUES ('3', '1', 'Test password', 'This room has password', '4', '0', '2', 'password', '1', '', 'b');
INSERT INTO `rooms` VALUES ('2', '1', 'Test open', 'This room is open', '4', '0', '0', '', '1', '', 'c');

-- ----------------------------
-- Table structure for `user_bans`
-- ----------------------------
DROP TABLE IF EXISTS `user_bans`;
CREATE TABLE `user_bans` (
  `userid` int(15) NOT NULL,
  `expires` varchar(30) NOT NULL,
  `reason` varchar(60) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_bans
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(9) COLLATE latin1_general_ci NOT NULL,
  `role` tinyint(3) unsigned NOT NULL,
  `signedup` date NOT NULL,
  `email` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dob` char(10) COLLATE latin1_general_ci NOT NULL,
  `motto` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `figure` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `gender` varchar(1) COLLATE latin1_general_ci NOT NULL,
  `coins` int(10) unsigned NOT NULL,
  `films` int(10) unsigned NOT NULL,
  `gametickets` int(10) unsigned NOT NULL,
  `ssoticket` text COLLATE latin1_general_ci NOT NULL,
  `lastvisit` varchar(22) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`username`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('3', 'awa', '1', '7', '2010-04-01', 'a@a.com', '1-1-1990', '=D', 'hd-180-59', 'm', '1232', '1', '2', '111', '26-03-2010 03:42:30 ');
INSERT INTO `users` VALUES ('2', 'awa300', '1', '7', '2010-03-22', 'a@a.com', '1-1-1990', '=D', 'hd-180-59', 'm', '1232', '1', '2', '222', '23-03-2010 08:00:18 ');
INSERT INTO `users` VALUES ('1', 'awa500', '1', '7', '2010-03-22', 'a@a.com', '1-1-1990', '=D', 'hd-180-59', 'm', '1232', '1', '2', '333', '22-03-2010 08:36:57 ');

-- ----------------------------
-- Table structure for `users_achievements`
-- ----------------------------
DROP TABLE IF EXISTS `users_achievements`;
CREATE TABLE `users_achievements` (
  `userid` int(10) unsigned NOT NULL,
  `achievement` tinytext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users_achievements
-- ----------------------------
