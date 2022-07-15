-- Keep a log of any SQL queries you execute as you solve the mystery.

-- look at the case description
SELECT description FROM crime_scene_reports WHERE year = 2021 AND month = 7 AND day = 28 AND street = "Humphrey Street";

-- look at the witnesses interviews
SELECT name, transcript FROM interviews WHERE year = 2021 AND month = 7 AND day = 28 AND transcript LIKE "%bakery%";

-- three witnesses are ruth, eugene and raymond. check atm transactions as eugene said and finding suspects
SELECT name, people.id FROM people
JOIN bank_accounts ON people.id = bank_accounts.person_id
JOIN atm_transactions ON bank_accounts.account_number = atm_transactions.account_number
WHERE atm_transactions.year = 2021 AND atm_transactions.month = 7 AND atm_transactions.day = 28
AND atm_transactions.atm_location = "Leggett Street" AND atm_transactions.transaction_type = "withdraw";

-- check phone calls, as raymond said, and finding, who from previous list called someone
SELECT name FROM people
JOIN phone_calls ON people.phone_number = phone_calls.caller
WHERE phone_calls.year = 2021 AND phone_calls.month = 7 AND phone_calls.day = 28 AND phone_calls.duration < 60;

-- now suspect list contains only 5 people. check passangers on the earliest flight, as raymond said
SELECT name FROM people
JOIN passengers ON people.passport_number = passengers.passport_number
JOIN flights ON passengers.flight_id = flights.id
WHERE flights.id = (SELECT flights.id FROM flights
JOIN airports ON flights.origin_airport_id = airports.id
WHERE airports.city = "Fiftyville" AND flights.year = 2021 AND flights.month = 7 AND flights.day = 29 ORDER BY hour, minute ASC LIMIT 1);

-- now there is only two people in suspect list. check the bakery security logs, as ruth said
SELECT name FROM people
JOIN bakery_security_logs ON people.license_plate = bakery_security_logs.license_plate
WHERE bakery_security_logs.year = 2021 AND bakery_security_logs.month = 7 AND bakery_security_logs.day = 28
AND bakery_security_logs.minute >= 15 AND bakery_security_logs.minute <= 30;

-- the only one suspect is Bruce. find who is his accomplice
SELECT name FROM people
JOIN phone_calls ON people.phone_number = phone_calls.receiver
WHERE phone_calls.year = 2021 AND phone_calls.month = 7 AND phone_calls.day = 28 AND phone_calls.duration < 60
AND phone_calls.caller = (SELECT phone_number FROM people WHERE people.name = "Bruce");

-- Robin is the accomplice. find where are they
SELECT city FROM airports
JOIN flights ON airports.id = flights.destination_airport_id
WHERE flights.id = (SELECT flights.id FROM flights
JOIN airports ON flights.origin_airport_id = airports.id
WHERE airports.city = "Fiftyville" AND flights.year = 2021 AND flights.month = 7 AND flights.day = 29 ORDER BY hour, minute ASC LIMIT 1);
