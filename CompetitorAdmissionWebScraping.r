# required packages

# uncomment if need to install
# install.packages("tidyverse")
# install.packages("data.table")
install.packages("openxlsx")

library("tidyverse")
library("rvest")
library("data.table")
library("openxlsx")

# Functions used:
# the webscraping package is rvest (https://rvest.tidyverse.org/)
# read_html > reads the website
# html_element/html_nodes > finds the part of the website to parse
# html_table > produces a table
# html_text > produces a string
# cbind > adds a column
# rbind > appends the table to another table
# trimws > removes leading and trailing whitespace
# gsub > removes specific characters from a string
# setDT > converts to a table
# substr > specifies a number of characters from a string to keep
# str_sub > same as above but useful for end of strings as allows negative indexing
# t > transpose tables into a matrix
# strsplit < separates a column by a delimiter
# colnames < names columns
# write_xlsx > exports to an Excel file

#Column Names
Columns = c("Ticket", "With Gift Aid", "Without Gift Aid", "Site", "WWT Comparison Site")

#URLs
# If error, check that the URL is still correct

#WWT
SL <- read_html("https://www.wwt.org.uk/wetland-centres/slimbridge/plan-your-visit/prices/")
LO <- read_html("https://www.wwt.org.uk/wetland-centres/london/plan-your-visit/prices/")
WN <- read_html("https://www.wwt.org.uk/wetland-centres/welney/plan-your-visit/prices/")
MM <- read_html("https://www.wwt.org.uk/wetland-centres/martin-mere/plan-your-visit/prices/")
LL <- read_html("https://www.wwt.org.uk/wetland-centres/llanelli/plan-your-visit/prices/")
CA <- read_html("https://www.wwt.org.uk/wetland-centres/caerlaverock/plan-your-visit/prices/")
CE <- read_html("https://www.wwt.org.uk/wetland-centres/castle-espie/plan-your-visit/prices/")
WA <- read_html("https://www.wwt.org.uk/wetland-centres/washington/plan-your-visit/prices/")
AR <- read_html("https://www.wwt.org.uk/wetland-centres/arundel/plan-your-visit/prices/")

#NT
Dinefwr <- read_html("https://www.nationaltrust.org.uk/dinefwr#Prices")
Castle_Ward <- read_html("https://www.nationaltrust.org.uk/castle-ward#Prices")
Mount_Stewart <- read_html("https://www.nationaltrust.org.uk/mount-stewart#Prices")
Rulford_Hall <- read_html("https://www.nationaltrust.org.uk/rufford-old-hall#Prices")
Tyntesfield <- read_html("https://www.nationaltrust.org.uk/tyntesfield#Prices")
Gibside <- read_html("https://www.nationaltrust.org.uk/gibside#Prices")
Lighthouse <- read_html("https://www.nationaltrust.org.uk/souter-lighthouse-and-the-leas#Prices")
Washington_Hall <- read_html("https://www.nationaltrust.org.uk/washington-old-hall#Prices")
Wicken <- read_html("https://www.nationaltrust.org.uk/wicken-fen-nature-reserve#Prices")

#RSPB
PaghamURL <- read_html("https://www.rspb.org.uk/reserves-and-events/reserves-a-z/pagham-harbour-local-nature-reserve/")
PulboroughURL <- read_html("https://www.rspb.org.uk/reserves-and-events/reserves-a-z/pulborough-brooks/")
MerseheadURL <- read_html("https://www.rspb.org.uk/reserves-and-events/reserves-a-z/mersehead/")
Burton_MereURL <- read_html("https://www.rspb.org.uk/reserves-and-events/reserves-a-z/dee-estuary-burton-mere-wetlands/")
LeightonURL <- read_html("https://www.rspb.org.uk/reserves-and-events/reserves-a-z/leighton-moss/")
MarshsideURL <- read_html("https://www.rspb.org.uk/reserves-and-events/reserves-a-z/marshside/")
SaltholmeURL <- read_html("https://www.rspb.org.uk/reserves-and-events/reserves-a-z/saltholme/")
DraytonURL <- read_html("https://www.rspb.org.uk/reserves-and-events/reserves-a-z/fen-drayton-lakes/")
FramptonURL <- read_html("https://www.rspb.org.uk/reserves-and-events/reserves-a-z/frampton-marsh/")
LakenheathURL <- read_html("https://www.rspb.org.uk/reserves-and-events/reserves-a-z/lakenheath-fen/")
OuseURL <- read_html("https://www.rspb.org.uk/reserves-and-events/reserves-a-z/ouse-fen/")
OuseWURL <- read_html("https://www.rspb.org.uk/reserves-and-events/reserves-a-z/ouse-washes/")
SnettishamURL <- read_html("https://www.rspb.org.uk/reserves-and-events/reserves-a-z/snettisham/")

#Others
Arundel_CastleURL <- read_html("https://www.arundelcastle.org/opening-times/")
British_Wildlife <- read_html("https://britishwildlifecentre.co.uk/planyourvisit/prices-2/")
WealdURL <- read_html("https://www.wealddown.co.uk/plan-your-visit/#admission")
DeanURL <- read_html("https://www.westdean.org.uk/gardens/opening-hours-and-admissions#opening-hours")
Kennedy <- read_html("https://castlekennedygardens.com/tickets-prices/")
CA_Castle <- read_html("https://www.historicenvironment.scot/visit-a-place/explorer-passes/#section-3")
Cream <- read_html("https://www.creamogalloway.co.uk/visitor-centre/crazy-golf-crazy-croquet")
DalsconeFarm <- read_html("https://www.dalsconefarmfun.co.uk/visit/prices/")
Belfast_ZooURL <- read_html("https://www.belfastcity.gov.uk/zoo/prices")
Montalto <- read_html("https://montaltoestate.com/plan-your-visit/tickets/")
Titanic <- read_html("https://www.titanicbelfast.com/visitor-information/prices/")
WelshGardens <- read_html("https://accessvam.accessacloud.com/GardenOfWalesBookings/BookTickets.aspx?eid=0024")
Pembry_Ski <- read_html("https://www.pembreycountrypark.wales/plan-your-visit/ski-activity-centre/")
Battersea <- read_html("https://www.batterseaparkzoo.co.uk/tickets/prices/")
Bockett <- read_html("https://www.bockettsfarm.co.uk/plan-your-visit/times-and-prices")
Hampton <- read_html("https://www.hrp.org.uk/hampton-court-palace/visit/tickets-and-prices/#gs.bniw36")
Syon <- read_html("https://www.syonpark.co.uk/visiting/ticket-information")
Farmer_TedsURL <- read_html("https://www.farmerteds.com/tickets-and-prices")
Knowsley <- read_html("https://www.knowsleysafariexperience.co.uk/tickets/")
Birdland <- read_html("https://www.birdland.co.uk/visit/admission-prices-opening-times/")
Bristol_Aquarium <- read_html("https://www.bristolaquarium.co.uk/visitor-info/admission-prices/")
CotswoldURL <- read_html("https://www.cotswoldwildlifepark.co.uk/plan-your-visit/ticket-prices/")
Noah <- read_html("https://www.noahsarkzoofarm.co.uk/ticket-prices")
Beamish <- read_html("https://www.beamish.org.uk/plan-your-visit/")
Alnwick <- read_html("https://accessvam.accessacloud.com/AlnwickGardenBookings/BookTickets.aspx?eid=0090")
Whitehouse <- read_html("https://www.whitehousefarmcentre.co.uk/your-visit/prices/")
CleyURL <- read_html("https://www.norfolkwildlifetrust.org.uk/wildlife-in-norfolk/nature-reserves/reserves/cley-and-salthouse-marshes#TabsReserveTabs_TabCarparkcharge")
High_Lodge <- read_html("https://www.forestryengland.uk/high-lodge")
PensthorpeURL <- read_html("https://www.pensthorpe.com/plan-your-day/opening-times-prices/")
NorthZooURL <- read_html("https://www.northumberlandzoo.co.uk/prices") 
NorthColURL <- read_html("https://northumberland.ac.uk/for-visitors/northumberland-college-zoo/pricing/")
LifeURL <- read_html("https://www.life.org.uk/visit/tickets-passes-offers")
JarrowURL <- read_html("https://jarrowhall.com/tickets/")
HolmsideURL <- read_html("https://www.holmsidepark.co.uk/opening-times-prices/")
HallfarmURL <- read_html("https://www.hallhillfarm.co.uk/prices/")
AnimalFunURL <- read_html("https://www.downatthefarm.co.uk/opening-times-prices/")
AdventureURL <- read_html('https://adventurevalley.digitickets.co.uk/event-tickets/38170?catID=38211&')
WestonbirtURL <- read_html('https://www.forestryengland.uk/westonbirt-the-national-arboretum')
SudeleyURL <- read_html('https://sudeleycastle.co.uk/plan-your-visit/opening-times-and-prices')
CattleURL <- read_html('https://www.cattlecountry.co.uk/tickets')
Berkeley <- read_html('https://www.berkeley-castle.com/online-tickets')
SouthportURL <- read_html('https://www.southportpleasureland.com/tickets/')
BluePlanetURL <- read_html('https://www.blueplanetaquarium.com/visitor-info/admission-prices/')
ThorpeURL <- read_html('https://www.thorpepark.com/tickets-passes/day-tickets/')
KewURL <- read_html('https://www.kew.org/kew-gardens/visit-kew-gardens/tickets')
ChiswickURL <- read_html('https://chiswickhouseandgardens.org.uk/plan-your-visit/opening-times-and-prices/')
Pembry_GolfURL <- read_html('https://www.pembreycountrypark.wales/plan-your-visit/golf/')
ManorURL <- read_html('https://www.manorwildlifepark.co.uk/ticket-info')
FollyURL <- read_html('https://www.folly-farm.co.uk/plan-your-day/prices/')
W5URL <- read_html('https://w5online.co.uk/buy-tickets')
TarzanURL <- read_html('https://www.thejungleni.com/activity/adults-tarzans-tree-top-adventure/')
ArkURL <- read_html('https://www.thearkopenfarm.co.uk/')
StreamURL <- read_html('https://streamvale.com/prices')
NTSURL <- read_html('https://www.nts.org.uk/visit/places/threave-garden/planning-your-visit#entry-prices')
MabieURL <- read_html('https://mabiefarmpark.co.uk/admission-and-ride-prices/')
PortURL <- read_html('https://www.portloganfishpond.com/')
LoganURL <- read_html('https://www.rbge.org.uk/visit/logan-botanic-garden/')
DrumlanrigURL <- read_html('https://www.drumlanrigcastle.co.uk/attraction/adventure-playground/')
SouthURL <- read_html('https://www.southdowns.gov.uk/travelling-around/south-downs-discovery-ticket/')
MarwellURL <- read_html('https://www.marwell.org.uk/ticket-prices-offers/')

# Membership URLs
WWTMembershipURL <- read_html('https://www.wwt.org.uk/join-and-support/join/membership/')
NTMembershipURL <- read_html('https://www.nationaltrust.org.uk/join-us')
RSPBMembershipURL <- read_html('https://www.rspb.org.uk/join-and-donate/join-us/')
WildlifeTrustBCNURL <- read_html('https://www.wildlifebcn.org/become-member')
PensthorpeMembershipURL <- read_html('https://www.pensthorpe.com/plan-your-day/annual-membership/')
WhiteMembershipURL <- read_html('https://www.whitehousefarmcentre.co.uk/your-visit/seasonal-pass/')

# WWT prices
# As the prices are stored within a html table we can extract via html_element("table")

#Slimbridge
SL <- SL %>% 
	html_element("table") %>% 
	html_table()

# Adding a column to define this as X site, so that when combined it has an identifier
SL <- cbind(SL, Site="Slimbridge", "WWT Comparison Site"="Slimbridge")

#London
LO <- LO %>% 
	html_element("table") %>% 
	html_table()
LO <- cbind(LO, Site="London", "WWT Comparison Site"="London")

# Creating a WWT table of all sites
WWT <- rbind(SL, LO)

#Welney
WN <- WN %>% 
	html_element("table") %>% 
	html_table()
WN <- cbind(WN, Site="Welney", "WWT Comparison Site"="Welney")
WWT <- rbind(WWT, WN)

#Martin Mere
MM <- MM %>% 
	html_element("table") %>% 
	html_table()
MM <- cbind(MM, Site="Martin Mere", "WWT Comparison Site"="Martin Mere")
WWT <- rbind(WWT, MM)

#Llanelli
LL <- LL %>% 
	html_element("table") %>% 
	html_table()
LL <- cbind(LL, Site="Llanelli", "WWT Comparison Site"="Llanelli")
WWT <- rbind(WWT, LL)

#Caerlaverock
CA <- CA %>% 
	html_element("table") %>% 
	html_table()
CA <- cbind(CA, Site="Caerlaverock", "WWT Comparison Site"="Caerlaverock")
WWT <- rbind(WWT, CA)

#Castle Espie
CE <- CE %>% 
	html_element("table") %>% 
	html_table()
CE <- cbind(CE, Site="Castle Espie", "WWT Comparison Site"="Castle Espie")
WWT <- rbind(WWT, CE)

#Washington
WA <- WA %>% 
	html_element("table") %>% 
	html_table()
