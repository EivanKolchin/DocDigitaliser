# DocDigitaliser
Heidi - Hackathon, Digitising the Analog Health Record. We Created a software which aids the conversion of the more inconvenient analogue medical documents into digital copies.

## Local setup

Run the helper script to capture the MongoDB connection strings that power the service:

```bash
./setup.sh
```

The script asks for two separate MongoDB URIs:

1. `MONGODB_PRIMARY_URI` – the database the live DocDigitaliser application writes to and reads from.
2. `MONGODB_ARCHIVE_URI` – an optional secondary database or cluster reserved for long-term storage of the digitised records.

If you do not manage an independent archive database, enter the same MongoDB connection string at both prompts. The script will write the values to a local `.env` file that can be consumed by the application runtime.
