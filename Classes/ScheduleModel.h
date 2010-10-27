/**
*
*Copyright 2010 Microsoft Corp
*
*Licensed under the Apache License, Version 2.0 (the "License");
*you may not use this file except in compliance with the License.
*You may obtain a copy of the License at
*
*http://www.apache.org/licenses/LICENSE-2.0
*
*Unless required by applicable law or agreed to in writing, software
*distributed under the License is distributed on an "AS IS" BASIS,
*WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
*See the License for the specific language governing permissions and
*limitations under the License.
*/
/**
* This code was generated by the tool 'odatagen'.
* Runtime Version:1.0
*
* Changes to this file may cause incorrect behavior and will be lost if
* the code is regenerated.
*/
/**
* Defines default Data Service URL for this proxy class
*/
#define DEFAULT_SERVICE_URL @""

#define DataServiceVersion @"1.0"

#import "ODataObject.h"
#import "ObjectContext.h"
#import "DataServiceQuery.h"
#import "ODataGUID.h"
#import "ODataBool.h"
#import  "mProperties.h"


/**
 * @interface:Schedule
 * @Type:EntityType
 
 * @key:Id* 
 */
@interface Schedule : ODataObject
{
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_Id;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_Error;
	
	/**
	* @Type:NavigationProperty
	* @Relationship:Schedule_Tracks
	* @FromRole:Schedule
	* @ToRole:Tracks
	*/
	NSMutableArray *m_Tracks;
	
	/**
	* @Type:NavigationProperty
	* @Relationship:Schedule_TimeSlots
	* @FromRole:Schedule
	* @ToRole:TimeSlots
	*/
	NSMutableArray *m_TimeSlots;
	
	/**
	* @Type:NavigationProperty
	* @Relationship:Schedule_Speakers
	* @FromRole:Schedule
	* @ToRole:Speakers
	*/
	NSMutableArray *m_Speakers;
	
	/**
	* @Type:NavigationProperty
	* @Relationship:Schedule_Sessions
	* @FromRole:Schedule
	* @ToRole:Sessions
	*/
	NSMutableArray *m_Sessions;
	
}

@property ( nonatomic , retain , getter=getId , setter=setId: ) NSString *m_Id;
@property ( nonatomic , retain , getter=getError , setter=setError: ) NSString *m_Error;
@property ( nonatomic , retain , getter=getTracks , setter=setTracks: )NSMutableArray *m_Tracks;
@property ( nonatomic , retain , getter=getTimeSlots , setter=setTimeSlots: )NSMutableArray *m_TimeSlots;
@property ( nonatomic , retain , getter=getSpeakers , setter=setSpeakers: )NSMutableArray *m_Speakers;
@property ( nonatomic , retain , getter=getSessions , setter=setSessions: )NSMutableArray *m_Sessions;

+ (id) CreateScheduleWithid:(NSString *)Id;
- (id) init;
- (id) initWithUri:(NSString*)anUri;
@end

/**
 * @interface:Session
 * @Type:EntityType
 
 * @key:SessionId* 
 */
@interface Session : ODataObject
{
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_SessionState;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_Tags;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.Guid
	*/
	NSString *m_SessionId;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_TrackId;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.Guid
	*/
	NSString *m_TimeSlotId;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_Code;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_TwitterHashtag;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_ThumbnailUrl;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_ShortUrl;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_Room;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.Int32
	*/
	NSNumber *m_StartTime;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_ShortTitle;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_ShortDescription;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_FullTitle;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_FullDescription;
	
	/**
	* @Type:NavigationProperty
	* @Relationship:Session_Manifests
	* @FromRole:Session
	* @ToRole:Manifests
	*/
	NSMutableArray *m_Manifests;
	
	/**
	* @Type:NavigationProperty
	* @Relationship:Session_Presenters
	* @FromRole:Session
	* @ToRole:Presenters
	*/
	NSMutableArray *m_Presenters;
	
	/**
	* @Type:NavigationProperty
	* @Relationship:Session_DownloadableContent
	* @FromRole:Session
	* @ToRole:DownloadableContent
	*/
	NSMutableArray *m_DownloadableContent;
	
	/**
	* @Type:NavigationProperty
	* @Relationship:Session_BackgroundMaterials
	* @FromRole:Session
	* @ToRole:BackgroundMaterials
	*/
	NSMutableArray *m_BackgroundMaterials;
	
	/**
	* @Type:NavigationProperty
	* @Relationship:Session_RelatedSessions
	* @FromRole:Session
	* @ToRole:RelatedSessions
	*/
	NSMutableArray *m_RelatedSessions;
	
}