WA <- cbind(WA, Site="Washington", "WWT Comparison Site"="Washington")
WWT <- rbind(WWT, WA)

#Arundel
AR <- AR %>% 
	html_element("table") %>% 
	html_table()
AR <- cbind(AR, Site="Arundel", "WWT Comparison Site"="Arundel")
WWT <- rbind(WWT, AR)

#Removing free tickets and matching value names
WWT <- WWT[-c(4,5,10,11,16,17,22,23,28,29,34,35,40,41,46,47,52,53),]
WWT$Ticket <- gsub("Children","Child",as.character(WWT$Ticket))

# National Trust

#Dinefwr
# National trust has a more complicated website that may require using XPath, this can be copied via Inspect Source on Google Chrome
# This also requires a second step of setting the table as fill=TRUE and also choosing the correct element, in this case the container [[1]]
Dinefwr <- Dinefwr %>% 
	html_nodes(xpath='//*[@id="nt.prices.category.2"]/table') %>% 
	html_table(fill=TRUE)
Dinefwr <- Dinefwr[[1]]
Dinefwr <- cbind(Dinefwr,Site="NT: Dinefwr","WWT Comparison Site"="Llanelli")

#Castle Ward
Castle_Ward <- Castle_Ward %>% 
	html_element('table') %>% 
	html_table()
Castle_Ward <- cbind(Castle_Ward,Site="NT: Castle Ward", "WWT Comparison Site"="Castle Espie")

# Some of NT have group tickets, as these can't be compared they are removed from the dataframe
Castle_Ward <- Castle_Ward[-c(5,6),]

NT <- rbind(Dinefwr, Castle_Ward)

#Mount Stewart
Mount_Stewart <- Mount_Stewart %>% 
	html_element('table') %>% 
	html_table()
Mount_Stewart <- cbind(Mount_Stewart,Site="NT: Mount Stewart", "WWT Comparison Site"="Castle Espie")
NT <- rbind(NT, Mount_Stewart)

#Rulford Hall
Rulford_Hall <- Rulford_Hall %>% 
	html_element('table') %>% 
	html_table()
Rulford_Hall <- cbind(Rulford_Hall ,Site="NT: Rulford Old Hall","WWT Comparison Site"="Martin Mere")
Rulford_Hall <- Rulford_Hall[-c(5,6),]
NT <- rbind(NT, Rulford_Hall)

#Tyntesfield
Tyntesfield <- Tyntesfield %>% 
	html_element('table') %>% 
	html_table()
Tyntesfield <- cbind(Tyntesfield ,Site="NT: Tyntesfield","WWT Comparison Site"="Slimbridge")
Tyntesfield <- Tyntesfield[-c(5,6),]
NT <- rbind(NT, Tyntesfield)

#Gibside
Gibside <- Gibside %>% 
	html_element('table') %>% 
	html_table()
Gibside <- cbind(Gibside ,Site="NT: Gibside","WWT Comparison Site"="Washington")
NT <- rbind(NT, Gibside)

#Lighthouse
Lighthouse <- Lighthouse %>% 
	html_element('table') %>% 
	html_table()
Lighthouse <- cbind(Lighthouse ,Site="NT: Lighthouse","WWT Comparison Site"="Washington")
Lighthouse <- Lighthouse[-c(5,6),]
NT <- rbind(NT, Lighthouse)

#Washington Hall
Washington_Hall <- Washington_Hall %>% 
	html_element('table') %>% 
	html_table()
Washington_Hall <- cbind(Washington_Hall ,Site="NT: Washington Hall","WWT Comparison Site"="Washington")
Washington_Hall <- Washington_Hall[-c(5,6),]
NT <- rbind(NT, Washington_Hall)

#Wicken
Wicken <- Wicken %>% 
	html_element('table') %>% 
	html_table()
Wicken <- cbind(Wicken ,Site="NT: Wicken Fen", "WWT Comparison Site"="Welney")
Wicken <- Wicken[-c(5,6),]
NT <- rbind(NT, Wicken)

# Ensuring the NT table matches the WWT table: both column names and value names
colnames(NT) <- Columns
NT$Ticket <- tolower(NT$Ticket)
NT$Ticket <- gsub("^family$","Family (2 Adults, 2 Children)",as.character(NT$Ticket))
NT$Ticket <- gsub("\\<1 adult,2 children\\>","Family (1 Adult, 2 Children)",as.character(NT$Ticket))
NT$Ticket <- gsub("\\<1 adult, 2 children\\>","Family (1 Adult, 2 Children)",as.character(NT$Ticket))
NT$Ticket <- gsub("\\<family one adult\\>","Family (1 Adult, 2 Children)",as.character(NT$Ticket))
NT$Ticket <- gsub("\\<one adult family\\>","Family (1 Adult, 2 Children)",as.character(NT$Ticket))
NT$Ticket <- gsub("\\<family 1 adult\\>","Family (1 Adult, 2 Children)",as.character(NT$Ticket))
NT$Ticket <- gsub("\\<family (1 adult)\\>","Family (1 Adult, 2 Children)",as.character(NT$Ticket))
NT$Ticket <- gsub("\\<1 adult 3 children\\>","Family (1 Adult, 3 Children)",as.character(NT$Ticket))
NT$Ticket <- gsub("^adult$","Adult",as.character(NT$Ticket))
NT$Ticket <- gsub("^child$","Child",as.character(NT$Ticket))

# RSPB

#Pagham
# RSPB doesn't store it's prices within a HTML table, so I've pulled the exact text using XPath
Adult <- PaghamURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[2]/dd') %>% 
	html_text
Child <- PaghamURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[3]/dd') %>% 
	html_text

# Creating a dataframe from the HTML_text, trimming whitespace and removing characters
Pagham <- data.frame (Type = c("Adult", "Child"),
	Price = c(trimws(gsub("\r\n","",Adult)),trimws(gsub("\r\n","",Child))))

# Changing the dataframe to a table
Pagham <- setDT(Pagham)

# Specifying a specific number of letters per string in RSPB (eg. when free or when a number has decimals). Change if the output is weird
Pagham$Price <- substr(Pagham$Price,1,4)
Pagham <- cbind(Pagham,Site="RSPB: Pagham","WWT Comparison Site"="Arundel")

#Pulborough
Adult <- PulboroughURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[2]/dd') %>% 
	html_text
Child <- PulboroughURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[3]/dd/text()[1]') %>% 
	html_text
Pulborough <- data.frame (Type = c("Adult", "Child"),
	Price = c(trimws(gsub("\r\n","",Adult)),trimws(gsub("\r\n","",Child))))
Pulborough <- setDT(Pulborough)
Pulborough <- cbind(Pulborough,Site="RSPB: Pulborough","WWT Comparison Site"="Arundel")
RSPB <- rbind(Pagham, Pulborough)

#Mersehead
Adult <- MerseheadURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[2]/dd') %>% 
	html_text
Child <- MerseheadURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[3]/dd') %>% 
	html_text
Mersehead <- data.frame (Type = c("Adult", "Child"),
	Price = c(trimws(gsub("\r\n","",Adult)),trimws(gsub("\r\n","",Child))))
Mersehead <- setDT(Mersehead)
Mersehead$Price <- substr(Mersehead$Price,1,4)
Mersehead <- cbind(Mersehead,Site="RSPB: Mersehead","WWT Comparison Site"="Caerlaverock")
RSPB <- rbind(RSPB, Mersehead)

#Burton_Mere
Adult <- Burton_MereURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[2]/dd') %>% 
	html_text
Child <- Burton_MereURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[3]/dd') %>% 
	html_text
Burton_Mere <- data.frame (Type = c("Adult", "Child"),
	Price = c(trimws(gsub("\r\n","",Adult)),trimws(gsub("\r\n","",Child))))
Burton_Mere <- setDT(Burton_Mere)
Burton_Mere$Price <- substr(Burton_Mere$Price,1,2)
Burton_Mere <- cbind(Burton_Mere,Site="RSPB: Burton_Mere","WWT Comparison Site"="Martin Mere")
RSPB <- rbind(RSPB, Burton_Mere)

#Leighton
Adult <- LeightonURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[2]/dd') %>% 
	html_text
Child <- LeightonURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[3]/dd') %>% 
	html_text
Leighton <- data.frame (Type = c("Adult", "Child"),
	Price = c(trimws(gsub("\r\n","",Adult)),trimws(gsub("\r\n","",Child))))
Leighton <- setDT(Leighton)
Leighton$Price <- substr(Leighton$Price,1,5)
Leighton <- cbind(Leighton,Site="RSPB: Leighton","WWT Comparison Site"="Martin Mere")
RSPB <- rbind(RSPB, Leighton)

#Marshside
Adult <- MarshsideURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[2]/dd') %>% 
	html_text
Child <- MarshsideURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[3]/dd') %>% 
	html_text
Marshside <- data.frame (Type = c("Adult", "Child"),
	Price = c(trimws(gsub("\r\n","",Adult)),trimws(gsub("\r\n","",Child))))
Marshside <- setDT(Marshside)
Marshside$Price <- substr(Marshside$Price,1,4)
Marshside <- cbind(Marshside,Site="RSPB: Marshside","WWT Comparison Site"="Martin Mere")
RSPB <- rbind(RSPB, Marshside)

#Saltholme
Adult <- SaltholmeURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[2]/dd') %>% 
	html_text
Child <- SaltholmeURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[3]/dd') %>% 
	html_text
Saltholme<- data.frame (Type = c("Adult", "Child"),
	Price = c(trimws(gsub("\r\n","",Adult)),trimws(gsub("\r\n","",Child))))
Saltholme <- setDT(Saltholme)
Saltholme$Price <- substr(Saltholme$Price,1,2)
Saltholme <- cbind(Saltholme,Site="RSPB: Saltholme","WWT Comparison Site"="Washington")
RSPB <- rbind(RSPB, Saltholme)

#Drayton
Adult <- DraytonURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[2]/dd') %>% 
	html_text
Child <- DraytonURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[3]/dd') %>% 
	html_text
Drayton <- data.frame (Type = c("Adult", "Child"),
	Price = c(trimws(gsub("\r\n","",Adult)),trimws(gsub("\r\n","",Child))))
Drayton <- setDT(Drayton)
Drayton$Price <- substr(Drayton$Price,1,4)
Drayton <- cbind(Drayton,Site="RSPB: Fen Drayton", "WWT Comparison Site"="Welney")
RSPB <- rbind(RSPB, Drayton)

#Frampton
Adult <- FramptonURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[2]/dd') %>% 
	html_text
Child <- FramptonURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[3]/dd') %>% 
	html_text
Frampton <- data.frame (Type = c("Adult", "Child"),
	Price = c(trimws(gsub("\r\n","",Adult)),trimws(gsub("\r\n","",Child))))
Frampton <- setDT(Frampton)
Frampton$Price <- substr(Frampton$Price,1,5)
Frampton <- cbind(Frampton,Site="RSPB: Frampton Marsh", "WWT Comparison Site"="Welney")
RSPB <- rbind(RSPB, Frampton)

#Lakenheath
Adult <- LakenheathURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[2]/dd') %>% 
	html_text
Child <- LakenheathURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[3]/dd') %>% 
	html_text
Lakenheath <- data.frame (Type = c("Adult", "Child"),
	Price = c(trimws(gsub("\r\n","",Adult)),trimws(gsub("\r\n","",Child))))
Lakenheath <- setDT(Lakenheath)
Lakenheath$Price <- substr(Lakenheath$Price,1,2)
Lakenheath <- cbind(Lakenheath,Site="RSPB: Lakenheath Fen", "WWT Comparison Site"="Welney")
RSPB <- rbind(RSPB, Lakenheath)

#Ouse Fen
Adult <- OuseURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[2]/dd') %>% 
	html_text
Child <- OuseURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[3]/dd') %>% 
	html_text
Ouse <- data.frame (Type = c("Adult", "Child"),
	Price = c(trimws(gsub("\r\n","",Adult)),trimws(gsub("\r\n","",Child))))
Ouse <- setDT(Ouse)
Ouse$Price <- substr(Ouse$Price,1,4)
Ouse <- cbind(Ouse,Site="RSPB: Ouse Fen", "WWT Comparison Site"="Welney")
RSPB <- rbind(RSPB, Ouse)

#Ouse Washes
Adult <- OuseWURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[2]/dd') %>% 
	html_text
Child <- OuseWURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[3]/dd') %>% 
	html_text
OuseW <- data.frame (Type = c("Adult", "Child"),
	Price = c(trimws(gsub("\r\n","",Adult)),trimws(gsub("\r\n","",Child))))
OuseW <- setDT(OuseW)
OuseW$Price <- substr(OuseW$Price,1,4)
OuseW <- cbind(OuseW,Site="RSPB: Ouse Washes", "WWT Comparison Site"="Welney")
RSPB <- rbind(RSPB, OuseW)

#Snettisham
Adult <- SnettishamURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[2]/dd') %>% 
	html_text
Child <- SnettishamURL %>% 
	html_nodes(xpath='//*[@id="Key-information"]/div/div/div/div/div[2]/div/div[2]/div/dl[3]/dd') %>% 
	html_text
