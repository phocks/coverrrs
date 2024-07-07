/*
  Warnings:

  - Added the required column `imageId` to the `Cover` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Cover" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "urlId" TEXT NOT NULL,
    "imageId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "published" BOOLEAN NOT NULL DEFAULT false,
    "userId" INTEGER,
    CONSTRAINT "Cover_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Cover" ("createdAt", "description", "id", "published", "title", "updatedAt", "urlId", "userId") SELECT "createdAt", "description", "id", "published", "title", "updatedAt", "urlId", "userId" FROM "Cover";
DROP TABLE "Cover";
ALTER TABLE "new_Cover" RENAME TO "Cover";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
