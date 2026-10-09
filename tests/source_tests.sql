{{ config(severity='error') }}

SELECT
    BOOKING_ID,
    BOOKING_AMOUNT
FROM {{ source('staging', 'bookings') }}
WHERE BOOKING_AMOUNT < 0
   OR BOOKING_AMOUNT IS NULL