Snettisham <- data.frame (Type = c("Adult", "Child"),
	Price = c(trimws(gsub("\r\n","",Adult)),trimws(gsub("\r\n","",Child))))
Snettisham <- setDT(Snettisham)
Snettisham$Price <- substr(Snettisham$Price,1,4)
Snettisham <- cbind(Snettisham,Site="RSPB: Snettisham", "WWT Comparison Site"="Welney")
RSPB <- rbind(RSPB, Snettisham)

# RSPB doesn't have Gift Aid as such I've created a column with N/A
RSPB <- cbind(RSPB, With_Gift_Aid="N/A")

# Reordering columns to match WWT and NT
RSPB <- RSPB[,c(1,5,2,3,4)]

# Renaming columns and values to match WWT and NT
colnames(RSPB) <- Columns
RSPB$Ticket <- gsub("Family","Family (2 Adults, 2 Children)",as.character(RSPB$Ticket))

# Other Competitors

# Arundel Castle
Arundel_CastleURL <- Arundel_CastleURL %>% 
	html_element("table") %>% 
	html_table()

# Arundel Castle table is formatted differently, as such I've needed to extract the values and recreate a table that matches

# Defining ticket type labels
Ticket = c('Adult', 'Child', 'Family')

# Isolating Arundel Castle (Gardens & Bedroom) prices
Arundel_Castle_Full <- Arundel_CastleURL[1,]

# Transposing the table, this creates a matrix
Arundel_Castle_Full <- t(Arundel_Castle_Full)

# Converting the matrix to a table
Arundel_Castle_Full <- as.data.frame(Arundel_Castle_Full)
Arundel_Castle_Full <- setDT(Arundel_Castle_Full)

# Removing unneccesary rows
Arundel_Castle_Full <- Arundel_Castle_Full[-c(1)]

Arundel_Castle_Full <- cbind(Arundel_Castle_Full, Ticket = Ticket, 'With Gift Aid'="N/A", Site="Arundel Castle Full","WWT Comparison Site"="Arundel")

# Isolating Arundel Castle (Gardens Only) prices
Arundel_Castle_Garden <- Arundel_CastleURL[3,]
Arundel_Castle_Garden <- t(Arundel_Castle_Garden)
Arundel_Castle_Garden <- as.data.frame(Arundel_Castle_Garden)
Arundel_Castle_Garden <- setDT(Arundel_Castle_Garden)
Arundel_Castle_Garden <- Arundel_Castle_Garden[-c(1)]
Arundel_Castle_Garden <- cbind(Arundel_Castle_Garden, Ticket = Ticket, 'With Gift Aid'="N/A", Site="Arundel Castle Garden Only", "WWT Comparison Site"="Arundel")
Arundel_Castle <- rbind(Arundel_Castle_Full,Arundel_Castle_Garden)
Arundel_Castle <- Arundel_Castle[,c(2,3,1,4,5)]
colnames(Arundel_Castle) <- Columns

# British Wildlife Centre
British_Wildlife <- British_Wildlife %>% 
	html_element("table") %>% 
	html_table()

# Removing unnecessary columns and rows
British_Wildlife <- British_Wildlife[-c(2)]
British_Wildlife <- British_Wildlife[-c(5,6),]

# renaming rows to match
British_Wildlife <- cbind(British_Wildlife,'With Gift Aid'="N/A", Site="British Wildlife Centre","WWT Comparison Site"="Arundel")
British_Wildlife <- British_Wildlife[,c(1,3,2,4,5)]
colnames(British_Wildlife) <- Columns

# Weald And Downland Living Museum
Weald <- WealdURL %>%
	html_element("table") %>%
	html_table
Weald <- Weald[-c(2,4,7,9,10,11,12),]
Weald$X2 <- gsub("\\(","",as.character(Weald$X2))
Weald$X2 <- gsub("\\)","",as.character(Weald$X2))
Weald <- cbind(Weald, Site= "Weald And Downland Living Museum","WWT Comparison Site"="Arundel")
Weald <- Weald[c(3,1,2,4,5)]
colnames(Weald) <- Columns

# West Dean Gardens
DeanURL <- DeanURL %>% 
	html_element("table") %>% 
	html_table()

# Seperating the gift aid and non-gift aid price on delimiter /
Dean <- data.frame(do.call('rbind',strsplit(as.character(DeanURL$Prices), '/', fixed=TRUE)))

# Removing unneccesary rows
Dean <- Dean[-c(3),]
Ticket <- c("Adult")
Site <- c("West Dean Gardens Winter","West Dean Gardens Summer")
GA <- c(substr(Dean$X2,1,nchar(Dean$X2)-1))
Non_GA <- c(Dean$X1)
West_Dean <- data.frame('Ticket' = Ticket, 'With Gift Aid' = GA, 'Without Gift Aid' = Non_GA, 'Site' = Site, "WWT Comparison Site"="Arundel")
colnames(West_Dean) <- Columns

# Castle Kennedy
Kennedy <- Kennedy %>% 
	html_element("table") %>% 
	html_table()
# Removing unneccessary rows
Kennedy <- Kennedy[-c(1,5,7),]
Kennedy <- cbind(Kennedy, "With Gift Aid"= "N/A", Site="Castle Kennedy","WWT Comparison Site"="Caerlaverock")
Kennedy <- Kennedy[,c(1,3,2,4,5)]
colnames(Kennedy) <- Columns
Kennedy$Ticket <- gsub("^Concessions (60 yrs and older)$", "Concession (60+)",as.character(Kennedy$Ticket))
Kennedy$Ticket <- gsub("^Children (3 – 16 yrs old)$", "Child (3-16 years)",as.character(Kennedy$Ticket))

# Caerlaverock Castle
CA_Castle <- CA_Castle %>%
	html_element("table") %>%
	html_table()
CA_Castle <- CA_Castle[-c(1),]
CA_Castle <- CA_Castle[-c(2)]
CA_Castle <- cbind(CA_Castle, "With Gift Aid"="N/A", Site="Caerlaverock Castle", "WWT Comparison Site"="Caerlaverock")
CA_Castle <- CA_Castle[,c(1,3,2,4,5)]
colnames(CA_Castle) <- Columns

# Cream O Galloway
Cream <- Cream %>%
	html_nodes(xpath='/html/body/div/div[3]/div/section/div[2]/div/article/div/div[1]/p[5]/text()[2]') %>%
	html_text
Adult <- substr(gsub(" ","", Cream),18,19)
Family <- substr(gsub(" ","", Cream),32,34)
Ticket = c("Adult", "Family")
Non_GA <- c(Adult, Family)
CreamO <- data.frame('Ticket'=Ticket, 'With Gift Aid'="N/A", 'Without Gift Aid'=Non_GA, Site="Cream O'Galloway","WWT Comparison Site"="Caerlaverock")
colnames(CreamO) <- Columns

# Dalscone Farm
DalsconeFarm <- DalsconeFarm %>%
	html_element("table") %>%
	html_table
DalsconeFarm <- cbind(DalsconeFarm, "With Gift Aid"="N/A", Site="DalsconeFarm Farm","WWT Comparison Site"="Caerlaverock")
DalsconeFarm <- DalsconeFarm[,c(1,3,2,4,5)]
colnames(DalsconeFarm) <- Columns

# Belfast Zoo
Belfast_Zoo_Online <- Belfast_ZooURL %>%
	html_nodes(xpath='//*[@id="maincontent"]/div[3]/div/div/div/div[2]/div/div/table[1]') %>%
	html_table(fill=TRUE)
Belfast_Zoo_Online <- Belfast_Zoo_Online[[1]]
Belfast_Zoo_Online <- Belfast_Zoo_Online[-c(1,6),]
Belfast_Zoo_Online <- cbind(Belfast_Zoo_Online, Site="Belfast Zoo (Online)","WWT Comparison Site"="Castle Espie")
colnames(Belfast_Zoo_Online) <- Columns

Belfast_Zoo_Gate <- Belfast_ZooURL %>%
	html_nodes(xpath='//*[@id="maincontent"]/div[3]/div/div/div/div[2]/div/div/table[2]') %>%
	html_table(fill=TRUE)
Belfast_Zoo_Gate <- Belfast_Zoo_Gate[[1]]
Belfast_Zoo_Gate <- Belfast_Zoo_Gate[-c(1,6),]
Belfast_Zoo_Gate <- cbind(Belfast_Zoo_Gate, Site="Belfast Zoo (Gate)","WWT Comparison Site"="Castle Espie")
colnames(Belfast_Zoo_Gate) <- Columns
Belfast_Zoo <- rbind(Belfast_Zoo_Online, Belfast_Zoo_Gate)
# removing special characters
Belfast_Zoo$Ticket[1] <- str_sub(Belfast_Zoo$Ticket[1],1,23)
Belfast_Zoo$Ticket[2] <- str_sub(Belfast_Zoo$Ticket[2],1,21)
Belfast_Zoo$Ticket[5] <- str_sub(Belfast_Zoo$Ticket[5],1,23)
Belfast_Zoo$Ticket[6] <- str_sub(Belfast_Zoo$Ticket[6],1,21)

# Montalto Estate
Montalto <- Montalto %>%
	html_element("table") %>%
	html_table
Montalto <- Montalto[-c(3)]
Montalto <- Montalto[-c(3,7),]
Montalto <- cbind(Montalto, "With Gift Aid"="N/A", Site="Montalto Estate","WWT Comparison Site"="Castle Espie")
Montalto <- Montalto[,c(1,3,2,4,5)]
colnames(Montalto) <- Columns

# Titanic Belfast
Titanic <- Titanic %>%
	html_element("table") %>%
	html_table
Titanic <- Titanic[-c(3,5,6),]
Titanic <- cbind(Titanic, "With Gift Aid"="N/A", Site="Titanic Belfast","WWT Comparison Site"="Castle Espie")
Titanic <- Titanic[,c(1,3,2,4,5)]
colnames(Titanic) <- Columns

#removing special characters
Titanic$Ticket[2] <- str_sub(Titanic$Ticket[2],1,12)
Titanic$Ticket[4] <- str_sub(Titanic$Ticket[4],1,13)

#Gardens of Wales
WelshGardens <- WelshGardens %>%
	html_element("table") %>%
	html_table
WelshGardens <- WelshGardens[-c(3)]
WelshGardens <- WelshGardens[-c(1,2,4,5,8,9,10),]
WelshGardens <- cbind(WelshGardens,"With Gift Aid"="N/A", Site="Garden of Wales","WWT Comparison Site"="Llanelli")
WelshGardens <- WelshGardens[,c(1,3,2,4,5)]
colnames(WelshGardens) <- Columns

#Pembry Country Park (Ski)
Pembry_Ski <- Pembry_Ski %>%
	html_element("table") %>%
	html_table
Pembry_Ski <- Pembry_Ski[1,]
Pembry_Ski <- t(Pembry_Ski)
Pembry_Ski <- Pembry_Ski[-c(1),]
Ticket <- c("Adult", "Child", "Concession")
Pembry_Ski <- cbind(Pembry_Ski, Ticket, "With Gift Aid"="N/A",Site="Pembry Country Park (Ski)", "WWT Comparison Site"="Llanelli")
Pembry_Ski <- Pembry_Ski[,c(2,3,1,4,5)]
colnames(Pembry_Ski) <- Columns

#Battersea Park Zoo
Battersea <- Battersea %>%
	html_element("table") %>%
	html_table
Battersea <- Battersea[-c(1,4,7,8),]
Battersea <- cbind(Battersea, "With Gift Aid" ="N/A",Site="Battersea Park Zoo","WWT Comparison Site"="London")
Battersea <- Battersea[,c(1,3,2,4,5)]
colnames(Battersea) <- Columns

#Bocketts Farm 
Bockett <- Bockett %>%
	html_element("table") %>%
	html_table
colnames(Bockett) <- c("A","B")
Bockett <- Bockett[-c(5),]
Bockett$A <- gsub("\n","",as.character(Bockett$A))
Bockett$A <- gsub("\\s+"," ",as.character(Bockett$A))
Bockett_St <- Bockett[-3]
Bockett_St <- cbind(Bockett_St, "With Gift Aid"="N/A", Site="Bockett Farm (Standard)","WWT Comparison Site"="London")
Bockett_OP <- Bockett[-2]
colnames(Bockett_OP) <- c("A", "B")
Bockett_OP <- cbind(Bockett_OP, "With Gift Aid"="N/A", Site="Bockett Farm (Off Peak)","WWT Comparison Site"="London")
Bockett_Farm <- rbind(Bockett_St, Bockett_OP)
Bockett_Farm <- Bockett_Farm[,c(1,3,2,4,5)]
colnames(Bockett_Farm) <- Columns

#Hampton Court Palace
Hampton <- Hampton %>%
	html_element("table") %>%
	html_table
Hampton$Type <- gsub("\r\n","",as.character(Hampton$Type))
Hampton$Type <- gsub("\\s+"," ",as.character(Hampton$Type))
Hampton <- Hampton[-c(1),]
Hampton$Type[2] <- substr(Hampton$Type[2],1,16)
Hampton$Type[3] <- substr(Hampton$Type[3],1,10)
Hampton <- cbind(Hampton, Site="Hampton Court Palace","WWT Comparison Site"="London")
Hampton <- Hampton[,c(1,3,2,4,5)]
colnames(Hampton) <- Columns
Hampton$Ticket[4] <- "Family (1 Adult, 3 Child)"
Hampton$Ticket[5] <- "Family (2 Adult, 3 Child)"

