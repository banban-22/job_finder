## Framwork: Rails
## Database: Postgresql

## User Story
### Title
* Job_Finder

### Description
* As a job searcher, I want a platform that can easily search and apply jobs, and also manage to where I applied and my curret status, so that I don't need other tools/platforms

* Recruiters are not allowed to apply any jobs

* Only users who create a job description can edit and delete those jobs

* the users who write review and admin are only allowed to delete review

### Acceptance Criteria
* The recruiters are allowed to change applicants' application      status while non-recruiters are not allowed

## Features (Acceptance Criteria)
* User authentication

* Job Search by Title

* Job Categories
    Categories(Tagging) each job, so that the job-searchers are able to looking for their favoured jobs

* Applying to Jobs from this website by clicking "Apply" button

* Analytics
    Users can see the applications they submitted

* Mailer Option
    can get notification when the "Favourite" job is updated
    Recruiters can get email when users wrote a review and applied for their jobs

* Add reviews

* Job saved(favourited) option (users can check them as a list)

* Only recruiters can change applicaiton status

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