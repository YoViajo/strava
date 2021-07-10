## Ref: https://www.open-thoughts.com/2017/01/24/the-quantified-cyclist-analysing-strava-data-using-r/
## Análisis de datos Strava

library(httr)
library(httpuv)

# Autentificar con Strava
my_app <- oauth_app("strava",
                    key = "68265",
                    secret = "628142a895c19b394924f78aa8c6ba50f0a139f9"
)

my_endpoint <- oauth_endpoint(
  request = NULL,
  authorize = "https://www.strava.com/oauth/authorize",
  access = "https://www.strava.com/oauth/token"
)

sig <- oauth2.0_token(my_endpoint, my_app, scope = "view_private",  type = NULL, use_oob = FALSE, as_header = FALSE,   use_basic_auth = FALSE, cache = FALSE)

# Extraer datos de actividad Strava

library(jsonlite)
jsonData <- fromJSON("https://www.strava.com/api/v3/athlete/activities?access_token=760d7eae729654314beec76e78ba64a9cb4baf29&per_page=200", flatten = TRUE)

nrow(jsonData) ##returns the number of records retrieved
names(jsonData) ##returns the column names of list vector returned
head(jsonData, n=3) ## returns the first three full records


