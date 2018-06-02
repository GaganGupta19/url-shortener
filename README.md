>Question 1's solution is present in the parent directory as question_1.rb


>CSV's format for the urls is present in the parent directory as well

>API endpoints

>> Search

`GET    /api/v1/features/url_shorteners/:unique_key`

>>Listing

`GET    /api/v1/features/url_shorteners`

>>Create

`POST   /api/v1/features/url_shorteners`

```
Body

pass JSON as: 
{ "url": "example.com" }

```
 
>>Delete 
 
`DELETE /api/v1/features/url_shorteners/:unique_key` 

> Refer Routes for more details

`rails routes`