Flexible-api-example
====================

Getting Started
---------------

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc.

After setting up, you can run the application using:

    % padrino start

Querying
--------

Once running you can query the API using the following syntax:

Return all contacts:

    /v1/contacts


Return all contacts and include phones:

    /v1/contacts?includes=phones

Return all contacts that match a ransack query:

    /v1/contacts?q[name_start]=Jim

Return all contacts that match a deep ransack query:

    /v1/contacts/?includes=phones&q[phones_number_eq]=555-555-1212

Return all contacts that match a ransack query and include phones:

    /v1/contacts?q[name_start]=Jim&includes=phones

Return single contact:

    /v1/contacts/1

Return single contact and include phones:

    /v1/contacts/1?includes=phones