#Syon House, Gardens and Conservatory
Syon <- Syon %>%
	html_element("table") %>%
	html_table
Syon <- cbind(Syon, "With Gift Aid"="N/A", Site="Syon House","WWT Comparison Site"="London")
Syon <- Syon[,c(1,3,2,4,5)]
colnames(Syon) <- Columns
Syon$Ticket[2] <- "Concession"

#Farmer Teds
Farmer_TedsSummer <- Farmer_TedsURL %>%
	html_nodes(xpath='//*[@id="index"]/div[4]/div/div[5]/div/div/div/div[2]/table') %>%
	html_table(fill=TRUE)
Farmer_TedsSummer <- Farmer_TedsSummer[[1]]
colnames(Farmer_TedsSummer) <- c("A","B")
Farmer_TedsSummer <- Farmer_TedsSummer[-c(5,6),]
Farmer_TedsSummer_Online <- Farmer_TedsSummer[-3]
Farmer_TedsSummer_Online <- cbind(Farmer_TedsSummer_Online,Site="Farmer Teds (Advance, Peak)","WWT Comparison Site"="Martin Mere")
Farmer_TedsSummer_Gate <- Farmer_TedsSummer[-2]
colnames(Farmer_TedsSummer_Gate) <- c("A","B")
Farmer_TedsSummer_Gate <- cbind(Farmer_TedsSummer_Gate,Site="Farmer Teds (Gate, Peak)","WWT Comparison Site"="Martin Mere")
Farmer_Teds <- rbind(Farmer_TedsSummer_Gate,Farmer_TedsSummer_Online)
Farmer_Teds <- cbind(Farmer_Teds, "With Gift Aid" = "N/A")
Farmer_Teds <- Farmer_Teds[,c(1,5,2,3,4)]
colnames(Farmer_Teds) <- Columns

#Knowsley Safari 
Knowsley <- Knowsley %>%
	html_element("table") %>%
	html_table
Knowsley$Price <- trimws(gsub("per ticket","",as.character(Knowsley$Price)))
Knowsley <- Knowsley[-c(3),]
Knowsley <- cbind(Knowsley, "With Gift Aid"="N/A", Site="Knowsley Safari", "WWT Comparison Site"="Martin Mere")
Knowsley <- Knowsley[,c(1,3,2,4,5)]
colnames(Knowsley) <- Columns

#Birdland
Birdland <- Birdland %>%
	html_element("table") %>%
	html_table
Birdland <- Birdland[-3]
Birdland <- Birdland[-c(1),]
Birdland <- cbind(Birdland, "A"="N/A","B"="Birdland","WWT Comparison Site"="Slimbridge")
Birdland <- Birdland[,c(1,3,2,4,5)]
colnames(Birdland) <- Columns
Birdland$Ticket[2] <- "Child (3-15 years)"
Birdland$Ticket[3] <- "Concession (60+)"

#Bristol Aquarium
Bristol_Aquarium <- Bristol_Aquarium %>%
	html_element("table") %>%
	html_table
Bristol_Aquarium <- Bristol_Aquarium[-c(3),]
Bristol_Aquarium <- cbind(Bristol_Aquarium, "A"="N/A", "B"="Bristol Aquarium","WWT Comparison Site"="Slimbridge")
Bristol_Aquarium <- Bristol_Aquarium[,c(1,3,2,4,5)]
colnames(Bristol_Aquarium) <- Columns
Bristol_Aquarium$Ticket[3] <- "Concession (65+, Student, Carer))"

#Cotswold
CotswoldURL <- CotswoldURL %>%
	html_element("table") %>%
	html_table
CotswoldURL <- CotswoldURL[-c(1,3),]
Cotswold_Gate <- CotswoldURL[-3]
colnames(Cotswold_Gate) <- c("A","B")
Cotswold_Gate <- cbind(Cotswold_Gate, Site="Cotswold Wildlife Park (Standard)","WWT Comparison Site"="Slimbridge")
Cotswold_Online <- CotswoldURL[-2]
colnames(Cotswold_Online) <- c("A","B")
Cotswold_Online <- cbind(Cotswold_Online, Site="Cotswold Wildlife Park (Online)","WWT Comparison Site"="Slimbridge")
Cotswold <- rbind(Cotswold_Gate,Cotswold_Online)
Cotswold <- cbind( Cotswold, "With Gift Aid"="N/A")
Cotswold <- Cotswold[,c(1,5,2,3,4)]
colnames(Cotswold) <- Columns
Cotswold$Ticket[3] <- "Concession (65+)"
Cotswold$Ticket[6] <- "Concession (65+)"

#Noah's Ark Zoo Farm
Noah <- Noah %>%
	html_element("table") %>%
	html_table
colnames(Noah) <- c("A","B")
Noah <- Noah[-c(4,5,6),]
Noah <- data.frame(do.call('rbind',strsplit(as.character(Noah$A), '\n', fixed=TRUE)), Noah[2])
Noah <- Noah[-2]
Noah <- cbind(Noah, "With Gift Aid"="N/A",Site="Noah's Ark Zoo Farm","WWT Comparison Site"="Slimbridge")
Noah <- Noah[,c(1,3,2,4,5)]
colnames(Noah) <- Columns

#Beamish
Beamish <- Beamish %>%
	html_element("table") %>%
	html_table
Beamish <- Beamish[-c(4,5,6,8),]
Beamish <- cbind(Beamish, "With Gift Aid"="N/A", Site="Beamish","WWT Comparison Site"="Washington")
Beamish <- Beamish[,c(1,3,2,4,5)]
colnames(Beamish) <- Columns
Beamish$Ticket[2] <- "Concession (60+, Student)"

#The Alnwick Garden
Alnwick <- Alnwick %>%
	html_element("table") %>%
	html_table
Alnwick <- Alnwick[-3]
Alnwick <- Alnwick[-c(3),]
Alnwick <- cbind(Alnwick, "With Gift Aid"="N/A", Site="The Alnwick Garden","WWT Comparison Site"="Washington")
Alnwick <- Alnwick[,c(1,3,2,4,5)]
colnames(Alnwick) <- Columns
Alnwick$Ticket[3] <- "Child (0-16)"

#Whitehouse
Whitehouse <- Whitehouse %>%
	html_element("table") %>%
	html_table
Whitehouse <- Whitehouse[-c(1,5,7,8,9),]
Whitehouse <- Whitehouse[-3]
Whitehouse$X1 <- gsub("\nBabies and 1 year old","",as.character(Whitehouse$X1))
Whitehouse$X2 <- gsub("\nFree","",as.character(Whitehouse$X2))
Whitehouse <- cbind(Whitehouse, "With Gift Aid"="N/A", Site="Whitehouse Farm Centre","WWT Comparison Site"="Washington")
Whitehouse <- Whitehouse[,c(1,3,2,4,5)]
colnames(Whitehouse) <- Columns
Whitehouse$Ticket[2] <- "Child (2-16)"

#Cley and Salthouse Marshside
CleyURL <- CleyURL %>% 
	html_nodes(xpath='//*[@id="p_lt_ctl05_PagePlaceholder_p_lt_ctl03_zoneReserveTop_zoneReserveTop_zoneRight_Charges_pnlAccordionItem"]/div[2]/div/dl/dd[2]') %>%
	html_text
Cley_GA <- substr(CleyURL,1,5)
Cley_Non_GA <- str_sub(CleyURL,-2,-1)
Ticket <- c("Adult")
Cley <- data.frame(Ticket = Ticket, "With Gift Aid" = Cley_GA, "Without Gift Aid" = Cley_Non_GA, Site = "Cley and Salthouse Marshside", "WWT Comparison Site"="Welney")
colnames(Cley) <- Columns

#High Lodge Thetford Forest
High_Lodge <- High_Lodge %>%
	html_nodes(xpath='//*[@id="block-visitorinformationblock"]/div/div/div/div[3]/section[3]/div[2]/section[1]/div[2]/table') %>%
	html_table(fill=TRUE)
High_Lodge <- High_Lodge[[1]]
colnames(High_Lodge) <- c("A","B")
High_Lodge <- High_Lodge[c(6),]
High_Lodge$A <- gsub("All day","Adult",as.character(High_Lodge$A))
High_Lodge <- cbind(High_Lodge,"With Gift Aid"="N/A",Site="High Lodge", "WWT Comparison Site"="Welney")
High_Lodge <- High_Lodge[,c(1,3,2,4,5)]
colnames(High_Lodge) <- Columns

#Pensthorpe
Adult <- PensthorpeURL %>%
	html_nodes("div.opening-times-prices__season-prices") %>%
	html_element('div') %>%
	html_text
Child <- PensthorpeURL %>%
	html_nodes(xpath='//*[@id="main"]/section[3]/div/div[3]/div/div/div[1]/div[2]/div[2]') %>%
	html_text
ChildOP <- PensthorpeURL %>%
	html_nodes(xpath='//*[@id="main"]/section[3]/div/div[3]/div/div/div[2]/div[2]/div[2]') %>%
	html_text
Concession <- PensthorpeURL %>%
	html_nodes(xpath='//*[@id="main"]/section[3]/div/div[3]/div/div/div[1]/div[2]/div[3]/p[2]') %>%
	html_text
ConcessionOP <- PensthorpeURL %>%
	html_nodes(xpath='//*[@id="main"]/section[3]/div/div[3]/div/div/div[2]/div[2]/div[3]/p[2]') %>%
	html_text
Adult <- c(trimws(gsub("\n","",Adult)))
Adult <- gsub("\\s+"," ",Adult)
Adult <- data.frame(do.call('rbind',strsplit(as.character(Adult), ' ', fixed=TRUE)))
Site <- c("Pensthorpe Peak", "Pensthorpe Off-Peak")
Adult <-cbind(Adult, "With Gift Aid"="N/A",Site=Site, "WWT Comparison Site"="Welney")
Adult <- Adult[,c(1,3,2,4,5)]
colnames(Adult) <- Columns
Child <- c(trimws(gsub("\n","",Child)))
Child <- gsub("\\s+"," ",Child)
Child <- data.frame(do.call('rbind',strsplit(as.character(Child), ' ', fixed=TRUE)))
Child$Ticket <- paste(Child$X1, Child$X2)
Child <- Child[,c(3,4)]
Child <- cbind(Child, "With Gift Aid"="N/A",Site="Pensthorpe Peak", "WWT Comparison Site"="Welney")
Child <- Child[,c(2,3,1,4,5)]
colnames(Child) <- Columns
ChildOP <- c(trimws(gsub("\n","",ChildOP)))
ChildOP <- gsub("\\s+"," ",ChildOP)
ChildOP <- data.frame(do.call('rbind',strsplit(as.character(ChildOP), ' ', fixed=TRUE)))
ChildOP$Ticket <- paste(ChildOP$X1, ChildOP$X2)
ChildOP <- ChildOP[,c(3,4)]
ChildOP <- cbind(ChildOP, "With Gift Aid"="N/A",Site="Pensthorpe Off-Peak","WWT Comparison Site"="Welney")
ChildOP <- ChildOP[,c(2,3,1,4,5)]
colnames(ChildOP) <- Columns
Child <- rbind(Child, ChildOP)
Concession <- c(trimws(gsub("\n","",Concession)))
Ticket <- c("Concession")
Concession <- data.frame(Ticket=Ticket,"Without Gift Aid"=Concession,"With Gift Aid"="N/A",Site="Pensthorpe Peak", "WWT Comparison Site"="Welney")
Concession <- Concession[,c(1,3,2,4,5)]
colnames(Concession) <- Columns
ConcessionOP <- c(trimws(gsub("\n","",ConcessionOP)))
ConcessionOP <- data.frame(Ticket=Ticket,"Without Gift Aid"=ConcessionOP,"With Gift Aid"="N/A",Site="Pensthorpe Off-Peak", "WWT Comparison Site"="Welney")
ConcessionOP <- ConcessionOP[,c(1,3,2,4,5)]
colnames(ConcessionOP) <- Columns
Concession <- rbind(Concession, ConcessionOP)
Penthorpe <- rbind(Adult, Child)
Penthorpe <- rbind(Penthorpe, Concession)

#Northumberland County Zoo
Adult <- NorthZooURL %>%
	html_nodes(xpath='//*[@id="content"]/div[1]/div[1]/ul/li[1]') %>%
	html_text
Child <- NorthZooURL %>%
	html_nodes(xpath='//*[@id="content"]/div[1]/div[1]/ul/li[2]') %>%
	html_text
Concession <- NorthZooURL %>%
	html_nodes(xpath='//*[@id="content"]/div[1]/div[1]/ul/li[4]') %>%
	html_text
Family1 <- NorthZooURL %>%
	html_nodes(xpath='//*[@id="content"]/div[1]/div[1]/ul/li[5]') %>%
	html_text
Family2 <- NorthZooURL %>%
	html_nodes(xpath='//*[@id="content"]/div[1]/div[1]/ul/li[7]') %>%
	html_text
