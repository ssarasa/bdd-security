
Narrative: 

In order to protect the integrity of my session and the confidentiality of my data
As a user
I want to verify that there are no weaknesses in the session management implementation

Meta: @story SessionManagement

Scenario: Issue a new session ID after authentication
Meta: @id session_fixation
Given the login page
And the value of the session cookie is noted
When the default user logs in with credentials from: users.table
And the user is logged in
Then the value of the session cookie issued after authentication should be 
		different from that of the previously noted session ID


Scenario: Invalidate the session when the user logs out
Meta: @id session_logout
Given the default user logs in with credentials from: users.table
And the user is logged in
When the user logs out
Then the user is not logged in


Scenario: Invalidate the session after a period of inactivity
Meta: @id session_inactive_timeout
@skip
Given the default user logs in with credentials from: users.table
And the user is logged in
When the session is inactive for 15 minutes
Then the user is not logged in


Scenario: Set the 'secure' flag on the session cookie
Meta: @id session_cookie_secure
Given the default user logs in with credentials from: users.table
And the user is logged in
And the value of the session cookie is noted
Then the session cookie should have the secure flag set


Scenario: Set the 'httpOnly' flag on the session cookie
Meta: @id session_cookie_httponly
Given the default user logs in with credentials from: users.table
And the user is logged in
Then the session cookie should have the httpOnly flag set