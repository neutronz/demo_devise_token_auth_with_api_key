# Overview
Proof of concept for authentication using

1. email/password
2. api token

There's no one signle gem that handles both email/password and api token authentication at the same time. We've chosen to use and extend: ``devise_token_auth``

## DeviseTokenAuth
Is it self an add on to the popular ``devise`` gem. It adds authentication helper methods like current_user, ect. Also, allows for cookieless authentication.

## Why we need to extend this?
In order to continue using the Authentication HTTP header, we need to add that method of authentication to ``devise_token_auth`` to maintain a seemless authentication process outside of any downstream applications.
