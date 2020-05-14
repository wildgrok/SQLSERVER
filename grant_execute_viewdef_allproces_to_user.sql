use [CCL_DOMAIN_DATA]
GO
--GRANT EXECUTE ON [dbo].[USP_AIRPORT_BY_PORT] TO [CARNIVAL\NadeemA]
--GRANT VIEW DEFINITION ON [dbo].[USP_AIRPORT_BY_PORT] TO [CARNIVAL\NadeemA]
--GO

DECLARE c1 CURSOR
READ_ONLY
FOR select name from sysobjects where type = 'p'
    and name like 'usp_%'

DECLARE @name varchar(100)
OPEN c1

FETCH NEXT FROM c1 INTO @name
WHILE (@@fetch_status <> -1)
BEGIN
	IF (@@fetch_status <> -2)
	BEGIN
--		PRINT 'add user defined code here'
--		eg.
		DECLARE @message varchar(1000)
		SELECT @message = 'GRANT EXECUTE ON ' + @name + ' TO [CARNIVAL\NadeemA]'
		EXEC(@message)
		SELECT @message = 'GRANT VIEW DEFINITION ON ' + @name + ' TO [CARNIVAL\NadeemA]'
		EXEC(@message)
		
		
	END
	FETCH NEXT FROM c1 INTO @name
END

CLOSE c1
DEALLOCATE c1
GO

/*
GRANT EXECUTE ON USP_GET_ALL_EXCURSIONS_BY_OPERATOR TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_EXCURSION_OFFERINGS TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_OPERATORS_BY_PORT TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_REVISION_TYPES TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_EXCURSIONS TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_EXCURSIONS_FROM_PORT_DATE_TIME TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_EXCURSION_DATE TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_PORTS_BY_ITINCODE TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_SHIPS_FROM_EXCURSIONS TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_PURGE_EXCURSION_DEPARTURES TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_ACTIVE_SHIPS TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_AIRPORT_CITY_NAMES TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_AIRPORT_ADDRESS_LOOKUP TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_AIRLINE_NAMES TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_AIRPORT_BY_PORT TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_AIRPORT_ALL_NAMES TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_AIRPORT_CITY_CODES_LOOKUP TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_PORT_NAMES TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_ALL_CARRIERS TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_ALL_COUNTRIES TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_INSERT_GROUP_SAILINGS TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_ALL_REGIONS TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_EXCURSIONS_FOR_GLOBALPRICING TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_GROUP_SAILINGS TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_CITY_CODES_LOOKUP TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_DB_INDEX_MAINT TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_DESTINATIONS TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_AIRPORTS TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_AIRPORT_CITIES TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_CABIN_LEAD_CATEGORIES TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_COUNTRIES TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_EMBK_PORTS TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_SAILINGID TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_ITINERARIES TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_ITINERARY_DETAILS TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_ITINERARY_RES_PORTS TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_RES_PORTS TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_SHIPS TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_STATES TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_SUB_REGIONS TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_DESTINATION_PORT_SHIP TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_CABIN_AND_LEAD_CATEGORIES TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_CABIN_DETAIL_BY_CABINNUM TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_CABIN_LEAD_CAT_FROM_CABIN_CAT TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_DECKS_BY_SHIPCODE TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_DESTINATION_DURATION_RANGE TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_EXCURSION_PRICING TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_FLEET_OVERVIEW TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ITINERARIES_BY_SHIPCODE TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_SHIP_DECK_CAT TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ITINERARIES_FROM_PORT TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ITINERARY_DETAILS_BY_ITINCODE_EMBARKPORTCODE_AND_DURDAYS TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ITINERARY_DETAILS_BY_SUBREGIONCODE TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ITINERARY_PORTS_BY_ITINCODE TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_PRODUCTS_BAK TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_PORTS_BY_SUBREGIONCODE_AND_SAILDATE TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_PRODUCTS TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_RELATED_SUBREGIONS_BY_SUBREGIONCODE TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_PRODUCTS_GBackupDR85817 TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_SAILINGS_FROM_PORT TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_SHIP_BY_SHIPCODE TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_SHORT_ITINERARY_DETAILS TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_SUB_REGION_DETAIL_BY_SUBREGIONCODE TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_ITINERARY_ORG_LOCATION TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_LIST_DATA_DICTIONARY TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_PORT_LOCATION TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_SAILDATE_BY_SHIP TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_SPECIFIC_ITIN_LOOKUP TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_AIRPORT_NAME_BY_AIRPORTCODE TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_RETURN_PRODUCTFILE_INFO TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_EXCURSION_ACTIVITY_CODES TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_SAILDATE_BY_SHIP_BACKUPdep40751 TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_EXCURSION_RECORD_TYPES TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_PRICINGSHEET_ACTIVITYHEADER TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_CATEGORIES TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_SAILDATE_DURDAYS_BY_SHIPCODE TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_FARECODES TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_INTL_COUNTRIES TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_INTL_STATES TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_UPDATEPRICING TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_SAILINGS_GROUPED_BY_SAILDATE_SUB_REGION_DUR_DAYS TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_SHIPS_PG TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_SHIPS_INCL_DECOMMISSIONED TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ACTIVE_SHIPS TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ALL_SAILDATE_BY_SHIP TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_VISITOR_BY_FUTURE_SAILING TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_SHIPCODE_BY_SAILID TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_SAILDATE_BY_SHIP TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ITINERARY_DETAILS_BY_SUBREGIONCODE_AND_GROUPCODE TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ITINERARY_DETAILS_BY_GROUPCODE TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_ITINERARIES_BY_SHIPCODE_AND_GROUPCODE TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_SAILINGS_GROUPED_BY_SAILDATE_SUB_REGION_DUR_DAYS_BAK TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_CREATE_SAILING_AVAILABILITY TO [CARNIVAL\NadeemA]
GRANT EXECUTE ON USP_GET_SAILING_AVAILABILITY TO [CARNIVAL\NadeemA]



*/