@property ( nonatomic , retain , getter=getSessionState , setter=setSessionState: ) NSString *m_SessionState;
@property ( nonatomic , retain , getter=getTags , setter=setTags: ) NSString *m_Tags;
@property ( nonatomic , retain ,  getter=getSessionId , setter=setSessionId: )NSString *m_SessionId;
@property ( nonatomic , retain , getter=getTrackId , setter=setTrackId: ) NSString *m_TrackId;
@property ( nonatomic , retain ,  getter=getTimeSlotId , setter=setTimeSlotId: )NSString *m_TimeSlotId;
@property ( nonatomic , retain , getter=getCode , setter=setCode: ) NSString *m_Code;
@property ( nonatomic , retain , getter=getTwitterHashtag , setter=setTwitterHashtag: ) NSString *m_TwitterHashtag;
@property ( nonatomic , retain , getter=getThumbnailUrl , setter=setThumbnailUrl: ) NSString *m_ThumbnailUrl;
@property ( nonatomic , retain , getter=getShortUrl , setter=setShortUrl: ) NSString *m_ShortUrl;
@property ( nonatomic , retain , getter=getRoom , setter=setRoom: ) NSString *m_Room;
@property ( nonatomic , retain , getter=getStartTime , setter=setStartTime: )NSNumber *m_StartTime;
@property ( nonatomic , retain , getter=getShortTitle , setter=setShortTitle: ) NSString *m_ShortTitle;
@property ( nonatomic , retain , getter=getShortDescription , setter=setShortDescription: ) NSString *m_ShortDescription;
@property ( nonatomic , retain , getter=getFullTitle , setter=setFullTitle: ) NSString *m_FullTitle;
@property ( nonatomic , retain , getter=getFullDescription , setter=setFullDescription: ) NSString *m_FullDescription;
@property ( nonatomic , retain , getter=getManifests , setter=setManifests: )NSMutableArray *m_Manifests;
@property ( nonatomic , retain , getter=getPresenters , setter=setPresenters: )NSMutableArray *m_Presenters;
@property ( nonatomic , retain , getter=getDownloadableContent , setter=setDownloadableContent: )NSMutableArray *m_DownloadableContent;
@property ( nonatomic , retain , getter=getBackgroundMaterials , setter=setBackgroundMaterials: )NSMutableArray *m_BackgroundMaterials;
@property ( nonatomic , retain , getter=getRelatedSessions , setter=setRelatedSessions: )NSMutableArray *m_RelatedSessions;

+ (id) CreateSessionWithsessionid:(NSString *)SessionId timeslotid:(NSString *)TimeSlotId starttime:(NSNumber *)StartTime;
- (id) init;
- (id) initWithUri:(NSString*)anUri;
@end

/**
 * @interface:Track
 * @Type:EntityType
 
 * @key:Name* 
 */
@interface Track : ODataObject
{
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_Name;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_Title;
	
}

@property ( nonatomic , retain , getter=getName , setter=setName: ) NSString *m_Name;
@property ( nonatomic , retain , getter=getTitle , setter=setTitle: ) NSString *m_Title;

+ (id) CreateTrackWithname:(NSString *)Name;
- (id) init;
- (id) initWithUri:(NSString*)anUri;
@end

/**
 * @interface:TimeSlot
 * @Type:EntityType
 
 * @key:Id* 
 */
@interface TimeSlot : ODataObject
{
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_Duration;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.Guid
	*/
	NSString *m_Id;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.DateTime
	*/
	NSDate *m_Start;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_StartString;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.DateTime
	*/
	NSDate *m_End;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_EndString;
	
}

@property ( nonatomic , retain , getter=getDuration , setter=setDuration: ) NSString *m_Duration;
@property ( nonatomic , retain ,  getter=getId , setter=setId: )NSString *m_Id;
@property ( nonatomic , retain , getter=getStart , setter=setStart: )NSDate *m_Start;
@property ( nonatomic , retain , getter=getStartString , setter=setStartString: ) NSString *m_StartString;
@property ( nonatomic , retain , getter=getEnd , setter=setEnd: )NSDate *m_End;
@property ( nonatomic , retain , getter=getEndString , setter=setEndString: ) NSString *m_EndString;

+ (id) CreateTimeSlotWithid:(NSString *)Id start:(NSDate *)Start end:(NSDate *)End;
- (id) init;
- (id) initWithUri:(NSString*)anUri;
@end

/**
 * @interface:Speaker
 * @Type:EntityType
 
 * @key:Id* 
 */
@interface Speaker : ODataObject
{
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.Guid
	*/
	NSString *m_Id;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_FullName;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_PhotoUrl;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_Bio;
	
}

@property ( nonatomic , retain ,  getter=getId , setter=setId: )NSString *m_Id;
@property ( nonatomic , retain , getter=getFullName , setter=setFullName: ) NSString *m_FullName;
@property ( nonatomic , retain , getter=getPhotoUrl , setter=setPhotoUrl: ) NSString *m_PhotoUrl;
@property ( nonatomic , retain , getter=getBio , setter=setBio: ) NSString *m_Bio;

+ (id) CreateSpeakerWithid:(NSString *)Id;
- (id) init;
- (id) initWithUri:(NSString*)anUri;
@end

/**
 * @interface:Manifest
 * @Type:EntityType
 
 * @key:Id* 
 */