Adult <- data.frame(do.call('rbind', strsplit(as.character(Adult), ':', fixed=TRUE)))
Child <- data.frame(do.call('rbind', strsplit(as.character(Child), ':', fixed=TRUE)))
Concession <- data.frame(do.call('rbind', strsplit(as.character(Concession), ':', fixed=TRUE)))
Family1 <- data.frame(do.call('rbind', strsplit(as.character(Family1), ':', fixed=TRUE)))
Family2 <- data.frame(do.call('rbind', strsplit(as.character(Family2), ':', fixed=TRUE)))
NorthZoo <- rbind(Adult, Child, Concession, Family1, Family2)
NorthZoo <- cbind(NorthZoo, "With Gift Aid"="N/A", Site="Northumberland County Zoo", "WWT Comparison Site"="Washington")
NorthZoo <- NorthZoo[,c(1,3,2,4,5)]
colnames(NorthZoo) <- Columns
NorthZoo$Ticket <- trimws(NorthZoo$Ticket)

#Northumberland College Zoo
NorthCol <- NorthColURL %>%
	html_nodes(xpath='//*[@id="accordion-5ef224f480c13"]') %>%
	html_text
NorthCol <- strsplit(NorthCol, '\n', fixed=TRUE)
NorthCol <- data.frame(NorthCol)
Ticket <- c(NorthCol[5,],NorthCol[17,],NorthCol[29,])
Price <- c(NorthCol[10,],NorthCol[22,],NorthCol[34,])
NorthCollege <- data.frame(Ticket, Price)
NorthCollege <- cbind(NorthCollege, "With Gift Aid"="N/A", Site="Northumberland College Zoo", "WWT Comparison Site"="Washington")
NorthCollege <- NorthCollege[,c(1,3,2,4,5)]
colnames(NorthCollege) <- Columns

#Science Life Centre

Life <- LifeURL %>%
	html_nodes(xpath='//*[@id="cphBody_ucPageLayoutTemplate_repLayout_ctl00_1_plItems_1_repLayout_1_ctl00_0_pnlStandard_0"]/div') %>%
	html_text
Life <- strsplit(Life, '\r\n', fixed=TRUE)
Life <- data.frame(Life)
Life <- setDT(Life)
Life <- Life[c(4,8,9,10),]
colnames(Life) <- "Ticket"
Life <- separate(Life, col=Ticket, into=c("Ticket", "Without Gift Aid"), sep="\\)")
Life <- cbind(Life,  "With Gift Aid"="N/A", Site="Life Science Centre", "WWT Comparison Site"="Washington")
Life <- Life[,c(1,3,2,4,5)]
colnames <- Columns

#Jarrow Hall
Adult <- JarrowURL %>%
	html_nodes(xpath='//*[@id="content"]/div/ul[1]/li[1]/text()') %>%
	html_text
Child <- JarrowURL %>%
	html_nodes(xpath='//*[@id="content"]/div/ul[1]/li[2]/text()') %>%
	html_text
Concession <- JarrowURL %>%
	html_nodes(xpath='//*[@id="content"]/div/ul[1]/li[4]/text()') %>%
	html_text
Adult <- data.frame(Adult)
Adult <- setDT(Adult)
colnames(Adult) <- "Ticket"
Adult <- separate(Adult, col=Ticket, into=c("Ticket", "Without Gift Aid"), sep="\\)")
Child <- data.frame(Child)
Child <- setDT(Child)
colnames(Child) <- "Ticket"
Child <- separate(Child, col=Ticket, into=c("Ticket", "Without Gift Aid"), sep="\\)")
Concession <- data.frame(do.call('rbind', strsplit(as.character(Concession), '***', fixed=TRUE)))
colnames(Concession) <- c("Ticket", "Without Gift Aid")
Jarrow <- rbind(Adult, Child, Concession)
Jarrow$Ticket <- trimws(gsub('Admission', '', as.character(Jarrow$Ticket)))
Jarrow <- cbind(Jarrow,  "With Gift Aid"="N/A", Site="Jarrow Hall", "WWT Comparison Site"="Washington")
Jarrow <- Jarrow[,c(1,3,2,4,5)]
colnames(Jarrow) <- Columns

#Holmside Park
Child1 <- HolmsideURL %>%
	html_nodes(xpath='//*[@id="Content"]/div/div/div/div[1]/div/div[2]/div/div/div[8]/div/div/div[1]') %>%
	html_text
Child1 <- data.frame(do.call('rbind', strsplit(as.character(Child1), '£', fixed=TRUE)))
Child2 <- HolmsideURL %>%
	html_nodes(xpath='//*[@id="Content"]/div/div/div/div[1]/div/div[2]/div/div/div[9]/div/div/div[1]') %>%
	html_text
Child2 <- data.frame(do.call('rbind', strsplit(as.character(Child2), '£', fixed=TRUE)))
Adult <- HolmsideURL %>%
	html_nodes(xpath='//*[@id="Content"]/div/div/div/div[1]/div/div[2]/div/div/div[10]/div/div/div[1]') %>%
	html_text
Adult <- data.frame(do.call('rbind', strsplit(as.character(Adult), '£', fixed=TRUE)))
Family <- HolmsideURL %>%
	html_nodes(xpath='//*[@id="Content"]/div/div/div/div[1]/div/div[2]/div/div/div[11]/div/div/div[1]') %>%
	html_text
Family <- data.frame(do.call('rbind', strsplit(as.character(Family), '£', fixed=TRUE)))
Concession <- HolmsideURL %>%
	html_nodes(xpath='//*[@id="Content"]/div/div/div/div[1]/div/div[2]/div/div/div[12]/div/div/div[1]') %>%
	html_text
Concession <- data.frame(do.call('rbind', strsplit(as.character(Concession), '£', fixed=TRUE)))
Holmside <- rbind(Child1, Child2, Adult, Family, Concession)
Holmside <- cbind(Holmside, "With Gift Aid"="N/A", Site="Holmside Park", "WWT Comparison Site"="Washington")
Holmside <- Holmside[,c(1,3,2,4,5)]
colnames(Holmside) <- Columns
Holmside$Ticket[1] <- "Child (1-3 Years)"
Holmside$Ticket[2] <- "Child (4 Years+)"
Holmside$Ticket[4] <- "Family (2 Adult, 2 Children / 1 Adult, 3 Children)"
Holmside$Ticket[5] <- "Concession (65 +)"
Holmside[4,3] <- substr(Holmside[4,3],1,5)
Holmside[,3] <- gsub('\\*', '', as.character(Holmside[,3]))
Holmside[,3] <- gsub('From ', '', as.character(Holmside[,3]))
Holmside[c(1,2,3,4),3] <- paste0('£',Holmside[c(1,2,3,4),3])

#Hall Hill Farm
Hallfarm <- HallfarmURL %>%
	html_nodes(xpath='//*[@id="main"]/div/div[2]/div[2]/div[1]') %>%
	html_text
Hallfarm <- data.frame(do.call('rbind',strsplit(as.character(Hallfarm), '\t', fixed=TRUE)))
Hallfarm <- data.frame(do.call('rbind',strsplit(as.character(Hallfarm), '\r\n', fixed=TRUE)))
Hallfarm <- Hallfarm[c(5,7,11,13,15),c(2,3)]
Hallfarm <- cbind(Hallfarm, A="N/A", B="Hall Hill Farm", C="Washington")
Hallfarm <- Hallfarm[,c(1,3,2,4,5)]
colnames(Hallfarm) <- Columns
Hallfarm[3,1] <- 'Family (2 Adult, 2 Child)'
Hallfarm[4,1] <- 'Family (2 Adult, 3 Child)'
Hallfarm[5,1] <- 'Concession (60+)'

# Animal Fun Farm
AnimalFun <- AnimalFunURL %>%
	html_nodes(xpath='//*[@id="tablepress-1"]/tbody') %>%
	html_table(fill=TRUE)
AnimalFun <- AnimalFun[[1]]
AnimalFun <- AnimalFun[c(1,2),]
AnimalFun2 <- AnimalFun
AnimalFun$X2 <- substr(AnimalFun$X2,1,5)
AnimalFun2$X2 <- substr(AnimalFun2$X2,20,25)
AnimalFun <- cbind(AnimalFun, A='N/A', B='Animal Fun Farm (Online)',C='Washington')
AnimalFun2 <- cbind(AnimalFun2, A='N/A', B='Animal Fun Farm (Gate)',C='Washington')
AnimalFunFarm <- rbind(AnimalFun, AnimalFun2)
AnimalFunFarm <- AnimalFunFarm[,c(1,3,2,4,5)]
colnames(AnimalFunFarm) <- Columns

# Adventure Valley
Ticket <- c('Adult','Child', 'Concession')
AdultGate <- AdventureURL %>%
	html_nodes(xpath='//*[@id="choose-tickets"]/li[1]/span[1]/span[1]/span[1]') %>%
	html_text
AdultOnlineOP <- AdventureURL %>%
	html_nodes(xpath='//*[@id="choose-tickets"]/li[1]/span[1]/span[1]/a/span/text()') %>%
	html_text
AdultOnlineOP <- trimws(AdultOnlineOP)
AdultOnlineOP <- substr(AdultOnlineOP,6,11)
AdultOnlineP <- AdventureURL %>%
	html_nodes(xpath='//*[@id="choose-tickets"]/li[1]/span[1]/span[1]/a/span/text()') %>%
	html_text
AdultOnlineP <- trimws(AdultOnlineP)
AdultOnlineP <- substr(AdultOnlineP,15,22)
ChildGate <- AdventureURL %>%
	html_nodes(xpath='//*[@id="choose-tickets"]/li[2]/span[1]/span[1]/span[1]') %>%
	html_text
ChildOnlineOP <- AdventureURL %>%
	html_nodes(xpath='//*[@id="choose-tickets"]/li[2]/span[1]/span[1]/a/span/text()') %>%
	html_text
ChildOnlineOP <- trimws(ChildOnlineOP)
ChildOnlineOP <- substr(ChildOnlineOP,6,11)
ChildOnlineP <- AdventureURL %>%
	html_nodes(xpath='//*[@id="choose-tickets"]/li[2]/span[1]/span[1]/a/span/text()') %>%
	html_text
ChildOnlineP <- trimws(ChildOnlineP)
ChildOnlineP <- substr(ChildOnlineP,15,22)
ConcessionGate <- AdventureURL %>%
	html_nodes(xpath='//*[@id="choose-tickets"]/li[3]/span[1]/span[1]/span[1]') %>%
	html_text
ConcessionOnlineOP <- AdventureURL %>%
	html_nodes(xpath='//*[@id="choose-tickets"]/li[3]/span[1]/span[1]/a/span/text()') %>%
	html_text
ConcessionOnlineOP <- trimws(ConcessionOnlineOP)
ConcessionOnlineOP <- substr(ConcessionOnlineOP,6,11)
ConcessionOnlineP <- AdventureURL %>%
	html_nodes(xpath='//*[@id="choose-tickets"]/li[3]/span[1]/span[1]/a/span/text()') %>%
	html_text
ConcessionOnlineP <- trimws(ConcessionOnlineP)
ConcessionOnlineP <- substr(ConcessionOnlineP,15,22)
Gate <- data.frame(c(AdultGate, ChildGate, ConcessionGate), 'Adventure Valley (Gate)')
colnames(Gate) <- c('A','B')
OP <- data.frame(c(AdultOnlineOP, ChildOnlineOP, ConcessionOnlineOP),'Adventure Valley (Online, Off-Peak)')
colnames(OP) <- c('A','B')
P <- data.frame(c(AdultOnlineP, ChildOnlineP, ConcessionOnlineP), 'Adventure Valley (Online, Peak)')
colnames(P) <- c('A','B')
AdventureValley <- rbind(Gate, OP)
AdventureValley <- rbind(AdventureValley, P)
AdventureValley <- cbind(AdventureValley, A='N/A',C='Washington')
AdventureValley <- cbind(Ticket, AdventureValley)
AdventureValley <- AdventureValley[,c(1,4,2,3,5)]
colnames(AdventureValley) <- Columns

#Westonbirt
Westonbirt <- WestonbirtURL %>%
	html_nodes(xpath='//*[@id="block-visitorinformationblock"]/div/div/div/div[3]/section[3]/div[2]/div/div/table') %>%
	html_table(fill=TRUE)
Westonbirt <- Westonbirt[[1]]
WestonbirtMar <- Westonbirt[,c(1,2)]
WestonbirtMar <- cbind(WestonbirtMar, B='Westonbirt Arboretum (Mar - Sep & 14 Nov - 30 Nov)')
colnames(WestonbirtMar) <- c('A','B')
WestonbirtNov <- Westonbirt[,c(1,3)]
WestonbirtNov <- cbind(WestonbirtNov, B='Westonbirt Arboretum (Oct - 13 Nov)')
colnames(WestonbirtNov) <- c('A','B')
WestonbirtDec <- Westonbirt[,c(1,4)]
WestonbirtDec <- cbind(WestonbirtDec, B='Westonbirt Arboretum (Dec - Feb)')
colnames(WestonbirtDec) <- c('A','B')
WestonbirtA <- rbind(WestonbirtMar, WestonbirtNov)
WestonbirtA <- rbind(WestonbirtA, WestonbirtDec)
WestonbirtA <- WestonbirtA[-c(1,5,9),]
WestonbirtA[c(2,5,8),1] <- 'Concession'
WestonbirtA[c(3,6,9),1] <- 'Child'
WestonbirtA <- cbind(WestonbirtA, C='N/A', D='Slimbridge')
WestonbirtA <- WestonbirtA[,c(1,4,2,3,5)]
colnames(WestonbirtA) <- Columns

