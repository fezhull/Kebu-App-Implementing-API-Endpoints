# Kebu API Documentation
Base URL:
https://gateway-test.kebu.io

<img width="175" alt="Screenshot 2025-01-01 112858" src="https://github.com/user-attachments/assets/d256d8de-10db-43f5-abe6-32ac64c5d4cf" />

<img width="180" alt="Screenshot 2025-01-01 111435" src="https://github.com/user-attachments/assets/45d0bc2d-3d4f-4af5-bb76-1b58c0675868" />

<img width="182" alt="Screenshot 2025-01-01 111240" src="https://github.com/user-attachments/assets/1f632b26-86a0-41c5-a547-2242e17d6a9f" />


<img width="177" alt="Screenshot 2025-01-01 111049" src="https://github.com/user-attachments/assets/6dc4e8c7-0bc6-4a58-9d5e-93a878220195" />

<img width="174" alt="Screenshot 2025-01-01 111702" src="https://github.com/user-attachments/assets/80dbab71-f107-4403-82b6-64dd863435ae" />


<img width="174" alt="Screenshot 2025-01-01 111810" src="https://github.com/user-attachments/assets/60854f64-904b-4f36-971d-eacafdce736f" />

## To clarify the documentation for your API endpoints and improve its structure, I'll rewrite it more clearly while keeping all the essential details intact. Here’s how the documentation for these endpoints can be organized:

#Kebu API Documentation
Base URL:
https://gateway-test.kebu.io

# 1. POST /api/account/v2/auth/token
## Description:
This endpoint allows users to obtain an authentication token by providing their username, password, and category (e.g., CLIENT).

## Request Body:

{

  "username": "0111483335",
  
  "password": "perminus12",
  
  "deviceId": null,
  
  "category": "CLIENT"

}

## Response:

{

  "access_token": "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJlU002a...FZbGdjIn09",
  
  "refresh_token": "eyJhbGciOiJIUzUxMiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICI4YTNiNzYyNi00ZjYyLTQwOWMtYWY2Ni03NGFjMWVhYThhYmIifQ"
  
}


## 2. POST /api/account/v2/token/refresh
## Description:
This endpoint allows users to refresh their access token using the provided refresh token. It also requires a category (e.g., CLIENT).

## Request Body:

{

  "refreshToken": "eyJhbGciOiJIUzUxMiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICI4YTNiNzYyNi00ZjYyLTQwOWMtYWY2Ni03NGFjMWVhYThhYmIifQ",
  
  "category": "CLIENT"

}

## Response:
{

  "access_token": "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJlU002a...FZbGdjIn09",
  
  "refresh_token": "eyJhbGciOiJIUzUxMiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICI4YTNiNzYyNi00ZjYyLTQwOWMtYWY2Ni03NGFjMWVhYThhYmIifQ"

}


## To clarify the documentation for your API endpoints and improve its structure, I'll rewrite it more clearly while keeping all the essential details intact. Here’s how the documentation for these endpoints can be organized:


## 1. POST /api/account/v2/auth/token
## Description:
## This endpoint allows users to obtain an authentication token by providing their username, password, and category (e.g., CLIENT).

## Request Body:


{

  "username": "0111483335",
  
  "password": "perminus12",
  
  "deviceId": null,
  
  "category": "CLIENT"

}

## Response:


{

  "access_token": "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJlU002a...FZbGdjIn09",
  
  "refresh_token": "eyJhbGciOiJIUzUxMiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICI4YTNiNzYyNi00ZjYyLTQwOWMtYWY2Ni03NGFjMWVhYThhYmIifQ"

}


## 2. POST /api/account/v2/token/refresh

## Description:

This endpoint allows users to refresh their access token using the provided refresh token. It also requires a category (e.g., CLIENT).

## Request Body:

{
  "refreshToken": "eyJhbGciOiJIUzUxMiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICI4YTNiNzYyNi00ZjYyLTQwOWMtYWY2Ni03NGFjMWVhYThhYmIifQ",
  
  "category": "CLIENT"
}

## Response:


{

  "access_token": "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJlU002a...FZbGdjIn09",
  
  "refresh_token": "eyJhbGciOiJIUzUxMiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICI4YTNiNzYyNi00ZjYyLTQwOWMtYWY2Ni03NGFjMWVhYThhYmIifQ"

}

## 3. GET /api/v1/profile/public/error/codes

## Description:

This endpoint fetches a list of predefined error codes that the system may return during operations.

## Request Body:

## No request body is needed for this endpoint.

## Response:

{

  "errorCodes": 
  
  [
{

  "LA-001": "Similar transaction in progress. Try again later!"
  
    },
    
    {
    
      "WB-001": "Wallet balance error!"
      
    },
    
    {
    
      "DOR-001": "Drop-off rebound error!"
      
    }
    
  ]

}



## Endpoints:

## The above three endpoints are key parts of the authentication and error handling system.

POST /api/account/v2/auth/token: Get an authentication token with username, password, and category.

POST /api/account/v2/token/refresh: Refresh the access token using a provided refresh token.

GET /api/v1/profile/public/error/codes: Fetch error codes used across the platform.



