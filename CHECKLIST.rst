CSV2IATI Checklist
==================

We should know which code is 'ours'
-----------------------------------
Currently we host this application, but we no longer develop it.

Our mantainance is just enough to keep it running. 

The plan is that this functionality will be offered elsewhere.

All code should have a lead person identified
---------------------------------------------
No-one is really looking after this now. Contact Wendy Rogers for questions.

Our projects/code should be appropriately branded.
--------------------------------------------------
This site has an IATI logo, but other than that the branding is freeform.

Our code/projects should be in version control and present links to issue trackers and source code.
---------------------------------------------------------------------------------------------------
This is in GitHub. Live code has links to source code. There is an email
address for contatcting support.

There is no direct link to the issuer tracker.

Each piece of code should have a document, a roadmap, and estimate of resources, and a licence.
-----------------------------------------------------------------------------------------------
'MIT Licensed' appears in the footer, but is not linked to anything.

No real public roadmap, or estimate of resources, however IATI is commited
to not maintaining this software into the future.

We should be confident that updates to our code will not break existing functionality
-------------------------------------------------------------------------------------
There are no tests set up on this code. The GitHub repository is linked up with Travis, so
something is run on each commit.

It should make sense in the way people access our tools/code
------------------------------------------------------------
Yes, this on our domain: http://csv2iati.iatistandard.org/

Our code should be on our servers
---------------------------------
Code is on our servers, we have Google analytics in place.

Status of the software should be indicated in the deployments
-------------------------------------------------------------
We only have the live version of this software. As we are no longer actively
developing it, we don't run a development copy.

We should know how our code is being used - logs!
-------------------------------------------------
We only have Google Analytics.

Our code will need to adapt with schema changes and changes to external systems upon which it relies
----------------------------------------------------------------------------------------------------
This code does need to be aware of both changes to schema and codelists.
It has not been updated to create version 2.01 data.

Developers should be able to find useful resources and help easily
------------------------------------------------------------------
The GitHub repository is linked to from the application

Each project should clearly describe how other developers can get involved
--------------------------------------------------------------------------
This project has a CONTRIBUTING.rst file

We should be able to communicate with the users of our code.
------------------------------------------------------------
| Messages can be placed on the home page of the application
| Users do login and create accounts on this software.
| Email communication is not built into the application.

Users should be able to communicate with us about our code
----------------------------------------------------------
| There is a link to GitHub
| There is an email address to IATI support.

We should protect our users privacy
-----------------------------------
| We do store user data in this application.
| There is no privacy policy.
| There are no terms and conditions.
| We host the IATI data that is created by the application

We should be clear about how we work with contractors
-----------------------------------------------------
N/A

If our code works with IATI data, have we considered how it will work as the IATI datasets grow, both in terms of individual file size and as a corpus
------------------------------------------------------------------------------------------------------------------------------------------------------
This application is designed to be used by publishers with up to a few thousand IAIT activities. We know it is used by people with far 
greater numbers of activities than that. It seems to work on the whole.

Our code should be secure
-------------------------
The GitHub repository is linked up to requires.io for alerts on python package changes.

We should know that our deployed code is working properly
---------------------------------------------------------
Not sure what is in place here.

Our code should be simple to deploy and update
----------------------------------------------
Deployment is described in the README.rst

Are we using any other tools to help us monitor our code?
---------------------------------------------------------
GitHub webhooks:

* Travis
* Requires.io
* Gemnasium
* ReadTheDocs

Is this code language aware?
----------------------------
Some work has been done here on handling user input. It can also allow some translations on some fields.