# Sudeley Castle 
Adult <- SudeleyURL %>%
	html_element('div.price-item') %>%
	html_text
Family <- SudeleyURL %>%
	html_nodes(xpath='//*[@id="global-wrapper"]/main/div[1]/div/div[6]/div') %>%
	html_text
Child <- SudeleyURL %>%
	html_nodes(xpath='//*[@id="global-wrapper"]/main/div[1]/div/div[4]/div') %>%
	html_text
Adult <- data.frame(do.call('rbind',strsplit(as.character(Adult), '\n\n', fixed=TRUE)))
Family <- data.frame(do.call('rbind',strsplit(as.character(Family), '\n\n', fixed=TRUE)))
Child <- data.frame(do.call('rbind',strsplit(as.character(Child), '\n\n', fixed=TRUE)))
Adult <- Adult[,c(2,3)]
Family <- Family[,c(2,3)]
Child <- Child[,c(2,3)]
Sudeley <- rbind(Adult, Family)
Sudeley <- rbind(Sudeley, Child)
Sudeley[c(1,2,3),2] <- trimws(gsub('\n','',as.character(Sudeley[c(1,2,3),2])))
Sudeley <- cbind(Sudeley, A='N/A', B='Sudeley Castle', C='Slimbridge')
Sudeley <- Sudeley[,c(1,3,2,4,5)]
colnames(Sudeley) <- Columns

# Cattle Country
Ticket <- c('Adult','Child','Concession')
ChildrenGate <- CattleURL %>%
	html_nodes(xpath='//*[@id="block-yui_3_17_2_1_1662546061719_7340"]/div/p[2]/span') %>%
	html_text
ChildrenO <- CattleURL %>%
	html_nodes(xpath='//*[@id="block-yui_3_17_2_1_1662546061719_7340"]/div/p[2]/text()[2]') %>%
	html_text
AdultGate <- CattleURL %>%
	html_nodes(xpath='//*[@id="block-yui_3_17_2_1_1662546061719_7340"]/div/p[4]/span') %>%
	html_text
AdultO <- CattleURL %>%
	html_nodes(xpath='//*[@id="block-yui_3_17_2_1_1662546061719_7340"]/div/p[4]/text()[2]') %>%
	html_text
ConcessionGate <- CattleURL %>%
	html_nodes(xpath='//*[@id="block-yui_3_17_2_1_1662546061719_7340"]/div/p[5]/span') %>%
	html_text
ConcessionO <- CattleURL %>%
	html_nodes(xpath='//*[@id="block-yui_3_17_2_1_1662546061719_7340"]/div/p[5]/text()[2]') %>%
	html_text
Gate <- data.frame(Ticket, c(AdultGate, ChildrenGate, ConcessionGate))
colnames(Gate) = c(1,2)
Gate <- cbind(Gate, A='N/A', B='Cattle Country (Gate)', C='Slimbridge')
Online <- data.frame(Ticket, c(AdultO, ChildrenO, ConcessionO))
colnames(Online) = c(1,2)
Online <- cbind(Online, A='N/A', B='Cattle Country (Online)', C='Slimbridge')
Cattle <- rbind(Gate, Online)
Cattle <- Cattle[,c(1,3,2,4,5)]
colnames(Cattle) <- Columns

#Berkeley Castle
Adult <- Berkeley %>%
	html_nodes(xpath='//*[@id="block-6c34b7c3c2192c120487"]/div/p[2]') %>%
	html_text
Child <- Berkeley %>%
	html_nodes(xpath='//*[@id="block-6c34b7c3c2192c120487"]/div/p[3]') %>%
	html_text
Family <- Berkeley %>%
	html_nodes(xpath='//*[@id="block-6c34b7c3c2192c120487"]/div/p[5]') %>%
	html_text
Concession <- Berkeley %>%
	html_nodes(xpath='//*[@id="block-6c34b7c3c2192c120487"]/div/p[4]') %>%
	html_text
Adult <- data.frame(do.call('rbind',strsplit(as.character(Adult), ':', fixed=TRUE)))
Child <- data.frame(do.call('rbind',strsplit(as.character(Child), ':', fixed=TRUE)))
Family <- data.frame(do.call('rbind',strsplit(as.character(Family), ':', fixed=TRUE)))
Concession <- data.frame(do.call('rbind',strsplit(as.character(Concession), ':', fixed=TRUE)))
BerkeleyCastle <- rbind(Adult, Child)
BerkeleyCastle <- rbind(BerkeleyCastle, Family)
BerkeleyCastle <- rbind(BerkeleyCastle, Concession)
BerkeleyCastle <- cbind(BerkeleyCastle, A='N/A', B='Berkeley Castle', C='Slimbridge')
BerkeleyCastle <- BerkeleyCastle[,c(1,3,2,4,5)]
colnames(BerkeleyCastle) <- Columns

# Southport Pleasureland
Southport <- SouthportURL %>%
	html_element('table') %>%
	html_table
Southport <- Southport[c(1,3,4,6),]
Southport[1] <- c('Adult', 'Child (<90cm)', 'Concession (Disabled)', 'Family (4 Riders)')
SouthportGate <- Southport[,c(1,3)]
colnames(SouthportGate) <- c(1,2)
SouthportGate <- cbind(SouthportGate, A='N/A',B='Southport Pleasureland (On the day)',C='Martin Mere')
SouthportOnline <- Southport[,c(1,2)]
colnames(SouthportOnline) <- c(1,2)
SouthportOnline <- cbind(SouthportOnline, A='N/A',B='Southport Pleasureland (Online (Sep))',C='Martin Mere')
Southport <- rbind(SouthportGate, SouthportOnline)
Southport <- Southport[,c(1,3,2,4,5)]
colnames(Southport) <- Columns

# Blue Planet Aquarium
BluePlanet <- BluePlanetURL %>%
	html_element('table') %>%
	html_table
BluePlanet <- BluePlanet[c(2,3,4,6,7,8),]
BluePlanet <- cbind(BluePlanet, A='N/A', B='Blue Planet Aquarium', C='Martin Mere')
BluePlanet <- BluePlanet[,c(1,3,2,4,5)]
colnames(BluePlanet) <- Columns
BluePlanet[3,1] <- 'Concession (65+ or Student)'

#Thorpe Park
ThorpeGate <- ThorpeURL %>%
	html_nodes(xpath='//*[@id="content"]/section[2]/div/div/div[1]/a/header/div[2]/div[2]/p[2]') %>%
	html_text
ThorpeOnline <- ThorpeURL %>%
	html_nodes(xpath='//*[@id="content"]/section[2]/div/div/div[1]/a/header/div[2]/div[1]/p[2]') %>%
	html_text
ThorpeGate <- trimws(gsub('\r\n','',as.character(ThorpeGate)))
ThorpeOnline <- trimws(gsub('\r\n','',as.character(ThorpeOnline)))
Ticket <- 'Adult'
Site <- c('Thorpe Park (Gate)', 'Thorpe Park (Online)')
ThorpePark <- data.frame(Ticket, c(ThorpeGate,ThorpeOnline), Site)
ThorpePark <- cbind(ThorpePark, A='N/A', B='London')
ThorpePark <- ThorpePark[,c(1,4,2,3,5)]
colnames(ThorpePark) <- Columns

# Kew Garden
Adult <- KewURL %>%
	html_nodes(xpath='//*[@id="block-kew-gardens-mainpagecontent"]/section[3]/div/div/div') %>%
	html_text
Adult <- data.frame(do.call('rbind',strsplit(as.character(Adult), ':', fixed=TRUE)))
Adult <- Adult[,-c(1)]
Adult <- data.frame(do.call('rbind',strsplit(as.character(Adult), '\n\n', fixed=TRUE)))
Adult <- Adult[,c(1)]
Adult <- data.frame(do.call('rbind',strsplit(as.character(Adult), '\n', fixed=TRUE)))
Adult <- Adult[,-c(2,3)]
Adult <- trimws(Adult)
Adult <- data.frame('Adult', Adult)
Child <- KewURL %>%
	html_nodes(xpath='//*[@id="block-kew-gardens-mainpagecontent"]/section[4]/div/div/div') %>%
	html_text
Child <- data.frame(do.call('rbind',strsplit(as.character(Child), ':', fixed=TRUE)))
Child <- Child[,-c(1)]
Child <- data.frame(do.call('rbind',strsplit(as.character(Child), '\n', fixed=TRUE)))
Child <- Child[,c(1)]
Child <- trimws(Child)
Child <- data.frame('Child', Child)
Family <- KewURL %>%
	html_nodes(xpath='//*[@id="block-kew-gardens-mainpagecontent"]/section[6]/div') %>%
	html_text
Family <- data.frame(do.call('rbind',strsplit(as.character(Family), ':', fixed=TRUE)))
Family <- Family[,-c(1)]
Family <- data.frame(do.call('rbind',strsplit(as.character(Family), '\n\n', fixed=TRUE)))
Family <- Family[,c(1)]
Family <- data.frame(do.call('rbind',strsplit(as.character(Family), '\n', fixed=TRUE)))
Family <- Family[,-c(2,3)]
Family <- trimws(Family)
Family <- data.frame('Family', Family)
Family[c(1,2,3,4),1] <- 'Family (1 Adult 2 Child)'
Family[c(5,6,7,8),1] <- 'Family (2 Adult 2 Child)'
Concession <- KewURL %>%
	html_nodes(xpath='//*[@id="block-kew-gardens-mainpagecontent"]/section[7]/div/div/div') %>%
	html_text
Concession
Concession <- data.frame(do.call('rbind',strsplit(as.character(Concession), ':', fixed=TRUE)))
Concession <- Concession[,-c(1)]
Concession <- data.frame(do.call('rbind',strsplit(as.character(Concession), '\n\n', fixed=TRUE)))
Concession <- Concession[,c(1)]
Concession <- data.frame(do.call('rbind',strsplit(as.character(Concession), '\n', fixed=TRUE)))
Concession <- Concession[,-c(2,3)]
Concession <- trimws(Concession)
Concession <- data.frame('Concession (65+ & Disabled)', Concession)
Site <- c('Kew Grdns (Peak, Online)','Kew Grdns (Peak, Gate)', 'Kew Grdns (Off-Peak, Online)', 'Kew Grdns (Off-Peak, Gate)')
AdultGA <- Adult[c(1,3,5,7),2]
Adult <- Adult[-c(1,3,5,7),]
Adult <- cbind(A='Adult',Adult, AdultGA, Site)
FamilyGA <- Family[c(1,3,5,7),2]
Family <- Family[-c(1,3,5,7),]
Family <- cbind(A='Family',Family, FamilyGA, Site)
ConcessionGA <- Concession[c(1,3,5,7),2]
Concession <- Concession[-c(1,3,5,7),]
Concession <- cbind(A='Concession',Concession, ConcessionGA, Site)
Site2 <- Site <- c('Kew Grdns (Peak)', 'Kew Grdns (Off-Peak)')
ChildGA <- Child[c(1,3),2]
Child <- Child[-c(1,3),]
Child <- cbind(A='Child',Child, ChildGA, Site2)
colnames(Adult) <- c(1,2,3,4)
colnames(Child) <- c(1,2,3,4)
colnames(Family) <- c(1,2,3,4)
colnames(Concession) <- c(1,2,3,4)
Kew <- rbind(Adult, Family)
Kew <- rbind(Kew, Concession)
Kew <- rbind(Kew, Child)
Kew <- cbind(Kew,B='London')
Kew <- Kew[,-c(1)]
Kew <- Kew[,c(1,3,2,4,5)]
colnames(Kew) <- Columns

# Chiswick House and Gardens
Chiswick <- ChiswickURL %>%
	html_nodes(xpath='//*[@id="row-unique-5"]/div/div/div/div/div/div/div/div/ul[1]') %>%
	html_text
Chiswick <- data.frame(do.call('rbind',strsplit(as.character(Chiswick),'–', fixed=TRUE)))
Chiswick <- Chiswick[,c(2,3,4)]
Chiswick[,c(1,2,3)] <- substr(Chiswick[,c(1,2,3)],1,7)
Chiswick[,4] <- '1/2'
Chiswick <- t(Chiswick)
Ticket <- c('Adult', 'Family (2 Adult, 3 Child)', 'Family (1 Adult, 3 Child)', 'Child')
ChiswickHouse <- data.frame(Ticket, Chiswick)
ChiswickHouse <- cbind(ChiswickHouse, A='N/A', B='Chiswick House and Gardens', C='London')
ChiswickHouse <- ChiswickHouse[,c(1,3,2,4,5)]
colnames(ChiswickHouse) <- Columns

#Pembry golf
Pembry_Golf <- Pembry_GolfURL %>%
	html_nodes(xpath='/html/body/main/div/div[3]/section/div/section/div[1]/section[1]/div[3]') %>%
	html_text
