CREATE TABLE "users" (
  "id" INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  "email" TEXT NOT NULL UNIQUE,
  "password" TEXT NOT NULL,
  "playerName" TEXT NOT NULL,
  "date_created" TIMESTAMPTZ DEFAULT NOW()
);
