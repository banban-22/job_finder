## User Story
* As a non-experience job searcher, I want a platform that can easily looking for and apply jobs, and also manage where I applied and my status, so that I don't need other tools/platforms

## Features (Acceptance Criteria)
* User authentication

* Job Search Option
    location, job-types

* Job Categories
    Categories(Tagging) each job, so that the job-searchers are able to looking for their favoured jobs

* Applying to Jobs from this website by clicking "Apply" button

* Analytics
    Users can see the applications they submitted

* Mailer Option
    can get notification when the "Favourite" job is updated

* Company Overview and reviews

* Job saved(favourited) option

* Recruiters also can "Reject" button

### Jobs(db) 
title
description
company
location
view_count
saved_count

### Reviews(db)
title
content
job_title
location
is_current
rating

### Users(db)
first_name
last_name
email
password
password_confirmation