Pembry_Golf <- data.frame(do.call('rbind',strsplit(as.character(Pembry_Golf),'\n',fixed=TRUE)))
Pembry_Golf <- Pembry_Golf[,-c(1,6)]
Pembry_Golf <- trimws(Pembry_Golf)
Pembry_Golf <- data.frame(do.call('rbind',strsplit(as.character(Pembry_Golf),':',fixed=TRUE)))
Pembry_Golf <- Pembry_Golf[-c(1),]
Pembry_Golf[3,2] <- substr(Pembry_Golf[3,2],1,7)
Pembry_Golf <- cbind(Pembry_Golf, A='N/A', B='Pembry Country Park (Golf)', C='Llanelli')
Pembry_Golf <- Pembry_Golf[,c(1,3,2,4,5)]
colnames(Pembry_Golf) <- Columns

#Manor Wildlife Park
Adult <- ManorURL %>%
	html_nodes(xpath='//*[@id="block-yui_3_17_2_1_1593450430789_6762"]/div/p[2]/strong') %>%
	html_text
Adult <- trimws(Adult)
Adult <- data.frame(do.call('rbind', strsplit(as.character(Adult), '-', fixed=TRUE)))
Child <- ManorURL %>%
	html_nodes(xpath='//*[@id="block-yui_3_17_2_1_1593450430789_6762"]/div/p[4]/strong') %>%
	html_text
Child <- trimws(Child)
Child <- data.frame(do.call('rbind', strsplit(as.character(Child), '-', fixed=TRUE)))
ConcessionA <- ManorURL %>%
	html_nodes(xpath='//*[@id="block-yui_3_17_2_1_1593450430789_6762"]/div/p[6]/strong') %>%
	html_text
ConcessionA <- trimws(ConcessionA)
ConcessionA <- data.frame(do.call('rbind', strsplit(as.character(ConcessionA), '-', fixed=TRUE)))
ConcessionC <- ManorURL %>%
	html_nodes(xpath='//*[@id="block-yui_3_17_2_1_1593450430789_6762"]/div/p[8]/strong') %>%
	html_text
ConcessionC <- trimws(ConcessionC)
ConcessionC <- data.frame(do.call('rbind', strsplit(as.character(ConcessionC), '-', fixed=TRUE)))
ManorPark <- rbind(Adult, Child)
ManorPark <- rbind(ManorPark, ConcessionA)
ManorPark <- rbind(ManorPark, ConcessionC)
ManorPark <- cbind(ManorPark, A='N/A', B='Manor Wildlife Park', C='Llanelli')
ManorPark <- ManorPark[,c(1,3,2,4,5)]
colnames(ManorPark) <- Columns
ManorPark[3,1] <- 'Concession (Adult)'
ManorPark[4,1] <- 'Concession (Child)'

# Folly Farm
Folly <- FollyURL %>%
	html_element('table') %>%
	html_table
Folly <- Folly[c(1,2,3,5),c(1,3)]
Folly <- cbind(Folly, A='N/A', B='Folly Farm', C='Llanelli')
Folly <- Folly[,c(1,3,2,4,5)]
colnames(Folly) <- Columns

#W5
W5 <- W5URL %>%
	html_nodes(xpath='//*[@id="app"]/footer/div/div[1]/div[3]') %>%
	html_text
W5 <- strsplit(as.character(W5),'\n',fixed=TRUE)
W5 <- W5[[1]][4]
W5 <- data.frame(do.call('rbind',strsplit(as.character(W5),'From',fixed=TRUE)))
W5 <- W5[,-c(1)]
W5[,c(1,2,3)] <- str_sub(W5[,c(1,2,3)],1,6)
W5[,c(4)] <- str_sub(W5[,c(4)],1,7)
W5 <- t(W5)
Ticket <- c('Adult', 'Child', 'Concession', 'Family (1 Adult 3 Child)', 'Family (2 Adult 2 Child)')
W5 <- cbind(Ticket, W5, A='N/A', B='W5 Discovery Centre', C='Castle Espie')
W5 <- W5[,c(1,3,2,4,5)]
colnames(W5) <- Columns

#Tarzan Jungle 
Tarzan <- TarzanURL %>%
	html_element('table') %>%
	html_table
Tarzan <- Tarzan[c(1,2),1]
Tarzan <- separate(Tarzan, col=X1, into=c("A", "B"), sep="\n")
Tarzan <- Tarzan[,2]
Ticket <- c('Adult', 'Child')
Tarzan <- cbind(Ticket, Tarzan)
Tarzan <- cbind(Tarzan, A='N/A', Site='The Jungle Tree Top Adventure', C='Castle Espie')
Tarzan <- Tarzan[,c(1,3,2,4,5)]
colnames(Tarzan) <- Columns

#Ark Farm
Child <- ArkURL %>%
	html_nodes(xpath='//*[@id="post-5"]/div/div[4]/div/div/div[1]/div[1]') %>%
	html_text
Adult <- ArkURL %>%
	html_nodes(xpath='//*[@id="post-5"]/div/div[4]/div/div/div[2]/div[1]') %>%
	html_text
Concession <- ArkURL %>%
	html_nodes(xpath='//*[@id="post-5"]/div/div[5]/div/div/div[2]/div[1]') %>%
	html_text
Family <- ArkURL %>%
	html_nodes(xpath='//*[@id="post-5"]/div/div[6]/div/div/div[1]/div[1]') %>%
	html_text
Ticket <- c('Child', 'Adult', 'Concession (Students and Seniors)', 'Family (4 individuals)')
Ark <- data.frame(Ticket,c(Child,Adult,Concession,Family))
Ark <- cbind(Ark, A='N/A', B='The Ark Open Farm', C='Castle Espie')
Ark <- Ark[,c(1,3,2,4,5)]
colnames(Ark) <- Columns

#Stream Vale
Adult <- StreamURL %>%
	html_nodes(xpath='/html/body/div/div[2]/div/main/section[1]/div/div/div/div/div/div[9]/div[2]/div/div[1]/div/text()') %>%
	html_text
Child <- StreamURL %>%
	html_nodes(xpath='/html/body/div/div[2]/div/main/section[1]/div/div/div/div/div/div[7]/div[2]/div/div[1]/div/text()') %>%
	html_text
Family <- StreamURL %>%
	html_nodes(xpath='/html/body/div/div[2]/div/main/section[1]/div/div/div/div/div/div[5]/div[1]/div/div[1]/div/text()') %>%
	html_text
Ticket <- c('Adult', 'Child', 'Family (4 Individuals)')
Stream <- data.frame(Ticket, c(Adult, Child, Family))
Stream <- cbind(Stream, A='N/A', B='Stream Vale', C='Castle Espie')
Stream <- Stream[,c(1,3,2,4,5)]
colnames(Stream) <- Columns

#NTS 
Adult <- NTSURL %>%
	html_nodes(xpath='//*[@id="entry-prices"]/div[1]/div/dl[1]/div[1]/dd') %>%
	html_text
Adult <- gsub('\n','',as.character(Adult))
Adult <- gsub('\t','',as.character(Adult))
Family <- NTSURL %>%
	html_nodes(xpath='//*[@id="entry-prices"]/div[1]/div/dl[1]/div[2]/dd') %>%
	html_text
Family <- gsub('\n','',as.character(Family))
Family <- gsub('\t','',as.character(Family))
Concession <- NTSURL %>%
	html_nodes(xpath='//*[@id="entry-prices"]/div[1]/div/dl[1]/div[4]/dd') %>%
	html_text
Concession <- gsub('\n','',as.character(Concession))
Concession <- gsub('\t','',as.character(Concession))
Family1 <- NTSURL %>%
	html_nodes(xpath='//*[@id="entry-prices"]/div[1]/div/dl[1]/div[3]/dd') %>%
	html_text
Family1 <- gsub('\n','',as.character(Family1))
Family1 <- gsub('\t','',as.character(Family1))
Ticket <- c('Adult', 'Family (2 Adult)', 'Concession', 'Family (1 Adult)')
NTS <- data.frame(Ticket, c(Adult, Family, Concession, Family1))
NTS <- cbind(NTS, A='N/A', B='Threave Garden', C='Caerlaverock')
NTS <- NTS[,c(1,3,2,4,5)]
colnames(NTS) <- Columns

# Mabie Farm Park
Adult <- MabieURL %>%
	html_nodes(xpath='//*[@id="content"]/div[1]/div[3]/div/div/div[1]/p[3]') %>%
	html_text
Adult <- str_sub(Adult,-3,-1)
Family <- MabieURL %>%
	html_nodes(xpath='//*[@id="content"]/div[1]/div[3]/div/div/div[1]/p[5]') %>%
	html_text
Family <- str_sub(Family,-3,-1)
Child <- MabieURL %>%
	html_nodes(xpath='//*[@id="content"]/div[1]/div[3]/div/div/div[1]/p[4]') %>%
	html_text
Child <- str_sub(Child,-6,-2)
Ticket <- c('Adult', 'Family (4 Individuals)', 'Child')
MabieFarm <- data.frame(Ticket, c(Adult, Family, Child))
MabieFarm <- cbind(MabieFarm, A='N/A', B='Mabie Farm Park', C='Caerlaverock')
MabieFarm <- MabieFarm[,c(1,3,2,4,5)]
colnames(MabieFarm) <- Columns

#Port Logan Fish Pond
Adult <- PortURL %>%
	html_nodes(xpath='//*[@id="comp-l762dwz63"]/p/span') %>%
	html_text
Child <- PortURL %>%
	html_nodes(xpath='//*[@id="comp-l762dwz44"]/p/span') %>%
	html_text
Concession <- PortURL %>%
	html_nodes(xpath='//*[@id="comp-l762dwz52"]/p/span') %>%
	html_text
Family <- PortURL %>%
	html_nodes(xpath='//*[@id="comp-l762dwz71"]/p/span') %>%
	html_text
Ticket <- c('Adult', 'Child', 'Concession (65+)', 'Family (2 Adult, 4 Child)')
PortLogan <- data.frame(Ticket, c(Adult, Child, Concession, Family))
PortLogan <- cbind(PortLogan, A='N/A', B='Port Logan Fish Pond', C='Caerlaverock')
PortLogan <- PortLogan[,c(1,3,2,4,5)]
colnames(PortLogan) <- Columns

# Logan Botanical Gardens
GA <- LoganURL %>%
	html_nodes(xpath='//*[@id="mainContent"]/section[1]/ul/li[2]/p[2]/text()') %>%
	html_text
GA <- strsplit(as.character(GA),',',fixed=TRUE)
GA <-GA[[1]][c(1,2)]
GA <-data.frame(do.call('rbind',strsplit(as.character(GA),' ',fixed=TRUE)))
GA <- GA[,c(2,3)]
NONGA <- LoganURL %>%
	html_nodes(xpath='//*[@id="mainContent"]/section[1]/ul/li[2]/p[3]/text()') %>%
	html_text
NONGA <- strsplit(as.character(NONGA),',',fixed=TRUE)
NONGA <-NONGA[[1]][c(1,2)]
NONGA <-data.frame(do.call('rbind',strsplit(as.character(NONGA),' ',fixed=TRUE)))
NONGA <- NONGA[,3]
LoganBotanical <- cbind(GA, NONGA, A='Logan Botanical Garden', B='Caerlaverock')
colnames(LoganBotanical) <- Columns

# Drumlanrig
Drumlanrig <- DrumlanrigURL %>%
	html_nodes(xpath='//*[@id="a-1d6ea0de6444271ac9eebac6f6026070"]/div/div/div/div[1]/div/span/p[3]') %>%
	html_text
Drumlanrig <- strsplit(as.character(Drumlanrig),'\n',fixed=TRUE)
Drumlanrig <- Drumlanrig[[1]][c(1,2,3)]
Drumlanrig <- data.frame(do.call('rbind',strsplit(as.character(Drumlanrig),' ',fixed=TRUE)))
Drumlanrig <- cbind(Drumlanrig, A='N/A', B='Drumlanrig Castle', C='Caerlaverock')
Drumlanrig <- Drumlanrig[,c(2,3,1,4,5)]
colnames(Drumlanrig) <- Columns

# South Downs Discovery
South <- SouthURL %>%
	html_element(xpath='//*[@id="maincontent"]/div[2]/div/div[2]/div/article/p[4]') %>%
	html_text
South <- strsplit(as.character(South),'£',fixed=TRUE)
Family <- str_sub(South[[1]][2],1,5)
Adult <- str_sub(South[[1]][3],1,4)
Child <- str_sub(South[[1]][4],1,4)
Ticket <- c('Family (Five People)','Adult','Child')
SouthDowns <- data.frame(Ticket, c(Family, Adult, Child))
SouthDowns[c(1,2,3),2] <- paste0('£',SouthDowns[c(1,2,3),2])
SouthDowns <- cbind(SouthDowns,A='N/A',B='South Downs Discovery',C='Arundel')
SouthDowns <- SouthDowns[,c(1,3,2,4,5)]
colnames(SouthDowns) <- Columns

# Marwell Zoo
MarwellZoo <- MarwellURL %>%
	html_element('table') %>%
	html_table
MarwellZoo <- MarwellZoo[c(1,2,4),]
MarwellZoo$Ticket <- str_c(MarwellZoo$Tickets, ' (', MarwellZoo$Details)
MarwellZoo <- MarwellZoo[,c(3,4,5)]
MarwellZoo <- cbind(MarwellZoo,A='Marwell Zoo',B='Arundel')
MarwellZoo <- MarwellZoo[,c(3,1,2,4,5)]
colnames(MarwellZoo) <- Columns

