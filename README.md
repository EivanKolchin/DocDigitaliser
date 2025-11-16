# DocDigitaliser
Heidi - Hackathon, Digitising the Analog Health Record. We Created a software which aids the conversion of the more inconvenient analogue medical documents into digital copies.

## Local setup

Run one of the helper scripts to capture the MongoDB connection strings that power the service:

```bash
# macOS / Linux
./setup.sh

# Windows (from PowerShell or Command Prompt)
setup.bat
```

The script asks for two separate MongoDB URIs:

1. `MONGODB_PRIMARY_URI` – the database the live DocDigitaliser application writes to and reads from.
2. `MONGODB_ARCHIVE_URI` – an optional secondary database or cluster reserved for long-term storage of the digitised records.

If you do not manage an independent archive database, simply press **Enter** when prompted for the archive connection string and the helper will reuse the primary URI for both values. The scripts write the values to a local `.env` file that can be consumed by the application runtime.

## Heidi API quickstart

DocDigitaliser communicates with Heidi's sandbox APIs for OCR, chat, and patient data. To authenticate:

1. Use the shared hackathon API key `S0bguqmD4PyN2yMp23L6419DfjBY44D2` to generate a JWT following the [Heidi authentication guide](https://www.heidihealth.com/developers/heidi-api/authentication#authenticate-with-the-api).
2. Provide any valid email address and a random integer ID when requesting the JWT, as the sandbox accepts arbitrary identifiers.
3. Query the published patient sessions when testing end-to-end flows:
   - Marley Joey – `79961964682388047095265137904427292452` or `2911141399900658373248683184776191109`
   - Justy Collyn – `198546453983809752417647477029109534577`
   - Scottie Stacy – `53369520706978908329129208208788026741`
   - Tayler Shelley – `126710765043013037596060241247978536320` or `204282286603551972702961504135244682507`

These API requirements do not introduce an additional MongoDB backend, so keeping a single connection string (or reusing it for the archive URI) is perfectly valid until a dedicated archive cluster is provisioned.