@interface Manifest : ODataObject
{
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_Id;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_Format;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_Url;
	
}

@property ( nonatomic , retain , getter=getId , setter=setId: ) NSString *m_Id;
@property ( nonatomic , retain , getter=getFormat , setter=setFormat: ) NSString *m_Format;
@property ( nonatomic , retain , getter=getUrl , setter=setUrl: ) NSString *m_Url;

+ (id) CreateManifestWithid:(NSString *)Id;
- (id) init;
- (id) initWithUri:(NSString*)anUri;
@end

/**
 * @interface:Presenter
 * @Type:EntityType
 
 * @key:Id* 
 */
@interface Presenter : ODataObject
{
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.Guid
	*/
	NSString *m_Id;
	
}

@property ( nonatomic , retain ,  getter=getId , setter=setId: )NSString *m_Id;

+ (id) CreatePresenterWithid:(NSString *)Id;
- (id) init;
- (id) initWithUri:(NSString*)anUri;
@end

/**
 * @interface:Content
 * @Type:EntityType
 
 * @key:Id* 
 */
@interface Content : ODataObject
{
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_Title;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_Description;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_Id;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:
	* @FixedLength:
	*/
	NSString *m_Url;
	
}

@property ( nonatomic , retain , getter=getTitle , setter=setTitle: ) NSString *m_Title;
@property ( nonatomic , retain , getter=getDescription , setter=setDescription: ) NSString *m_Description;
@property ( nonatomic , retain , getter=getId , setter=setId: ) NSString *m_Id;
@property ( nonatomic , retain , getter=getUrl , setter=setUrl: ) NSString *m_Url;

+ (id) CreateContentWithid:(NSString *)Id;
- (id) init;
- (id) initWithUri:(NSString*)anUri;
@end

/**
 * @interface:RelatedSession
 * @Type:EntityType
 
 * @key:SessionId* 
 */
@interface RelatedSession : ODataObject
{
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.Guid
	*/
	NSString *m_SessionId;
	
}

@property ( nonatomic , retain ,  getter=getSessionId , setter=setSessionId: )NSString *m_SessionId;

+ (id) CreateRelatedSessionWithsessionid:(NSString *)SessionId;
- (id) init;
- (id) initWithUri:(NSString*)anUri;
@end

/**
 * Container interface ScheduleModel, Namespace: Shared.Model
 */
@interface ScheduleModel : ObjectContext
{
	 NSString *m_OData_etag;
	 DataServiceQuery *m_ScheduleOfEvents;
	 DataServiceQuery *m_Sessions;
	 DataServiceQuery *m_Tracks;
	 DataServiceQuery *m_TimeSlots;
	 DataServiceQuery *m_Speakers;
	 DataServiceQuery *m_Manifests;
	 DataServiceQuery *m_Presenters;
	 DataServiceQuery *m_Contents;
	 DataServiceQuery *m_RelatedSessions;
	
}

@property ( nonatomic , retain , getter=getEtag , setter=setEtag: )NSString *m_OData_etag;
@property ( nonatomic , retain , getter=getScheduleOfEvents , setter=setScheduleOfEvents: ) DataServiceQuery *m_ScheduleOfEvents;
@property ( nonatomic , retain , getter=getSessions , setter=setSessions: ) DataServiceQuery *m_Sessions;
@property ( nonatomic , retain , getter=getTracks , setter=setTracks: ) DataServiceQuery *m_Tracks;
@property ( nonatomic , retain , getter=getTimeSlots , setter=setTimeSlots: ) DataServiceQuery *m_TimeSlots;
@property ( nonatomic , retain , getter=getSpeakers , setter=setSpeakers: ) DataServiceQuery *m_Speakers;
@property ( nonatomic , retain , getter=getManifests , setter=setManifests: ) DataServiceQuery *m_Manifests;
@property ( nonatomic , retain , getter=getPresenters , setter=setPresenters: ) DataServiceQuery *m_Presenters;
@property ( nonatomic , retain , getter=getContents , setter=setContents: ) DataServiceQuery *m_Contents;
@property ( nonatomic , retain , getter=getRelatedSessions , setter=setRelatedSessions: ) DataServiceQuery *m_RelatedSessions;

- (id) init;
- (id) initWithUri:(NSString*)anUri credential:(id)acredential;
- (id) scheduleofevents;
- (id) sessions;
- (id) tracks;
- (id) timeslots;
- (id) speakers;
- (id) manifests;
- (id) presenters;
- (id) contents;
- (id) relatedsessions;
- (void) addToScheduleOfEvents:(id)anObject;
- (void) addToSessions:(id)anObject;
- (void) addToTracks:(id)anObject;
- (void) addToTimeSlots:(id)anObject;
- (void) addToSpeakers:(id)anObject;
- (void) addToManifests:(id)anObject;
- (void) addToPresenters:(id)anObject;
- (void) addToContents:(id)anObject;
- (void) addToRelatedSessions:(id)anObject;

@end