#Combining all other competitors 
Other <- rbind(Arundel_Castle, British_Wildlife)
Other <- rbind(Other, Weald)
Other <- rbind(Other, West_Dean)
Other <- rbind(Other, Kennedy)
Other <- rbind(Other, CA_Castle)
Other <- rbind(Other, CreamO)
Other <- rbind(Other, DalsconeFarm)
Other <- rbind(Other, Belfast_Zoo)
Other <- rbind(Other, Montalto)
Other <- rbind(Other, Titanic)
Other <- rbind(Other, WelshGardens)
Other <- rbind(Other, Pembry_Ski)
Other <- rbind(Other, Battersea)
Other <- rbind(Other, Bockett_Farm)
Other <- rbind(Other, Hampton)
Other <- rbind(Other, Syon)
Other <- rbind(Other, Farmer_Teds)
Other <- rbind(Other, Knowsley)
Other <- rbind(Other, Birdland)
Other <- rbind(Other, Bristol_Aquarium)
Other <- rbind(Other, Cotswold)
Other <- rbind(Other, Noah)
Other <- rbind(Other, Beamish)
Other <- rbind(Other, Alnwick)
Other <- rbind(Other, Whitehouse)
Other <- rbind(Other, Cley)
Other <- rbind(Other, High_Lodge)
Other <- rbind(Other, Penthorpe)
Other <- rbind(Other, NorthZoo)
Other <- rbind(Other, NorthCollege)
Other <- rbind(Other, Jarrow)
Other <- rbind(Other, Holmside)
Other <- rbind(Other, Hallfarm)
Other <- rbind(Other, AnimalFunFarm)
Other <- rbind(Other, AdventureValley)
Other <- rbind(Other, WestonbirtA)
Other <- rbind(Other, Sudeley)
Other <- rbind(Other, Cattle)
Other <- rbind(Other, BerkeleyCastle)
Other <- rbind(Other, Southport)
Other <- rbind(Other, BluePlanet)
Other <- rbind(Other, ThorpePark)
Other <- rbind(Other, Kew)
Other <- rbind(Other, ChiswickHouse)
Other <- rbind(Other, Pembry_Golf)
Other <- rbind(Other, ManorPark)
Other <- rbind(Other, Folly)
Other <- rbind(Other, W5)
Other <- rbind(Other, Tarzan)
Other <- rbind(Other, Ark)
Other <- rbind(Other, Stream)
Other <- rbind(Other, NTS)
Other <- rbind(Other, MabieFarm)
Other <- rbind(Other, PortLogan)
Other <- rbind(Other, LoganBotanical)
Other <- rbind(Other, Drumlanrig)
Other <- rbind(Other, SouthDowns)
Other <- rbind(Other, MarwellZoo)

#Global cleaning of tables
Other$Ticket <- gsub("Entry","",as.character(Other$Ticket))
Other$Ticket <- gsub("entry","",as.character(Other$Ticket))
Other$Ticket <- gsub("Garden","",as.character(Other$Ticket))
Other$Ticket <- gsub("Mini","",as.character(Other$Ticket))
Other$Ticket <- gsub("Pass","",as.character(Other$Ticket))
Other$Ticket <- gsub("day","",as.character(Other$Ticket))
Other$Ticket <- gsub("ticket","",as.character(Other$Ticket))
Other$Ticket <- gsub("Ticket","",as.character(Other$Ticket))
Other$Ticket <- gsub("Concessions","Concession",as.character(Other$Ticket))
Other$Ticket <- gsub("Standard","Adult",as.character(Other$Ticket))
Other$Ticket <- gsub("Adults","Adult",as.character(Other$Ticket))
Other$Ticket <- gsub("standard","Adult",as.character(Other$Ticket))
Other$Ticket <- gsub("standards","Adult",as.character(Other$Ticket))
Other$Ticket <- gsub("Junior","Child",as.character(Other$Ticket))
Other$Ticket <- gsub("Juniors","Child",as.character(Other$Ticket))
Other$Ticket <- gsub("junior","Child",as.character(Other$Ticket))
Other$Ticket <- gsub("Children","Child",as.character(Other$Ticket))
Other$Ticket <- gsub("Toddler","Child",as.character(Other$Ticket))
Other$Ticket <- gsub("Disabled","Concession (Disabled)",as.character(Other$Ticket))
Other$Ticket <- gsub("Seniors","Concession",as.character(Other$Ticket))
Other$Ticket <- gsub("Senior","Concession",as.character(Other$Ticket))

# Combining tables to export
Comparison <- rbind(WWT, NT)
Comparison <- rbind(Comparison, RSPB)
Comparison <- rbind(Comparison, Other)

# Cleaning certain row values for export
Admission <- Comparison
rownames(Admission) <- 1:nrow(Admission)

#Uncheck below to see previous value names to check
#Admission

Admission$Ticket[110] <- "Child (5-17 years, Students)"
Admission$Ticket[125] <- "Child (1-2 years)"
Admission$Ticket[126] <- "Child (3-16 years)"
Admission$Ticket[143] <- "Child (5-15 years)"
Admission$Ticket[158] <- "Child (3-17 years)"
Admission$Ticket[159] <- "Child (2 years)"
Admission$Ticket[163] <- "Child (3-17 years)"
Admission$Ticket[164] <- "Child (2 years)"
Admission$Ticket[128] <- "Concession"
Admission$Ticket[130] <- "Concession (Students, 60+)"
Admission$Ticket[134] <- "Concession (Students, 60+)"
Admission$Ticket[139] <- "Concession (65+)"
Admission$Ticket[146] <- "Concession (60+)"
Admission$Ticket[157] <- "Concession (60+)"
Admission$Ticket[162] <- "Concession (60+)"
Admission$Ticket[158] <- "Child (3-17 years)"
Admission$Ticket[166] <- "Adult (18-64)"
Admission$Ticket[111] <- "Family (2 Adult, 2 Child)"
Admission$Ticket[146] <- "Family (2 Adult, 2 Child)"
Admission$Ticket[214] <- "Family (2 Adult, 2 Child)"
Admission$Ticket[112] <- "Grandparent Family (2 Adult, 2 Child)"

#Forming a details column & ordering
Admission <- separate(Admission, col=Ticket, into=c("Ticket", "Detail"), sep="\\(")
Admission <- Admission[,c(5,1,3,4,2,6)]
Admission$Detail <- gsub("\\)","",as.character(Admission$Detail))
colnames(Admission) <- c("Site", "Ticket", "With Gift Aid", "Without Gift Aid", "Ticket Detail", "WWT Comparison")
Admission$Ticket <- trimws(Admission$Ticket)
Admission[,3] <- trimws(Admission[,3])
Admission[,4] <- trimws(Admission[,4])

# Membership 
Columns <- c('Membership', 'Price', 'Site')
Labels <- c('Individual', 'Joint', 'Individual Concession', ' Joint Concession', 'Family (1 Adult)', 'Family (2 Adults)','Child')

#WWT
Adult <- WWTMembershipURL %>%
	html_nodes(xpath='//*[@id="main_left"]/div/div/div[2]/div/div[1]/div[1]/a/div[2]/div[2]/p/strong') %>%
	html_text
Joint <- WWTMembershipURL %>%
	html_nodes(xpath='//*[@id="main_left"]/div/div/div[2]/div/div[1]/div[2]/a/div[2]/div[2]/p/strong') %>%
	html_text
Family1 <- WWTMembershipURL %>%
	html_nodes(xpath='//*[@id="main_left"]/div/div/div[2]/div/div[1]/div[3]/a/div[2]/div[2]/p/strong') %>%
	html_text
Family2 <- WWTMembershipURL %>%
	html_nodes(xpath='//*[@id="main_left"]/div/div/div[2]/div/div[1]/div[4]/a/div[2]/div[2]/p/strong') %>%
	html_text
WWTMembership <- data.frame(Labels[c(1,2,5,6)], c(Adult,Joint, Family1, Family2),'WWT')
colnames(WWTMembership) <- Columns

#NT
Adult <- NTMembershipURL %>%
	html_nodes(xpath='//*[@id="membership-individual"]/div/div/div[1]/div[1]/div[2]/span/text()[2]') %>%
	html_text %>%
	str_sub(1,5)
Joint <- NTMembershipURL %>%
	html_nodes(xpath='//*[@id="membership-joint"]/div/div/div[1]/div/div[2]/span') %>%
	html_text %>%
	str_sub(16,21)
Family1 <- NTMembershipURL %>%
	html_nodes(xpath='//*[@id="membership-family"]/div/div/div[1]/div[2]/div[2]/span/text()[2]') %>%
	html_text %>%
	str_sub(1,5)
Family2 <- NTMembershipURL %>%
	html_nodes(xpath='//*[@id="membership-family"]/div/div/div[1]/div[1]/div[2]/span/text()[2]') %>%
	html_text %>%
	str_sub(1,6)
NTMembership <- data.frame(Labels[c(1,2,5,6)], c(Adult,Joint, Family1, Family2),'National Trust')
colnames(NTMembership) <- Columns

#RSPB
Adult <- RSPBMembershipURL %>%
	html_nodes(xpath='//*[@id="main-content"]/div/div[3]/div[2]/div/div[2]/div/div[1]/div/div[2]/p[3]') %>%
	html_text
Joint <- RSPBMembershipURL %>%
	html_nodes(xpath='//*[@id="main-content"]/div/div[3]/div[2]/div/div[2]/div/div[1]/div/div[2]/p[3]') %>%
	html_text
Family2 <- RSPBMembershipURL %>%
	html_nodes(xpath='//*[@id="main-content"]/div/div[3]/div[2]/div/div[2]/div/div[2]/div/div[2]/p[3]') %>%
	html_text
RSPBMembership <- data.frame(Labels[c(1,2,4)], c(Adult,Joint, Family2),'RSPB')
colnames(RSPBMembership) <- Columns
RSPBMembership$Price <- paste0('£',RSPBMembership$Price)

#Wildlife Trust BCN
Adult <- WildlifeTrustBCNURL %>%
	html_nodes(xpath='//*[@id="edit-2"]/div[1]/div/div[2]/div[1]/span') %>%
	html_text %>%
	str_sub(6,11)
Joint <- WildlifeTrustBCNURL %>%
	html_nodes(xpath='//*[@id="edit-3"]/div[1]/div/div[2]/div[1]/span') %>%
	html_text %>%
	str_sub(6,11)
Family2 <- WildlifeTrustBCNURL %>%
	html_nodes(xpath='//*[@id="edit-4"]/div[1]/div/div[2]/div[1]/span') %>%
	html_text %>%
	str_sub(6,11)
WildlifeTrustBCN <- data.frame(Labels[c(1,3,6)], c(Adult[1],Joint[1],Family2[1]),'Wildlife Trust BCN')
colnames(WildlifeTrustBCN) <- Columns

# Pensthorpe
Adult <- PensthorpeMembershipURL %>%
	html_nodes(xpath='//*[@id="main"]/section[4]/div/p[2]/strong') %>%
	html_text %>%
	str_sub(-4,-2)
Concession <- PensthorpeMembershipURL %>%
	html_nodes(xpath='//*[@id="main"]/section[4]/div/p[3]/strong') %>%
	html_text %>%
	str_sub(-4,-1)
Child <- PensthorpeMembershipURL %>%
	html_nodes(xpath='//*[@id="main"]/section[4]/div/p[4]/strong') %>%
	html_text %>%
	str_sub(-4,-1)
PensthorpeMembership <- data.frame(Labels[c(1,3,7)], c(Adult,Concession,Child),'Pensthorpe')
colnames(PensthorpeMembership) <- Columns

# White House Farm
Adult <- WhiteMembershipURL %>%
	html_nodes(xpath='//*[@id="top"]/div[2]/div[3]/div/div/div/div[1]/div/div/div/div/p[3]/span') %>%
	html_text %>%
	str_sub(-6,-1)
Child <- WhiteMembershipURL %>%
	html_nodes(xpath='//*[@id="top"]/div[2]/div[3]/div/div/div/div[1]/div/div/div/div/p[4]/span') %>%
	html_text %>%
	str_sub(-6,-1)
WhiteMembership <- data.frame(Labels[c(1,7)], c(Adult,Child),'White House Farm')
colnames(WhiteMembership) <- Columns

#Forming a membership table
Membership <- rbind(WWTMembership,NTMembership)
Membership <- rbind(Membership,RSPBMembership)
Membership <- rbind(Membership,WildlifeTrustBCN)
Membership <- rbind(Membership,PensthorpeMembership)
Membership <- rbind(Membership,WhiteMembership)

# to check output
Admission
Membership

# Exporting the data to an Excel file, change path and name document
Output <- list('Admission' = Admission, 'Membership' = Membership)
write.xlsx(Output,"C:\\Users\\George.Burns\\Downloads\\CompetitorAnalysis[ENTERDATE].xlsx")

# If you want to extract a specific dateframe do so below:

# write.xlsx([ENTER DATAFRAME],"C:\\Users\\George.Burns\\Downloads\\[ENTER TITLE].xlsx")