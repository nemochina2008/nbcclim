# Copyright 2018 Province of British Columbia
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.


## converting Date column as date class
wxstn_df$Date <- as.Date(wxstn_df$Date)
wxstn_df$Date <- as.Date(wxstn_df$Date, "%Y-%m-%d")

## adding years, months, and dates columns for indexing later
wxstn_df$years <- substr(wxstn_df$Date, 1, 4)

wxstn_df$months <- months(wxstn_df$Date)
wxstn_df$months <- factor(wxstn_df$months, levels = c("January", "February", "March", "April",
                                                      "May", "June", "July", "August", "September",
                                                      "October", "November", "December"))
wxstn_df$dates <- substr(wxstn_df$Date, 6, 10)
wxstn_df$dates <- as.Date(wxstn_df$dates, "%m-%d")

wind_df$Day <- as.Date(wind_df$Day, "%Y-%m-%d")
wind_df$months <- months(wind_df$Day)
